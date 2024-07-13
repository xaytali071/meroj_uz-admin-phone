import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meroj_uz_admin_phone/controller/network_controller/network_state.dart';
import 'package:meroj_uz_admin_phone/infostructure/model/audio_model.dart';
import 'package:meroj_uz_admin_phone/infostructure/model/maruza_model.dart';
import 'package:meroj_uz_admin_phone/infostructure/product_model.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import '../../infostructure/model/banner_model.dart';
import '../../infostructure/model/hadis_model.dart';
import '../../infostructure/model/message_model.dart';
import '../../infostructure/model/user_model.dart';
import 'package:http/http.dart' as http;

class NetworkNotifire extends StateNotifier<NetworkState> {
  NetworkNotifire() : super(NetworkState());
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  ImagePicker image = ImagePicker();
  String imageUrll = "";

  gethadith() async {
    state = state.copyWith(isLoading: true);
    List<HadithModel> list = [];
    var res = await firestore.collection("kunHadisi").get();
    list.clear();
    for (var element in res.docs) {
      list.add(HadithModel.fromJson(element.data()));
    }
    state = state.copyWith(listOfHadith: list, isLoading: false);
  }

  getImageGallery(VoidCallback onSuccess) async {
    await image
        .pickImage(source: ImageSource.gallery, imageQuality: 65)
        .then((value) async {
      if (value != null) {
        CroppedFile? cropperImage =
        await ImageCropper().cropImage(sourcePath: value.path);
        state = state.copyWith(imagePath: cropperImage!.path);
        onSuccess();
      }
    });
  }

  addHadith({
    required String title,
    required String body,
    required String image,
  }) {
    state = state.copyWith(isLoading: true);
    createImageUrl(
        imagePath: image,
        onSuccess: () {
          firestore.collection("kunHadisi").add(
              HadithModel(title: title, body: body, image: state.imageUrl)
                  .toJson());
        });

    state = state.copyWith(isLoading: false);
  }

  createImageUrl({required String imagePath, VoidCallback? onSuccess}) async {
    state = state.copyWith(isLoading: true);
    final storageRef = FirebaseStorage.instance
        .ref()
        .child("hadithImage/${DateTime.now().toString()}");
    await storageRef.putFile(File(imagePath));

    String imageUrl = await storageRef.getDownloadURL();
    state = state.copyWith(imageUrl: imageUrl);
    imageUrll = imageUrl;
    state = state.copyWith(isLoading: false);
    onSuccess?.call();
  }

  addNewPlayList({required String playListName}) {
    state = state.copyWith(isLoading: true);
    firestore.collection("maruzalar").add({"playlistName": playListName});
    state = state.copyWith(isLoading: false);
  }

  getPlayList() async {
    state = state.copyWith(isLoading: true);
    List<MaruzaModel> list = [];
    final res = await firestore.collection("maruzalar").get();
    list.clear();
    for (var element in res.docs) {
      list.add(MaruzaModel.fromJson(data: element.data(), id: element.id));
    }
    state = state.copyWith(isLoading: false, playList: list);
  }

  Future<void> sendNotification({
    required String fcmToken,
    required String body,
    required String title,
    required String userId,
    VoidCallback? onSuccess,
  }) async {
    try {
      state = state.copyWith(isLoading: true);
      http.Response response = await http.post(
        Uri.parse("https://fcm.googleapis.com/fcm/send"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization':
          'key=AAAACnoIGFg:APA91bHXHfPnPUVx4KK8p06CkV23U2qjemY4iDexVHB7sOfu6hOh1fg1NV2M-KAOvvEhjDW0H_cLPpNHmXrls6YL2L7gu9OW4dyQEvBW4ZNjE6b_dNjnRU6W2BUHvqUN70UZDIhUTR3y',
        },
        body: jsonEncode(
          <String, dynamic>{
            'notification': <String, dynamic>{
              'body': body,
              'title': title,
            },
            'priority': 'high',
            'data': <String, dynamic>{
              'click_action': 'FLUTTER_NOTIFICATION_CLICK',
              'id': '1',
              'status': 'done'
            },
            'to': fcmToken,
          },
        ),
      );
      response;
      onSuccess?.call();
      state = state.copyWith(isLoading: false);
    } catch (e) {
      e;
      state = state.copyWith(isLoading: false);
    }
  }


