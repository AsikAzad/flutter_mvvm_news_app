class Constants {
  static const apiKey = "52489cf346804f2eb180b8e34528aa26";
  static const baseUrl = "https://newsapi.org/v2/top-headlines";
  static const topHeadlines = "$baseUrl?country=us&apiKey=$apiKey";

  static String headlinesFor(String country) {
    return "$baseUrl?country=$country&apiKey=$apiKey";
  }

  static const Map<String, String> countries = {
    'USA': 'us',
    'India': 'in',
    'Korea': 'kr',
    'China': 'cn'
  };
}
