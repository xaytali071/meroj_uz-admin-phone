class UserModel{
  String id;
  String fcm;

  UserModel({required this.id,required this.fcm});

  factory UserModel.fromJson(Map<String,dynamic> data,String id){
    return UserModel(id: id, fcm: data["fcm"]);
  }

  toJson(){
    return{
      "id":id,
      "fcm":fcm,
    };
  }
}