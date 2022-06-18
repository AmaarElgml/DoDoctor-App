/// Home ///
class Article {
  int id;
  String title;
  String description;
  String date;
  String image;

  Article(this.id, this.title, this.description, this.date, this.image);
}

class BannerAd {
  int id;
  String title;
  String image;
  String link;

  BannerAd(this.id, this.title, this.image, this.link);
}

class HomeData {
  List<Article> articles;
  List<BannerAd> banners;

  HomeData(this.articles, this.banners);
}

class HomeObject {
  HomeData data;

  HomeObject(this.data);
}

/// ArticleData ///
class ArticleData {
  List<Article> articles;

  ArticleData(this.articles);
}

class ArticleObject {
  ArticleData articleData;

  ArticleObject(this.articleData);
}

/// Notification ///
class AppNotification {
  int id;
  String title;
  String time;
  String image;
  String link;
  bool reed;

  AppNotification(
      this.id, this.title, this.time, this.image, this.link, this.reed);
}

class NotificationData {
  List<AppNotification> notifications;

  NotificationData(this.notifications);
}

class NotificationObject {
  NotificationData notification;

  NotificationObject(this.notification);
}

/// Appointment ///
class Appointment {
  int id;
  String date;
  String start;
  String end;
  String status;

  Appointment(this.id, this.date, this.start, this.end, this.status);
}

class AppointmentData {
  List<Appointment> appointments;

  AppointmentData(this.appointments);
}

class AppointmentObject {
  AppointmentData appointmentData;

  AppointmentObject(this.appointmentData);
}