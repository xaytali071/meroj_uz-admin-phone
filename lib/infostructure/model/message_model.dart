class MessageModel {
  final String? title;
  final String? image;
  final DateTime? time;
  final String? body;
  final bool? isRead;
  final String? videoId;


  MessageModel(
      {
        required this.title,
        required this.time,
        required this.image,
        required this.body,
        this.isRead = false,
        this.videoId,
      });

  factory MessageModel.fromJson(Map<String, dynamic>? data,String docId) {
    return MessageModel(
        title: data?["title"],
        time: DateTime.parse(
            data?["time"]),
        body: data?["body"],
        image: data?["image"],
        isRead: data?["isRead"],
        videoId: data?["videoId"]
    );
  }

  toJson() {
    return {
      "title": title,
      "time": time.toString(),
      "isRead": isRead,
      "image": image,
      "body":body,
      "videoId":videoId,
    };
  }
}