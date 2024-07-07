import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meroj_uz_admin_phone/controller/app_controller/app_notifire.dart';
import 'package:meroj_uz_admin_phone/controller/app_controller/app_state.dart';
import 'package:meroj_uz_admin_phone/view/components/style.dart';
import 'package:meroj_uz_admin_phone/view/pages/additions/additions_page.dart';
import 'package:meroj_uz_admin_phone/view/pages/home/home_page.dart';
import 'package:meroj_uz_admin_phone/view/pages/settings/settings_page.dart';

import '../../../controller/provider.dart';

class BottomBar extends ConsumerStatefulWidget {
  const BottomBar({super.key});

  @override
  ConsumerState<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends ConsumerState<BottomBar> {
  List<Widget> list = [const HomePage(), const AdditionsPage(), const SettingsPage()];

  @override
  Widget build(BuildContext context) {
    final event=ref.read(appProvider.notifier);
    AppState watch=ref.watch(appProvider);
    return Scaffold(
          body: list[watch.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: watch.isDark ? Style.black.withOpacity(0.8) : Style.white,
            selectedItemColor: Style.primary,
            selectedLabelStyle: Style.normalText(),
            selectedIconTheme: IconThemeData(size: 25.r),
            currentIndex: watch.currentIndex,
            onTap: (s) {
              event.changeIndex(s);
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Uy"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.apps), label: "Qo'shimchalar"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: "Sozlamalar"),
            ],
          ),
        );

  }
}
