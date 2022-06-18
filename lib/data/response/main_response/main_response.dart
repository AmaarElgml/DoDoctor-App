import 'package:json_annotation/json_annotation.dart';
import '../base_response.dart';

part 'main_response.g.dart';

@JsonSerializable()
class BannersResponse {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'image')
  String? image;
  @JsonKey(name: 'link')
  String? link;

  BannersResponse(this.id, this.title, this.image, this.link);

  Map<String, dynamic> toJson() => _$BannersResponseToJson(this);

  factory BannersResponse.fromJson(Map<String, dynamic> json) =>
      _$BannersResponseFromJson(json);
}

@JsonSerializable()
class ArticlesDataResponse {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'date')
  String? date;
  @JsonKey(name: 'image')
  String? image;

  ArticlesDataResponse(
      this.id, this.title, this.description, this.date, this.image);

  Map<String, dynamic> toJson() => _$ArticlesDataResponseToJson(this);

  factory ArticlesDataResponse.fromJson(Map<String, dynamic> json) =>
      _$ArticlesDataResponseFromJson(json);
}

@JsonSerializable()
class HomeDataResponse {
  @JsonKey(name: 'articles')
  List<ArticlesDataResponse>? articles;

  @JsonKey(name: 'banners')
  List<BannersResponse>? banners;

  HomeDataResponse(this.articles, this.banners);

  Map<String, dynamic> toJson() => _$HomeDataResponseToJson(this);

  factory HomeDataResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeDataResponseFromJson(json);
}

@JsonSerializable()
class HomeResponse extends BaseResponse {
  @JsonKey(name: 'data')
  HomeDataResponse? data;

  HomeResponse(this.data);

  Map<String, dynamic> toJson() => _$HomeResponseToJson(this);

  factory HomeResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeResponseFromJson(json);
}

@JsonSerializable()
class ArticlesResponse extends BaseResponse {
  @JsonKey(name: 'articles')
  List<ArticlesDataResponse>? articles;

  ArticlesResponse(this.articles);

  Map<String, dynamic> toJson() => _$ArticlesResponseToJson(this);

  factory ArticlesResponse.fromJson(Map<String, dynamic> json) =>
      _$ArticlesResponseFromJson(json);
}

@JsonSerializable()
class NotificationDataResponse extends BaseResponse {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'date')
  String? date;
  @JsonKey(name: 'image')
  String? image;
  @JsonKey(name: 'link')
  String? link;
  @JsonKey(name: 'reed')
  bool? reed;

  NotificationDataResponse(
      this.id, this.title, this.date, this.image, this.link, this.reed);

  Map<String, dynamic> toJson() => _$NotificationDataResponseToJson(this);

  factory NotificationDataResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationDataResponseFromJson(json);
}

@JsonSerializable()
class NotificationResponse extends BaseResponse {
  @JsonKey(name: 'notifications')
  List<NotificationDataResponse>? notifications;

  NotificationResponse(this.notifications);

  Map<String, dynamic> toJson() => _$NotificationResponseToJson(this);

  factory NotificationResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationResponseFromJson(json);
}

@JsonSerializable()
class AppointmentDataResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "date")
  String? date;
  @JsonKey(name: "start")
  String? start;
  @JsonKey(name: "end")
  String? end;
  @JsonKey(name: "status")
  String? status;

  AppointmentDataResponse(
      this.id, this.date, this.start, this.end, this.status);

  factory AppointmentDataResponse.fromJson(Map<String, dynamic> json) =>
      _$AppointmentDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentDataResponseToJson(this);
}

@JsonSerializable()
class AppointmentsResponse extends BaseResponse {
  @JsonKey(name: "appointments")
  List<AppointmentDataResponse>? appointments;

  AppointmentsResponse(this.appointments);

  factory AppointmentsResponse.fromJson(Map<String, dynamic> json) =>
      _$AppointmentsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentsResponseToJson(this);
}

@JsonSerializable()
class BookingResponse extends BaseResponse {
  @JsonKey(name: "notify_message")
  String? notifyMessage;

  BookingResponse(this.notifyMessage);

  factory BookingResponse.fromJson(Map<String, dynamic> json) =>
      _$BookingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BookingResponseToJson(this);
}
