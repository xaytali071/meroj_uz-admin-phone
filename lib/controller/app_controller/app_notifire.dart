import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../infostructure/local_store.dart';
import 'app_state.dart';

class AppNotifire extends StateNotifier<AppState> {
  AppNotifire() : super(AppState());

  hide() {
    state=state.copyWith(isHide: state.isHide !=state.isHide);
  }

  bannerIndex(int index) {
    state=state.copyWith(index: index);
  }

  changeIndex(int index) {
    state=state.copyWith(currentIndex: index);
  }

  changeMode() {
    state=state.copyWith(isDark: LocalStorage.getMode());
  }


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
}