  Future<void> sendNotificationImage({required String fcmToken,
    required String body,
    required String title,
    VoidCallback? onSuccess,
    required String userId,
    required String? videoId,
    required String image}) async {
    try {
      state = state.copyWith(isLoading: true);
      http.Response response = await http.post(
        Uri.parse("https://fcm.googleapis.com/fcm/send"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization':
          'key=AAAACnoIGFg:APA91bHXHfPnPUVx4KK8p06CkV23U2qjemY4iDexVHB7sOfu6hOh1fg1NV2M-KAOvvEhjDW0H_cLPpNHmXrls6YL2L7gu9OW4dyQEvBW4ZNjE6b_dNjnRU6W2BUHvqUN70UZDIhUTR3y',
        },
        body: jsonEncode(
          <String, dynamic>{
            'notification': <String, dynamic>{
              'body': body,
              'title': title,
              "image": imageUrll,
            },
            'priority': 'high',
            'data': <String, dynamic>{
              'click_action': 'FLUTTER_NOTIFICATION_CLICK',
              'id': '1',
              'status': 'done'
            },
            'to': fcmToken,
          },
        ),
      );
      sendMessageImage(userId: userId,
          title: title,
          image: image,
          body: body,
          videoId: videoId);
      response;
      state = state.copyWith(isLoading: false);
    } catch (e) {
      e;
      state = state.copyWith(isLoading: false);
    }
  }

  sendMessageImage({required String userId,
    required String title,
    required String image,
    required String? videoId,
    required String body}) async {
    state = state.copyWith(isLoading: true);
    firestore.collection("users").doc(userId).collection("messages").add(
        MessageModel(
          //  userId: userId,
            title: title,
            time: DateTime.now(),
            image: image,
            videoId: videoId,
            body: body)
            .toJson());
    state = state.copyWith(isLoading: false);
  }

  playAudio() {
    bool play = state.playAudio;
    play = play = !play;
    state = state.copyWith(playAudio: play);
  }

  Future<String?> getAudioUrl(String videoUrl) async {
    state = state.copyWith(isLoading: true);
    var youtube = YoutubeExplode();
    try {
      var video = await youtube.videos.get(videoUrl);
      var manifest = await youtube.videos.streamsClient.getManifest(video.id);
      var audioStreamInfo = manifest.audioOnly.withHighestBitrate();
      state = state.copyWith(audio: audioStreamInfo.url.toString());
      state = state.copyWith(isLoading: true);
      return audioStreamInfo.url.toString();
    } catch (e) {
      print("Error: $e");
      state = state.copyWith(isLoading: false);
      return null;
    } finally {
      state = state.copyWith(isLoading: false);
      youtube.close();
    }
  }

  Future<String?> getVideoID(String videoUrl) async {
    state = state.copyWith(isLoading: true);
    var youtube = YoutubeExplode();
    try {
      var video = await youtube.videos.get(videoUrl);
      var manifest = await youtube.videos.streamsClient.getManifest(video.id);
      var audioStreamInfo = manifest.audioOnly.withHighestBitrate();
      state = state.copyWith(audio: audioStreamInfo.url.toString());
      state = state.copyWith(isLoading: true);
      return audioStreamInfo.videoId.toString();
    } catch (e) {
      print("Error: $e");
      state = state.copyWith(isLoading: false);
      return null;
    } finally {
      state = state.copyWith(isLoading: false);
      youtube.close();
    }
  }

  addNewAudio({required String docId,
    required String playListName,
    required String name,
    required url,
    required int part}) {
    firestore
        .collection("maruzalar")
        .doc(docId)
        .collection(playListName)
        .add(
        AudioModel(name: name, part: part, audioUrl: url, id: '').toJson());
  }

