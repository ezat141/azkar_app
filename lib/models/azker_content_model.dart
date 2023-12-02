class Data {
  String title;
  List<Content> content;

  Data({
    required this.title,
    required this.content,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    List<dynamic> contentList = json['content'];
    List<Content> content = contentList.map((contentJson) => Content.fromJson(contentJson)).toList();

    return Data(
      title: json['title'],
      content: content,
    );
  }
}
class Content {
  String zekr;
  int repeat;
  String bless;

  Content({
    required this.zekr,
    required this.repeat,
    required this.bless,
  });

  factory Content.fromJson(Map<String, dynamic> json) {
    return Content(
      zekr: json['zekr'],
      repeat: json['repeat'],
      bless: json['bless'],
    );
  }
}
