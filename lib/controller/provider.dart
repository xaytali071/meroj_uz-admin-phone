import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meroj_uz_admin_phone/controller/network_controller/network_notifire.dart';
import 'package:meroj_uz_admin_phone/controller/network_controller/network_state.dart';
import 'package:meroj_uz_admin_phone/controller/prayer_controller/prayer_notifire.dart';
import 'package:meroj_uz_admin_phone/controller/prayer_controller/prayer_state.dart';

import 'app_controller/app_notifire.dart';
import 'app_controller/app_state.dart';

final networkProvider=StateNotifierProvider<NetworkNotifire,NetworkState>((ref) => NetworkNotifire());
final appProvider=StateNotifierProvider<AppNotifire,AppState>((ref) => AppNotifire());
final prayerProvider=StateNotifierProvider<PrayerNotifire,PrayerState>((ref) => PrayerNotifire());