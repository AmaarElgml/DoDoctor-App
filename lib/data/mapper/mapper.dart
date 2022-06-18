import '../../app/constants.dart';
import '../../domain/model/auth_models.dart';
import '../../app/extensions.dart';
import '../../domain/model/main_models.dart';
import '../response/auth_response/auth_response.dart';
import '../response/main_response/main_response.dart';

extension CustomerResponseMapper on CustomerResponse? {
  Customer toDomain() {
    return Customer(this?.id.orEmpty() ?? Constants.empty,
        this?.name.orEmpty() ?? Constants.empty);
  }
}

extension ContactsResponseMapper on ContactsResponse? {
  Contacts toDomain() {
    return Contacts(this?.phone.orEmpty() ?? Constants.empty,
        this?.email.orEmpty() ?? Constants.empty);
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(this?.customer.toDomain(), this?.contacts.toDomain());
  }
}

extension ForgotPasswordResponseMapper on ForgotPasswordResponse? {
  String toDomain() {
    return this?.support.orEmpty() ?? Constants.empty;
  }
}

/// Article ///
extension ArticlesDataResponseMapper on ArticlesDataResponse? {
  Article toDomain() {
    return Article(
        this?.id.orZero() ?? Constants.zero,
        this?.title.orEmpty() ?? Constants.empty,
        this?.description.orEmpty() ?? Constants.empty,
        this?.date.orEmpty() ?? Constants.empty,
        this?.image.orEmpty() ?? Constants.empty);
  }
}

extension ArticlesResponseMapper on ArticlesResponse? {
  ArticleObject toDomain() {
    List<Article> articles =
        (this?.articles?.map((articleResponse) => articleResponse.toDomain()) ??
                const Iterable.empty())
            .cast<Article>()
            .toList();

    var data = ArticleData(articles);

    return ArticleObject(data);
  }
}

/// Home ///
extension BannersResponseMapper on BannersResponse? {
  BannerAd toDomain() {
    return BannerAd(
        this?.id.orZero() ?? Constants.zero,
        this?.title.orEmpty() ?? Constants.empty,
        this?.image.orEmpty() ?? Constants.empty,
        this?.link.orEmpty() ?? Constants.empty);
  }
}

extension HomeResponseMapper on HomeResponse? {
  HomeObject toDomain() {
    List<Article> latestArticles = (this
                ?.data
                ?.articles
                ?.map((articleResponse) => articleResponse.toDomain()) ??
            const Iterable.empty())
        .cast<Article>()
        .toList();

    List<BannerAd> banners = (this
                ?.data
                ?.banners
                ?.map((bannersResponse) => bannersResponse.toDomain()) ??
            const Iterable.empty())
        .cast<BannerAd>()
        .toList();

    var data = HomeData(latestArticles, banners);
    return HomeObject(data);
  }
}

/// Notification ///
extension NotificationDataResponseMapper on NotificationDataResponse? {
  AppNotification toDomain() {
    return AppNotification(
      this?.id.orZero() ?? Constants.zero,
      this?.title.orEmpty() ?? Constants.empty,
      this?.date.orEmpty() ?? Constants.empty,
      this?.image.orEmpty() ?? Constants.empty,
      this?.link.orEmpty() ?? Constants.empty,
      this?.reed.orFalse() ?? Constants.cFalse,
    );
  }
}

extension NotificationResponseMapper on NotificationResponse? {
  NotificationObject toDomain() {
    List<AppNotification> notifications = (this?.notifications?.map(
                (notificationResponse) => notificationResponse.toDomain()) ??
            const Iterable.empty())
        .cast<AppNotification>()
        .toList();

    var data = NotificationData(notifications);
    return NotificationObject(data);
  }
}

/// Appointment ///
extension AppointmentDataResponseMapper on AppointmentDataResponse? {
  Appointment toDomain() {
    return Appointment(
      this?.id.orZero() ?? Constants.zero,
      this?.date.orEmpty() ?? Constants.empty,
      this?.start.orEmpty() ?? Constants.empty,
      this?.end.orEmpty() ?? Constants.empty,
      this?.status.orEmpty() ?? Constants.empty,
    );
  }
}

extension AppointmentsResponseMapper on AppointmentsResponse? {
  AppointmentObject toDomain() {
    List<Appointment> appointments = (this?.appointments?.map(
                (appointmentResponse) => appointmentResponse.toDomain()) ??
            const Iterable.empty())
        .cast<Appointment>()
        .toList();

    var data = AppointmentData(appointments);
    return AppointmentObject(data);
  }
}

/// Booking ///
extension BookingResponseMapper on BookingResponse? {
  String toDomain() {
    return this?.notifyMessage.orEmpty() ?? Constants.empty;
  }
}
