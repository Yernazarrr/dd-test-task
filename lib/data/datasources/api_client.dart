import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../models/doctor_dto.dart';
import '../models/review_dto.dart';
import '../models/slot_dto.dart';
import '../models/specialty_dto.dart';
import '../models/user_dto.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @POST('/api/auth/login')
  Future<LoginResponseDto> login(@Body() Map<String, dynamic> body);

  @GET('/api/auth/me')
  Future<UserDto> getMe();

  @GET('/api/doctors')
  Future<DoctorsResponseDto> getDoctors({
    @Query('page') int? page,
    @Query('search') String? search,
    @Query('specialty') String? specialty,
    @Query('minRating') double? minRating,
    @Query('sortBy') String? sortBy,
    @Query('sortOrder') String? sortOrder,
  });

  @GET('/api/doctors/{id}')
  Future<DoctorDto> getDoctorDetails(@Path('id') String id);

  @GET('/api/doctors/{id}/schedule')
  Future<List<SlotDto>> getDoctorSchedule(@Path('id') String id);

  @GET('/api/specialties')
  Future<List<SpecialtyDto>> getSpecialties();

  @GET('/api/doctors/{id}/reviews')
  Future<ReviewsResponseDto> getDoctorReviews({
    @Path('id') required String id,
    @Query('page') int? page,
    @Query('sortBy') String? sortBy,
    @Query('sortOrder') String? sortOrder,
  });

  @POST('/api/appointments')
  Future<dynamic> bookAppointment(@Body() FormData formData);
}
