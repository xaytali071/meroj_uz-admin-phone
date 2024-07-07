class BannerModel{
  String? videoUrl;
  String? image;
  String? id;

  BannerModel({this.videoUrl,this.image,this.id});

  factory BannerModel.fromJson(Map<String,dynamic>? data,String id){
    return BannerModel(
        videoUrl: data?["videoUrl"],
        image: data?["image"],
      id:id
    );
  }

  toJson(){
    return {
      "videoUrl": videoUrl,
      "image":image,
    };
  }
}