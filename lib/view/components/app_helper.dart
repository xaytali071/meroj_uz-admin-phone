import 'package:flutter/material.dart';
import 'package:meroj_uz_admin_phone/view/components/style.dart';

abstract class AppHelper{
  AppHelper._();

  static PreferredSizeWidget appBar(
      BuildContext context,
      String title,
      ){
    return AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Style.yellow,),onPressed: (){
          Navigator.pop(context);
        },),
        backgroundColor: Style.primary,
      title:  Text(title,style: Style.boldText(color: Style.yellow,size: 20),),

    );
  }

  static PreferredSizeWidget appBar2({
   required BuildContext context,
   required String title,
   required List<Widget>? actions,
  }){
    return AppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(icon: Icon(Icons.arrow_back,color: Style.yellow,),onPressed: (){
        Navigator.pop(context);
      },),
      backgroundColor: Style.primary,
      title:  Text(title,style: Style.boldText(color: Style.yellow,size: 20,),overflow: TextOverflow.ellipsis,),
      actions: actions,
    );
  }

}