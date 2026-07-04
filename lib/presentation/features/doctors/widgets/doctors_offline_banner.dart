import 'package:flutter/material.dart';

class DoctorsOfflineBanner extends StatelessWidget {
  const DoctorsOfflineBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.orange[50],
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        children: [
          Icon(
            Icons.offline_bolt_rounded,
            color: Colors.orange[800],
            size: 20,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'Вы просматриваете сохраненный список (офлайн)',
              style: TextStyle(
                fontSize: 13,
                color: Colors.orange[900],
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
