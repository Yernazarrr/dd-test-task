import 'package:test_task/data/mappers/entity_mappers.dart';
import 'package:test_task/data/models/doctor_dto.dart';
import 'package:test_task/data/models/pagination_dto.dart';
import 'package:test_task/data/models/specialty_dto.dart';
import 'package:test_task/data/models/user_dto.dart';
import 'package:test_task/domain/models/paginated_results.dart';

const testUserDto = UserDto(
  id: 'user-1',
  name: 'Test User',
  email: 'test@example.com',
  phone: '+79991234567',
  avatar: 'https://example.com/avatar.png',
  registrationDate: '2024-01-15',
);

final testUser = mapUser(testUserDto);

const testLoginResponse = LoginResponseDto(
  success: true,
  token: 'test-auth-token',
  user: testUserDto,
);

const testEmail = 'test@example.com';
const testPassword = 'password';

const testDoctorDto = DoctorDto(
  id: 'doctor-1',
  name: 'Dr. Ivan Petrov',
  specialty: 'specialty-1',
  rating: 4.8,
  reviewCount: 12,
  experience: 10,
  avatar: 'https://example.com/doctor.png',
  education: 'Medical University',
  description: 'Experienced doctor',
  achievements: ['Best doctor 2023'],
  price: 3000,
);

final testDoctor = mapDoctor(testDoctorDto);

const testSpecialtyDto = SpecialtyDto(
  id: 'specialty-1',
  name: 'Терапевт',
);

final testSpecialty = mapSpecialty(testSpecialtyDto);

const testPaginationDto = PaginationDto(
  page: 1,
  limit: 10,
  total: 1,
  pages: 1,
  hasNext: false,
  hasPrev: false,
);

final testPagination = mapPagination(testPaginationDto);

final testPaginatedDoctors = PaginatedDoctors(
  doctors: [testDoctor],
  pagination: testPagination,
);

final testCachedPaginatedDoctors = PaginatedDoctors(
  doctors: [testDoctor],
  pagination: testPagination,
  isFromCache: true,
);
