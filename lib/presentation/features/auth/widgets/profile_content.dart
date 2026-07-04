import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../domain/models/user.dart';
import 'profile_info_tile.dart';

class ProfileContent extends StatelessWidget {
  final User user;
  final bool isLoading;
  final VoidCallback onLogout;

  const ProfileContent({
    super.key,
    required this.user,
    required this.isLoading,
    required this.onLogout,
  });

  String _formatDate(DateTime date) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    return '$day.$month.${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          CircleAvatar(
            radius: 52,
            backgroundColor: AppTheme.primaryLight,
            backgroundImage: user.avatar.isNotEmpty
                ? CachedNetworkImageProvider(user.avatar)
                : null,
            child: user.avatar.isEmpty
                ? const Icon(
                    Icons.person_rounded,
                    size: 52,
                    color: AppTheme.primaryTeal,
                  )
                : null,
          ),
          const SizedBox(height: 16),
          Text(
            user.name,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppTheme.textDark,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: const TextStyle(fontSize: 15, color: AppTheme.textMuted),
          ),
          const SizedBox(height: 32),
          ProfileInfoTile(
            icon: Icons.phone_outlined,
            label: 'Телефон',
            value: user.phone.isNotEmpty ? user.phone : 'Не указан',
          ),
          const SizedBox(height: 12),
          ProfileInfoTile(
            icon: Icons.calendar_today_outlined,
            label: 'Дата регистрации',
            value: _formatDate(user.registrationDate),
          ),
          const SizedBox(height: 40),
          SizedBox(
            width: double.infinity,
            height: 52,
            child: OutlinedButton.icon(
              onPressed: isLoading ? null : onLogout,
              icon: isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.logout_rounded),
              label: const Text('Выйти из аккаунта'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.redAccent,
                side: const BorderSide(color: Colors.redAccent),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