  deleteAudio(
      {required String docId, required String playListName, required String audioId}) {
    firestore.collection("maruzalar").doc(docId).collection(playListName).doc(
        audioId).delete();
  }

  deletePlaylist({required String docId,}) {
    firestore.collection("maruzalar").doc(docId).delete();
  }

  getAudio({
    required String docId,
    required String playListName,
  }) async {
    state = state.copyWith(isLoading: true);
    List<AudioModel> list = [];
    final res = await firestore.collection("maruzalar").doc(docId).collection(
        playListName).get();
    list.clear();
    for (var element in res.docs) {
      list.add(AudioModel.fromJson(data: element.data(), id: element.id));
    }
    state = state.copyWith(isLoading: false, listOfAudio: list);
  }

  addBanner({required String videoUrl, required String image}) async {
    state = state.copyWith(isLoading: true);
    final storageRef = FirebaseStorage.instance
        .ref()
        .child("bannerImage/${DateTime.now().toString()}");
    await storageRef.putFile(File(image));

    String imageUrl = await storageRef.getDownloadURL();
    state = state.copyWith(imageUrl: imageUrl);
    firestore.collection("banner").add(
        BannerModel(videoUrl: videoUrl, image: imageUrl).toJson());
    state = state.copyWith(isLoading: false);
  }

  getUsers() async {
    state = state.copyWith(isLoading: true);
    List<UserModel> list = [];
    final res = await firestore.collection("users").get();
    for (var element in res.docs) {
      list.add(UserModel.fromJson(element.data(), element.id));
    }
    state = state.copyWith(listOfUsers: list, isLoading: false);
  }

  deleteBanner({required String docId, required int index}) {
    state = state.copyWith(isLoading: true);
    List<BannerModel> list = [];
    firestore.collection("banner").doc(docId).delete();
    list = state.listOfBanner;
    list.removeAt(index);
    state = state.copyWith(isLoading: false, listOfBanner: list);
  }

  getBanner() async {
    state = state.copyWith(isLoading: true);
    List<BannerModel> list = [];
    final res = await firestore.collection("banner").get();
    for (var element in res.docs) {
      list.add(BannerModel.fromJson(element.data(), element.id));
    }
    state = state.copyWith(listOfBanner: list, isLoading: false);
  }

  updateBanner(
      {required String docId, required String image, required String videoId, required String oldVideoId}) async {
    state = state.copyWith(isLoading: true);
    if (image != "") {
      final storageRef = FirebaseStorage.instance
          .ref()
          .child("bannerImage/${DateTime.now().toString()}");
      await storageRef.putFile(File(image));

      String imageUrl = await storageRef.getDownloadURL();
      state = state.copyWith(imageUrl: imageUrl);
      firestore.collection("banner").doc(docId).update({"image": imageUrl});
    }
    else if (videoId != oldVideoId) {
      firestore.collection("banner").doc(docId).update({"videoUrl": videoId});
    }
    state = state.copyWith(isLoading: false);
  }

  updateAudio(
      {required String docId, required String playListName, required String audioId, required String audioUrl, required String name, required int part}) {
    state = state.copyWith(isLoading: true);
    firestore.collection("maruzalar").doc(docId).collection(playListName).doc(
        audioId).update({"audioUrl": audioUrl, "name": name, "part": part});
    state = state.copyWith(isLoading: false);
  }
  
  updatePlaylistName({required String docId,required String name}){
    firestore.collection("maruzalar").doc(docId).update({"playlistName":name});
  }
  List<ProductModel> list = [];

  searchBook(String code) async {
    if (code.isEmpty) {
      state=(state.copyWith(listOfProduct: []));
    } else {
      var res = await firestore
          .collection("product")
          .orderBy("code")
          .startAt([code]).endAt(["$code\uf8ff"]).get();

      //state.listOfProduct.clear();
      for (var element in res.docs) {
        list.add(ProductModel.fromJson(data: element.data()));
      }
      print(list);

      state=(state.copyWith(listOfProduct: list));
    }
  }
}
