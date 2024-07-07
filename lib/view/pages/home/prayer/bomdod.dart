import 'package:flutter/material.dart';
import 'package:meroj_uz_admin_phone/view/components/style.dart';
import 'package:meroj_uz_admin_phone/view/pages/home/prayer/namaz_components/intention.dart';
import 'package:meroj_uz_admin_phone/view/pages/home/prayer/namaz_components/qiyom.dart';
import 'package:meroj_uz_admin_phone/view/pages/home/prayer/namaz_components/ruku.dart';
import 'package:meroj_uz_admin_phone/view/pages/home/prayer/namaz_components/sajda.dart';
import 'package:meroj_uz_admin_phone/view/pages/home/prayer/namaz_components/takbir.dart';

class Bomdod extends StatefulWidget {
  const Bomdod({super.key});

  @override
  State<Bomdod> createState() => _BomdodState();
}

class _BomdodState extends State<Bomdod> {
  List<Widget> list=[Intention(),Takbir(),Qiyom(),Ruku(),Sajda(),];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: list.length,
          itemBuilder: (context,index){
        return list[index];
      }),
    );
  }
}
