import 'package:freezed_annotation/freezed_annotation.dart';
import '../../infostructure/model/audio_model.dart';
import '../../infostructure/model/banner_model.dart';
import '../../infostructure/model/maruza_model.dart';
import '../../infostructure/model/hadis_model.dart';
import '../../infostructure/model/user_model.dart';
import '../../infostructure/product_model.dart';
part 'network_state.freezed.dart';

@freezed
class NetworkState with _$NetworkState {
  const factory NetworkState(
      {@Default([]) List<HadithModel> listOfHadith,
      @Default(false) bool isLoading,
      @Default("") String imagePath,
        @Default("") String imageUrl,
        @Default([]) List<MaruzaModel> playList,
        @Default([]) List<AudioModel> listOfAudio,
        @Default([]) List<UserModel> listOfUsers,
        @Default([]) List<BannerModel> listOfBanner,
        @Default(false) bool playAudio,
        @Default("") String audio,
        @Default([]) List<ProductModel> listOfProduct,
      }) =_NetworkState;
}
