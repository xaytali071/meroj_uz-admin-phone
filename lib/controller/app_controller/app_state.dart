import 'package:freezed_annotation/freezed_annotation.dart';
part 'app_state.freezed.dart';

@freezed
class AppState with _$AppState{

const factory AppState ({
    @Default(false) bool isHide,
    @Default(0) int index,
    @Default(0) int currentIndex,
    @Default(false) bool isLoading,
    @Default(0) int tasbehCount,
    @Default("Allohu Akbar") String mentions,
    @Default(33) int maxTasbeh,
    @Default(false) bool isDark,
  })=_AppState;

}