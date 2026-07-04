import 'package:injectable/injectable.dart';
import 'package:talker/talker.dart';

@lazySingleton
class AppTalker {
  AppTalker() {
    talker = Talker(
      logger: TalkerLogger(
        formatter: const ColoredLoggerFormatter(),
        settings: TalkerLoggerSettings(
          maxLineWidth: 90,
        ),
      ),
      settings: TalkerSettings(
        maxHistoryItems: 300,
        colors: {
          TalkerLogType.error.key: AnsiPen()..red(bold: true),
          TalkerLogType.exception.key: AnsiPen()..red(bold: true),
          TalkerLogType.critical.key: AnsiPen()..red(bold: true),
          TalkerLogType.warning.key: AnsiPen()..yellow(bold: true),
          TalkerLogType.info.key: AnsiPen()..gray(),
          TalkerLogType.debug.key: AnsiPen()..gray(),
          TalkerLogType.httpError.key: AnsiPen()..red(bold: true),
          TalkerLogType.httpRequest.key: AnsiPen()..magenta(bold: true),
          TalkerLogType.httpResponse.key: AnsiPen()..green(bold: true),
          _successKey: AnsiPen()..green(bold: true),
        },
        titles: {
          _successKey: 'OK',
          TalkerLogType.error.key: 'ERROR',
          TalkerLogType.warning.key: 'WARN',
          TalkerLogType.info.key: 'INFO',
          TalkerLogType.httpRequest.key: 'HTTP →',
          TalkerLogType.httpResponse.key: 'HTTP ←',
          TalkerLogType.httpError.key: 'HTTP ✖',
        },
      ),
    );
  }

  static const _successKey = 'success';

  late final Talker talker;

  void info(String message) => talker.info(message);

  void debug(String message) => talker.debug(message);

  void warning(String message) => talker.warning(message);

  void error(
    String message, [
    Object? exception,
    StackTrace? stackTrace,
  ]) {
    talker.error(message, exception, stackTrace);
  }

  void success(String message) {
    talker.logCustom(
      TalkerLog(
        message,
        key: _successKey,
        title: 'OK',
        logLevel: LogLevel.info,
        pen: AnsiPen()..green(bold: true),
      ),
    );
  }
}

final talkerRequestPen = AnsiPen()..magenta(bold: true);
final talkerResponsePen = AnsiPen()..green(bold: true);
final talkerErrorPen = AnsiPen()..red(bold: true);

const talkerHiddenHeaders = {'Authorization', 'authorization', 'cookie'};
