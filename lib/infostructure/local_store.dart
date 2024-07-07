import 'package:meroj_uz_admin_phone/view/components/app_const.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStorage {
  LocalStorage._();

  static SharedPreferences? local;

  static Future init() async {
    local = await SharedPreferences.getInstance();
  }

  static setBomdod(int value) async {
    local?.setInt(AppConst.bomdod, value);
  }

  static int getBomdod() {
    return local?.getInt(AppConst.bomdod) ?? 0;
  }

  static setPeshin(int value) async {
    local?.setInt(AppConst.peshin, value);
  }

  static int getPeshin() {
    return local?.getInt(AppConst.peshin) ?? 0;
  }
  static setAsr(int value) async {
    local?.setInt(AppConst.asr, value);
  }

  static getAsr() {
    return local?.getInt(AppConst.asr);
  }
  static setShom(int value) async {
    local?.setInt(AppConst.shom, value);
  }

  static getShom() {
    return local?.getInt(AppConst.shom);
  }
  static setXufton(int value) async {
    local?.setInt(AppConst.xufton, value);
  }

  static getXufton() {
    return local?.getInt(AppConst.xufton);
  }

  static setVitr(int value) async {
    local?.setInt(AppConst.vitr, value);
  }

  static getVitr() {
    return local?.getInt(AppConst.vitr);
  }
  static setMode(bool value) async {
    local?.setBool(AppConst.mode, value);
  }

  static getMode()=> local?.getBool(AppConst.mode) ?? false;

  static storeClear() async {

    local?.clear();
  }

}