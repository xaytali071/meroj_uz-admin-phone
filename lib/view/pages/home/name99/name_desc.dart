import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/style.dart';

class NameDesc extends StatelessWidget {
  final String name;
  final String desc;
  const NameDesc({super.key, required this.name, required this.desc});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Style.primary,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Style.yellow,),onPressed: (){
          Navigator.pop(context);
        },),
        backgroundColor: Style.primary,
        title:  Text(name,style: Style.boldText(color: Style.yellow,size: 20),),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          children: [
            10.verticalSpace,
            Text(desc,style: Style.normalText2(color: Style.yellow),)
          ],
        ),
      ),
    );
  }
}
