class MaruzaModel{
  String playlistName;
  String id;

  MaruzaModel({required this.playlistName,required this.id});

  factory MaruzaModel.fromJson({required Map<String,dynamic>? data,String? id}){
    return MaruzaModel(playlistName: data?["playlistName"], id: id ?? "");
  }

  toJson(){
    return {
      "playlistName":playlistName,
    };
  }
}