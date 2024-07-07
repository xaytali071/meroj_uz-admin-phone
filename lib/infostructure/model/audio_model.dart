class AudioModel {
  String? name;
  int part;
  String? audioUrl;
  String? id;

  AudioModel({required this.name, this.part = 0, required this.audioUrl, this.id});

  factory AudioModel.fromJson({required Map<String, dynamic> data,required String  id}) {
    return AudioModel(
        name: data["name"], part: data["part"], audioUrl: data["audioUrl"],id: id);
  }

  toJson() {
    return {
      "name": name,
      "part": part,
      "audioUrl": audioUrl,
    };
  }
}
