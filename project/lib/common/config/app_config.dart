const String BASE_URL = "_baseurl";

class AppConfig {
  Map<String, dynamic> config;
  AppConfig({required this.config});

  get baseURL => config[BASE_URL] ?? "";
}
