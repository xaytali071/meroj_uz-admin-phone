class HadithModel {
  final String title;
  final String body;
  final String image;

  HadithModel({required this.title, required this.body, required this.image});

  factory HadithModel.fromJson(Map<String, dynamic>? data) {
    return HadithModel(
        title: data?["title"], body: data?["body"], image: data?["image"]);
  }

  toJson(){
    return {
      "title":title,
      "body":body,
      "image":image,
    };
  }
}
