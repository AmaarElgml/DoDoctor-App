import '../network/error_handler.dart';
import '../response/main_response/main_response.dart';

const CACHE_HOME_KEY = "CACHE_HOME_KEY";
const CACHE_ARTICLES_KEY = "CACHE_LATEST_ARTICLES_KEY";
const CACHE_NOTIFICATIONS_KEY = "CACHE_NOTIFICATIONS_KEY";
const CACHE_APPOINTMENTS_KEY = "CACHE_NOTIFICATIONS_KEY";
const CACHE_HOME_INTERVAL = 60 * 1000;
const CACHE_ARTICLES_INTERVAL = 60 * 1000;
const CACHE_NOTIFICATIONS_INTERVAL = 60 * 1000;
const CACHE_APPOINTMENTS_INTERVAL = 60 * 1000;

abstract class LocalDataSource {
  Future<HomeResponse> getHomeData();

  Future<ArticlesResponse> getArticles();

  Future<NotificationResponse> getNotifications();

  Future<AppointmentsResponse> getAppointments();

  Future<void> saveHomeToCache(HomeResponse homeResponse);

  Future<void> saveArticlesToCache(ArticlesResponse articlesResponse);

  Future<void> saveNotificationsToCache(
      NotificationResponse notificationResponse);

  Future<void> saveAppointmentsToCache(
      AppointmentsResponse appointmentsResponse);

  void removeFromCache(String key);

  void clearCache();
}

class LocalDataSourceImpl implements LocalDataSource {
  // run time cache
  Map<String, CachedItem> cacheMap = {};

  @override
  Future<HomeResponse> getHomeData() async {
    CachedItem? cachedItem = cacheMap[CACHE_HOME_KEY];
    if (cachedItem != null && cachedItem.isValid(CACHE_HOME_INTERVAL)) {
      return cachedItem.data;
    } else {
      throw ErrorHandler.handle(DataSource.CACHE_ERROR);
    }
  }

  @override
  Future<ArticlesResponse> getArticles() {
    CachedItem? cachedItem = cacheMap[CACHE_ARTICLES_KEY];
    if (cachedItem != null && cachedItem.isValid(CACHE_ARTICLES_INTERVAL)) {
      return cachedItem.data;
    } else {
      throw ErrorHandler.handle(DataSource.CACHE_ERROR);
    }
  }

  @override
  Future<NotificationResponse> getNotifications() {
    CachedItem? cachedItem = cacheMap[CACHE_NOTIFICATIONS_KEY];
    if (cachedItem != null &&
        cachedItem.isValid(CACHE_NOTIFICATIONS_INTERVAL)) {
      return cachedItem.data;
    } else {
      throw ErrorHandler.handle(DataSource.CACHE_ERROR);
    }
  }

  @override
  Future<AppointmentsResponse> getAppointments() {
    CachedItem? cachedItem = cacheMap[CACHE_APPOINTMENTS_KEY];
    if (cachedItem != null && cachedItem.isValid(CACHE_APPOINTMENTS_INTERVAL)) {
      return cachedItem.data;
    } else {
      throw ErrorHandler.handle(DataSource.CACHE_ERROR);
    }
  }

  @override
  Future<void> saveHomeToCache(HomeResponse homeResponse) async {
    cacheMap[CACHE_HOME_KEY] = CachedItem(homeResponse);
  }

  @override
  Future<void> saveArticlesToCache(ArticlesResponse articlesResponse) async {
    cacheMap[CACHE_ARTICLES_KEY] = CachedItem(articlesResponse);
  }

  @override
  Future<void> saveNotificationsToCache(
      NotificationResponse notificationResponse) async {
    cacheMap[CACHE_NOTIFICATIONS_KEY] = CachedItem(notificationResponse);
  }

  @override
  Future<void> saveAppointmentsToCache(
      AppointmentsResponse appointmentsResponse) async {
    cacheMap[CACHE_APPOINTMENTS_KEY] = CachedItem(appointmentsResponse);
  }

  @override
  void clearCache() {
    cacheMap.clear();
  }

  @override
  void removeFromCache(String key) {
    cacheMap.remove(key);
  }
}

class CachedItem {
  dynamic data;

  int cacheTime = DateTime.now().millisecondsSinceEpoch;

  CachedItem(this.data);
}

extension CachedItemExtension on CachedItem {
  bool isValid(int expirationTimeInMillis) {
    int currentTimeInMillis = DateTime.now().millisecondsSinceEpoch;
    bool isValid = currentTimeInMillis - cacheTime <= expirationTimeInMillis;
    return isValid;
  }
}
