# DD Frontender Challenge Mobile

Мобильное Flutter-приложение для поиска врачей и записи на приём. Реализовано по [ТЗ Flutter Developer](https://dd-tz-frontend.vercel.app/) с REST API тестового задания.

## Демо и API

| Ресурс                  | URL                                    |
| ----------------------- | -------------------------------------- |
| API (backend + Swagger) | https://dd-tz-frontend.vercel.app      |
| Web-версия (demo)       | https://dd-tz-frontend-demo.vercel.app |

## Тестовые данные для входа

| Поле   | Значение           |
| ------ | ------------------ |
| Email  | `test@example.com` |
| Пароль | `password`         |

---

## Соответствие требованиям ТЗ

| Требование                             | Реализация                                                      |
| -------------------------------------- | --------------------------------------------------------------- |
| Clean Architecture                     | Слои `core` / `data` / `domain` / `presentation`                |
| State management (BLoC / Provider)     | `flutter_bloc` + Cubit                                          |
| Сетевые запросы (Dio)                  | `dio` + `retrofit`, interceptors, multipart upload              |
| DI (`get_it` + `injectable`)           | `configureDependencies()`, codegen через `build_runner`         |
| Навигация (`go_router` / `auto_route`) | `go_router` + typed routes (`go_router_builder`)                |
| Unit-тесты UseCases и Repositories     | Тесты репозиториев + cubit-тесты (бизнес-логика UI-слоя)        |
| README: архитектура + запуск           | Этот файл                                                       |
| SOLID, Clean Code                      | Разделение слоёв, `UseCase<T, Params>`, интерфейсы репозиториев |
| Обработка ошибок и логирование         | `Either<Failure, T>`, `Talker` + `TalkerDioLogger`              |

---

## Что реализовано

### Авторизация

- Экран входа с валидацией и подсказкой с тестовыми данными
- Экран профиля с информацией о пользователе
- Выход с подтверждением
- Вход по кнопке «Войти» с предзаполненными тестовыми данными
- Защита маршрутов через `GoRouter` (редирект на `/login`)

### Список врачей

- Поиск по имени с debounce (500 мс)
- Фильтры: специальность, минимальный рейтинг, сортировка
- Пагинация (бесконечная прокрутка) + pull-to-refresh
- Офлайн-режим с кэшем врачей и специальностей

### Карточка врача

- Фото, рейтинг, стаж, цена, описание, образование, достижения
- Расписание свободных слотов
- Отзывы с сортировкой и пагинацией

### Запись на приём

- Bottom sheet с формой (жалобы, хрон. заболевания, рост, вес)
- Прикрепление PDF через `file_picker`
- Multipart-запрос на API

---

## Архитектура

Проект построен по **Clean Architecture** в варианте **layer-first** (организация по техническим слоям).

```
lib/
├── core/                         # Инфраструктура, не зависящая от фич
│   ├── di/                       # get_it + injectable
│   ├── error/                    # Failure-типы
│   ├── logging/                  # Talker, debug overlay
│   ├── network/                  # Dio, interceptors
│   ├── router/                   # GoRouter + typed routes
│   ├── theme/
│   ├── usecase/                  # UseCase<T, Params>, NoParams
│   └── utils/
├── data/                         # Источники данных
│   ├── datasources/              # Retrofit API, LocalStorage
│   ├── mappers/                  # DTO → domain models
│   ├── models/                   # DTO (freezed + json)
│   └── repositories/             # *RepositoryImpl
├── domain/                       # Бизнес-правила
│   ├── models/                   # Doctor, User, Slot, …
│   ├── repositories/             # Абстракции репозиториев
│   └── usecases/
│       ├── auth/                 # LoginUseCase, GetMeUseCase, …
│       └── doctors/              # GetDoctorsUseCase, … + *Params
└── presentation/                 # UI
    ├── core/                     # Общие виджеты (DoctorCard, ErrorView)
    └── features/                 # Фичи: cubit + state + screen + widgets/
        ├── auth/
        ├── booking/
        ├── doctor_details/
        └── doctors/
```

### Поток данных

```
UI (Cubit) → UseCase → Repository (interface) → RepositoryImpl → API / Cache
                ↓
         Either<Failure, T>
```

- **Domain** не знает о Dio, DTO и Flutter-виджетах
- **Data** маппит DTO в domain-модели через `entity_mappers.dart`
- **Presentation** вызывает только use cases, не репозитории напрямую

### Почему layer-first, а не feature-first?

В Clean Architecture возможны два подхода к структуре папок:

|             | Layer-first (выбран)                   | Feature-first                                     |
| ----------- | -------------------------------------- | ------------------------------------------------- |
| Организация | `data/`, `domain/`, `presentation/`    | `features/auth/data/`, `features/auth/domain/`, … |
| Общий код   | Один `DoctorsRepository`, общие модели | Дублирование или сложные shared-модули            |
| Масштаб     | Небольшие и средние приложения         | Крупные команды, много независимых фич            |

**Почему layer-first подходит этому проекту:**

1. **Общая предметная область** — auth, doctors и booking работают с одним API и пересекаются (JWT в Dio, кэш специальностей используется и в списке, и в карточке врача).
2. **Небольшой scope ТЗ** — 4 экрана, 2 репозитория, ~10 use cases. Feature-first добавил бы вложенность (`features/doctors/domain/usecases/...`) без выигрыша в изоляции.
3. **Единые слои проще тестировать** — unit-тесты репозиториев и cubit'ов лежат рядом с понятной иерархией `test/data/`, `test/presentation/`.
4. **Presentation уже feature-first** — UI разбит по фичам (`presentation/features/auth/`, `doctors/`, …), а domain/data остаются переиспользуемыми.

Feature-first имеет смысл при росте до десятков модулей с независимыми командами. Для текущего объёма layer-first даёт чище разделение ответственности без лишней сложности.

### UseCase и Params

Все сценарии использования реализуют единый контракт:

```dart
// lib/core/usecase/usecase.dart
abstract interface class UseCase<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}
```

Пример:

```dart
@lazySingleton
class LoginUseCase implements UseCase<User, LoginParams> {
  const LoginUseCase(this._repository);
  final AuthRepository _repository;

  @override
  Future<Either<Failure, User>> call(LoginParams params) =>
      _repository.login(params.email, params.password);
}
```

Use cases без аргументов принимают `NoParams()`.

### Стек технологий

| Категория        | Библиотека                                        |
| ---------------- | ------------------------------------------------- |
| State management | `flutter_bloc`                                    |
| DI               | `injectable` + `get_it`                           |
| Routing          | `go_router` + `go_router_builder`                 |
| HTTP             | `dio` + `retrofit`                                |
| Models           | `freezed` + `json_serializable` + `equatable`     |
| FP utilities     | `fpdart` (`Either`)                               |
| Images           | `cached_network_image`                            |
| Local storage    | `shared_preferences`                              |
| Logging          | `talker` + `talker_dio_logger` + `talker_flutter` |
| File picker      | `file_picker`                                     |

---

## Запуск

### Требования

- Flutter SDK ^3.12
- iOS Simulator / Android Emulator / физическое устройство

### Установка

```bash
# Зависимости
flutter pub get

# Codegen: freezed, retrofit, injectable, go_router
dart run build_runner build --delete-conflicting-outputs

# Запуск
flutter run
```

### Debug-логирование

В debug-сборке:

- HTTP-логи в консоли через **Talker** (цвета: ошибки — красный, успех — зелёный, запросы — фиолетовый)
- Кнопка с иконкой жука (справа внизу) открывает **TalkerScreen** с историей логов

---

## Тесты

```bash
# Все тесты (37)
flutter test

# По фичам
flutter test test/presentation/features/auth/
flutter test test/data/repositories/
```

### Покрытие

| Файл                                                         | Что проверяет                    |
| ------------------------------------------------------------ | -------------------------------- |
| `test/data/repositories/auth_repository_impl_test.dart`      | Login, logout, token, ошибки API |
| `test/data/repositories/doctors_repository_impl_test.dart`   | API, кэш, offline fallback       |
| `test/presentation/features/auth/auth_cubit_test.dart`       | Старт приложения, login, logout  |
| `test/presentation/features/auth/login_screen_test.dart`     | Форма, валидация, snackbar       |
| `test/presentation/features/auth/profile_screen_test.dart`   | Профиль, выход                   |
| `test/core/router/app_router_test.dart`                      | Auth-редиректы                   |
| `test/presentation/features/doctors/doctors_cubit_test.dart` | Загрузка, offline                |
| `test/presentation/features/booking/booking_cubit_test.dart` | Запись, ошибки                   |

Инструменты: `flutter_test`, `mocktail`, `bloc_test`.

---

## Навигация (typed routes)

Маршруты в `lib/core/router/app_routes.dart` → `app_routes.g.dart`:

| Класс                         | Путь          | Экран          |
| ----------------------------- | ------------- | -------------- |
| `LoginRoute`                  | `/login`      | Вход           |
| `DoctorsRoute`                | `/`           | Список врачей  |
| `DoctorDetailsRoute(id: ...)` | `/doctor/:id` | Карточка врача |
| `ProfileRoute`                | `/profile`    | Профиль        |

```dart
const LoginRoute().go(context);
const ProfileRoute().push<void>(context);
DoctorDetailsRoute(id: doctor.id).push<void>(context);
```

---

## Сценарий использования

1. При первом запуске — экран **«Войти»** (поля предзаполнены тестовыми данными)
2. После входа — список врачей: поиск, фильтры, pull-to-refresh
3. Карточка врача → расписание, отзывы
4. Выбор слота → форма записи (+ PDF)
5. Иконка профиля в AppBar → **«Выйти из аккаунта»**

---
