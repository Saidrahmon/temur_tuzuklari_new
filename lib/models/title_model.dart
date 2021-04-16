class TitleModel{
  final int id;
  final int categoryId;
  final int chapter;
  final String title;
  final String text;
  final String desc;
  final String lang;

  TitleModel({required this.id, required this.categoryId, required this.chapter, required this.title, required this.text, required this.desc, required this.lang});

  factory TitleModel.fromMap(Map<String, dynamic> json) {
    return TitleModel(
        id: json["id"],
        categoryId: json["categoryId"],
        chapter: json["chapter"],
        title: json["title"],
        text: json["text"],
        desc: json["desc"],
        lang: json["lang"]
    );
  }
}