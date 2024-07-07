import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:meroj_uz_admin_phone/controller/prayer_controller/prayer_state.dart';

import '../../infostructure/local_store.dart';

class PrayerNotifire extends StateNotifier<PrayerState>{
  PrayerNotifire() : super(const PrayerState());

  tasbehCounter(){
    if(state.tasbehCount==state.maxTasbeh) {
      state=state.copyWith(tasbehCount: 0);
    }
    else{
      state=state.copyWith(tasbehCount: state.tasbehCount + 1);
    }
  }

  maxTasbeh(int maxTasbeh){
    state=state.copyWith(maxTasbeh: maxTasbeh);
  }

  changeMentions(String mentions){
    state=state.copyWith(mentions:mentions,tasbehCount: 0);
  }

  addBomdod(){
    state=state.copyWith(bomdodCounter: state.bomdodCounter+1);
    LocalStorage.setBomdod(state.bomdodCounter);
    Vibrate.feedback(FeedbackType.light);

  }
  removeBomdod(){
    if(state.bomdodCounter==0){
    }else{
      state=state.copyWith(bomdodCounter: state.bomdodCounter-1);
      LocalStorage.setBomdod(state.bomdodCounter);
      Vibrate.feedback(FeedbackType.light);
    }
  }

  addPeshin(){
    state=state.copyWith(peshinCounter: state.peshinCounter+1);
    LocalStorage.setPeshin(state.peshinCounter);
    Vibrate.feedback(FeedbackType.light);
  }
  removePeshin(){
    if(state.peshinCounter==0){
    }else{
      state=state.copyWith(peshinCounter: state.peshinCounter-1);
      LocalStorage.setPeshin(state.peshinCounter);
      Vibrate.feedback(FeedbackType.light);
    }
  }

  addAsr(){
    state=state.copyWith(asrCounter: state.asrCounter+1);
    LocalStorage.setAsr(state.asrCounter);
    Vibrate.feedback(FeedbackType.light);
  }
  removeAsr(){
    if(state.asrCounter==0){
    }else{
      state=state.copyWith(asrCounter:state.asrCounter-1);
      LocalStorage.setAsr(state.asrCounter);
      Vibrate.feedback(FeedbackType.light);
    }
  }

  addShom(){
    state=state.copyWith(shomCounter: state.shomCounter+1);
    LocalStorage.setShom(state.shomCounter);
    Vibrate.feedback(FeedbackType.light);
  }


  removeShom(){
    if(state.shomCounter==0){
    }else{
      state=state.copyWith(shomCounter: state.shomCounter-1);
      LocalStorage.setShom(state.shomCounter);
      Vibrate.feedback(FeedbackType.light);
    }
  }


  addXufton(){
    state=state.copyWith(xuftonCounter: state.xuftonCounter+1);
    LocalStorage.setXufton(state.xuftonCounter);
    Vibrate.feedback(FeedbackType.light);
  }


  removeXufton(){
    if(state.xuftonCounter==0){
    }else{
      state=state.copyWith(xuftonCounter: state.xuftonCounter-1);
      LocalStorage.setXufton(state.xuftonCounter);
      Vibrate.feedback(FeedbackType.light);
    }
  }


  addVitr(){
    state=state.copyWith(vitrCounter: state.vitrCounter+1);
    LocalStorage.setVitr(state.vitrCounter);
    Vibrate.feedback(FeedbackType.light);
  }

  removeVitr(){
    if(state.vitrCounter==0){
    }else{
      state=state.copyWith(vitrCounter: state.vitrCounter-1);
      LocalStorage.setVitr(state.vitrCounter);
      Vibrate.feedback(FeedbackType.light);
    }
  }

  getQaza(){
    state=state.copyWith(bomdodCounter:LocalStorage.getBomdod());
    state=state.copyWith(peshinCounter:LocalStorage.getPeshin());
    state=state.copyWith(asrCounter:LocalStorage.getAsr());
    state=state.copyWith(shomCounter:LocalStorage.getShom());
    state=state.copyWith(xuftonCounter:LocalStorage.getXufton());
    state=state.copyWith(vitrCounter:LocalStorage.getVitr());
  }

  nextPage(){
    state=state.copyWith(currentIndex: state.currentIndex+1);
  }
  previous(){
    state=state.copyWith(currentIndex: state.currentIndex-1);
  }
}