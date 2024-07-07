import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meroj_uz_admin_phone/view/components/app_assets.dart';
import 'package:meroj_uz_admin_phone/view/components/style.dart';
import 'package:permission_handler/permission_handler.dart';



class QiblaPage extends StatefulWidget {
  const QiblaPage({
    Key? key,
  }) : super(key: key);

  @override
  _QiblaPage createState() => _QiblaPage();
}

class _QiblaPage extends State<QiblaPage> {
  bool _hasPermissions = false;
  CompassEvent? _lastRead;
  DateTime? _lastReadAt;

  @override
  void initState() {
    super.initState();
    _fetchPermissionStatus();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Style.primary,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(icon: Icon(Icons.arrow_back,color: Style.yellow,),onPressed: (){
            Navigator.pop(context);
          },),
          backgroundColor: Style.primary,
          title:  Text("Qiblani aniqlash",style: Style.boldText(color: Style.yellow,size: 20),),
        ),
        body: Builder(builder: (context) {
          if (_hasPermissions) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                50.verticalSpace,
              //  _buildManualReader(),
                Center(
                  child: Container(
                    width: 300.w,
                      height: 300.h,
                      decoration: BoxDecoration(
                        color: Style.white.withOpacity(0.2),
                        shape: BoxShape.circle
                      ),
                      child: Column(
                        children: [
                          Image.asset(AppAssets.kaaba,width: 80.r,height: 80.r,),
                          Expanded(child: _buildCompass()),
                        ],
                      )),
                ),

              ],
            );
          } else {
            return _buildPermissionSheet();
          }
        }),
      ),
    );
  }

  Widget _buildManualReader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          ElevatedButton(
            child: Text('Read Value'),
            onPressed: () async {
              final CompassEvent tmp = await FlutterCompass.events!.first;
              setState(() {
                _lastRead = tmp;
                _lastReadAt = DateTime.now();
              });
            },
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '$_lastRead',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    '$_lastReadAt',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCompass() {
    return StreamBuilder<CompassEvent>(
      stream: FlutterCompass.events,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error reading heading: ${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        double? direction = snapshot.data!.heading;

        // if direction is null, then device does not support this sensor
        // show error message
        if (direction == null)
          return Center(
            child: Text("Device does not have sensors !"),
          );

        return Transform.rotate(
          angle: (direction * (math.pi / 270)),
          child: Image.asset(AppAssets.arrow,height: 140.r,width: 140.r,)  //Image.asset(AppAssets.compass),
        );
      },
    );
  }

  Widget _buildPermissionSheet() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('Iltimaos joylashuvni yoqing',style: Style.normalText(color: Style.yellow),),
          30.verticalSpace,
          ElevatedButton(
            child: Text('Ruxsatlar'),
            onPressed: () {
              Permission.locationWhenInUse.request().then((ignored) {
                _fetchPermissionStatus();
              });
            },
          ),
          SizedBox(height: 16),
          ElevatedButton(
            child: Text('Sozlamalarni ochish'),
            onPressed: () {
              openAppSettings().then((opened) {
                //
              });
            },
          )
        ],
      ),
    );
  }

  void _fetchPermissionStatus() {
    Permission.locationWhenInUse.status.then((status) {
      if (mounted) {
        setState(() => _hasPermissions = status == PermissionStatus.granted);
      }
    });
  }
}