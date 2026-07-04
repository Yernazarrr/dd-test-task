import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/doctor_dto.dart';
import '../models/specialty_dto.dart';

@lazySingleton
class LocalStorage {
  final SharedPreferences _prefs;
  LocalStorage(this._prefs);

  static const _tokenKey = 'auth_token';
  static const _doctorsCacheKey = 'cached_doctors';
  static const _specialtiesCacheKey = 'cached_specialties';

  Future<void> saveToken(String token) async {
    await _prefs.setString(_tokenKey, token);
  }

  String? getToken() {
    return _prefs.getString(_tokenKey);
  }

  Future<void> clearToken() async {
    await _prefs.remove(_tokenKey);
  }

  Future<void> cacheDoctors(List<DoctorDto> doctors) async {
    final rawList = doctors.map((d) => d.toJson()).toList();
    await _prefs.setString(_doctorsCacheKey, jsonEncode(rawList));
  }

  List<DoctorDto>? getCachedDoctors() {
    final cached = _prefs.getString(_doctorsCacheKey);
    if (cached == null) return null;
    try {
      final List<dynamic> decoded = jsonDecode(cached) as List<dynamic>;
      return decoded
          .map((item) => DoctorDto.fromJson(item as Map<String, dynamic>))
          .toList();
    } catch (_) {
      return null;
    }
  }

  Future<void> cacheSpecialties(List<SpecialtyDto> specialties) async {
    final rawList = specialties.map((s) => s.toJson()).toList();
    await _prefs.setString(_specialtiesCacheKey, jsonEncode(rawList));
  }

  List<SpecialtyDto>? getCachedSpecialties() {
    final cached = _prefs.getString(_specialtiesCacheKey);
    if (cached == null) return null;
    try {
      final List<dynamic> decoded = jsonDecode(cached) as List<dynamic>;
      return decoded
          .map((item) => SpecialtyDto.fromJson(item as Map<String, dynamic>))
          .toList();
    } catch (_) {
      return null;
    }
  }
}
