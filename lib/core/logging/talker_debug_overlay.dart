import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:talker_flutter/talker_flutter.dart';

class TalkerDebugOverlay extends StatelessWidget {
  final Talker talker;
  final GlobalKey<NavigatorState> navigatorKey;
  final Widget child;

  const TalkerDebugOverlay({
    super.key,
    required this.talker,
    required this.navigatorKey,
    required this.child,
  });

  static final _talkerScreenTheme = TalkerScreenTheme(
    backgroundColor: const Color(0xFF1E1E1E),
    logColors: {
      TalkerLogType.error.key: Colors.redAccent,
      TalkerLogType.exception.key: Colors.redAccent,
      TalkerLogType.critical.key: Colors.redAccent,
      TalkerLogType.warning.key: Colors.amber,
      TalkerLogType.info.key: Colors.grey,
      TalkerLogType.debug.key: Colors.grey,
      TalkerLogType.httpError.key: Colors.redAccent,
      TalkerLogType.httpRequest.key: Colors.purpleAccent,
      TalkerLogType.httpResponse.key: Colors.greenAccent,
      'success': Colors.greenAccent,
    },
  );

  void _openTalkerScreen() {
    unawaited(
      navigatorKey.currentState?.push(
        MaterialPageRoute<void>(
          builder: (_) => TalkerScreen(
            talker: talker,
            theme: _talkerScreenTheme,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!kDebugMode) return child;

    return Stack(
      children: [
        child,
        Positioned(
          right: 16,
          bottom: 16,
          child: Semantics(
            button: true,
            label: 'Логи приложения',
            child: FloatingActionButton.small(
              heroTag: 'talker_debug_fab',
              backgroundColor: Colors.black87,
              onPressed: _openTalkerScreen,
              child: const Icon(
                Icons.bug_report_outlined,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
