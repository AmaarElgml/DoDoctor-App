// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannersResponse _$BannersResponseFromJson(Map<String, dynamic> json) =>
    BannersResponse(
      json['id'] as int?,
      json['title'] as String?,
      json['image'] as String?,
      json['link'] as String?,
    );

Map<String, dynamic> _$BannersResponseToJson(BannersResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'link': instance.link,
    };

ArticlesDataResponse _$ArticlesDataResponseFromJson(
        Map<String, dynamic> json) =>
    ArticlesDataResponse(
      json['id'] as int?,
      json['title'] as String?,
      json['description'] as String?,
      json['date'] as String?,
      json['image'] as String?,
    );

Map<String, dynamic> _$ArticlesDataResponseToJson(
        ArticlesDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'date': instance.date,
      'image': instance.image,
    };

HomeDataResponse _$HomeDataResponseFromJson(Map<String, dynamic> json) =>
    HomeDataResponse(
      (json['articles'] as List<dynamic>?)
          ?.map((e) => ArticlesDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['banners'] as List<dynamic>?)
          ?.map((e) => BannersResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeDataResponseToJson(HomeDataResponse instance) =>
    <String, dynamic>{
      'articles': instance.articles,
      'banners': instance.banners,
    };

HomeResponse _$HomeResponseFromJson(Map<String, dynamic> json) => HomeResponse(
      json['data'] == null
          ? null
          : HomeDataResponse.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..status = json['status'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$HomeResponseToJson(HomeResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

ArticlesResponse _$ArticlesResponseFromJson(Map<String, dynamic> json) =>
    ArticlesResponse(
      (json['articles'] as List<dynamic>?)
          ?.map((e) => ArticlesDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..status = json['status'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ArticlesResponseToJson(ArticlesResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'articles': instance.articles,
    };

NotificationDataResponse _$NotificationDataResponseFromJson(
        Map<String, dynamic> json) =>
    NotificationDataResponse(
      json['id'] as int?,
      json['title'] as String?,
      json['date'] as String?,
      json['image'] as String?,
      json['link'] as String?,
      json['reed'] as bool?,
    )
      ..status = json['status'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$NotificationDataResponseToJson(
        NotificationDataResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'id': instance.id,
      'title': instance.title,
      'date': instance.date,
      'image': instance.image,
      'link': instance.link,
      'reed': instance.reed,
    };

NotificationResponse _$NotificationResponseFromJson(
        Map<String, dynamic> json) =>
    NotificationResponse(
      (json['notifications'] as List<dynamic>?)
          ?.map((e) =>
              NotificationDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..status = json['status'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$NotificationResponseToJson(
        NotificationResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'notifications': instance.notifications,
    };

AppointmentDataResponse _$AppointmentDataResponseFromJson(
        Map<String, dynamic> json) =>
    AppointmentDataResponse(
      json['id'] as int?,
      json['date'] as String?,
      json['start'] as String?,
      json['end'] as String?,
      json['status'] as String?,
    );

Map<String, dynamic> _$AppointmentDataResponseToJson(
        AppointmentDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'start': instance.start,
      'end': instance.end,
      'status': instance.status,
    };

AppointmentsResponse _$AppointmentsResponseFromJson(
        Map<String, dynamic> json) =>
    AppointmentsResponse(
      (json['appointments'] as List<dynamic>?)
          ?.map((e) =>
              AppointmentDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..status = json['status'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$AppointmentsResponseToJson(
        AppointmentsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'appointments': instance.appointments,
    };

BookingResponse _$BookingResponseFromJson(Map<String, dynamic> json) =>
    BookingResponse(
      json['notify_message'] as String?,
    )
      ..status = json['status'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$BookingResponseToJson(BookingResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'notify_message': instance.notifyMessage,
    };
