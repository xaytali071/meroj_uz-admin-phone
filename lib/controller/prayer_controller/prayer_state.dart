import 'package:freezed_annotation/freezed_annotation.dart';
part 'prayer_state.freezed.dart';

@freezed
class PrayerState with _$PrayerState{

 const factory PrayerState(
      {@Default(0) int tasbehCount,
        @Default("Allohu Akbar") String mentions,
        @Default(33) int maxTasbeh,
        @Default(0) int bomdodCounter,
        @Default(0) int peshinCounter,
        @Default(0) int asrCounter,
        @Default(0) int shomCounter,
        @Default(0) int xuftonCounter,
        @Default(0) int vitrCounter,
        @Default(0) int currentIndex,
      })=_PrayerState;
}
