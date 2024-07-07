import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meroj_uz_admin_phone/controller/provider.dart';
import 'package:meroj_uz_admin_phone/view/components/buttons/button_effect.dart';
import 'package:meroj_uz_admin_phone/view/components/buttons/custom_video_button.dart';
import 'package:meroj_uz_admin_phone/view/components/image/custom_network_image.dart';
import 'package:meroj_uz_admin_phone/view/components/style.dart';
import 'package:meroj_uz_admin_phone/view/components/video/video.dart';
import 'package:meroj_uz_admin_phone/view/pages/additions/banner/edit_banner_page.dart';

import '../../controller/app_controller/app_state.dart';
import '../../infostructure/model/banner_model.dart';

class BannerHome extends ConsumerStatefulWidget {
 final List<BannerModel> list;
  const BannerHome({
    required this.list,
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<BannerHome> createState() => _BannerHomeState();
}

class _BannerHomeState extends ConsumerState<BannerHome> {


  @override
  Widget build(BuildContext context) {
    final event=ref.read(appProvider.notifier);
    AppState watch=ref.watch(appProvider);
        return Column(
          children: [
            SizedBox(
              height: 150.h,
              child: PageView.builder(
                  onPageChanged: (s) {
                    ref.read(appProvider.notifier).bannerIndex(s);

                  },
                  itemCount: widget.list.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onLongPress: (){
                        showDialog(context: context, builder: (context){
                          return Dialog(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ElevatedButton(onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (_)=> EditBannerPage(data:widget.list[index] ,)));
                                }, child: Text("Edit")),
                              10.verticalSpace,
                              ElevatedButton(onPressed: (){
                                 ref.read(networkProvider.notifier).deleteBanner(docId: ref.watch(networkProvider).listOfBanner[index].id ?? "",index: index);
                              }, child: Text("Delete"))
                              ],
                            ),
                          );
                        });

                      },
                      onTap: () {},
                      child: Stack(
                        children: [
                          AnimationButtonEffect(
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 10.w),
                              height: 150.h,
                              width: MediaQuery.sizeOf(context).width,
                              decoration: BoxDecoration(
                                color: Style.white,
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child:CustomImageNetwork(image: widget.list[index].image,radius: 8,),
                            ),
                          ),
                          Positioned(
                              left: 70.w,
                              top:50.h,
                              child: GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (_)=>CustomYoutubeVideoPlayer(videoUrl: widget.list[index].videoUrl ?? "")));
                                  },
                                  child: const CustomVideoButton()))
                        ],
                      ),
                    );
                  }),
            ),
            10.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 5.h,
                  child: Center(
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.list.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(right: 3.w),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              width: index == watch.index ? 25.w : 10.w,
                              height: 4.h,
                              decoration: BoxDecoration(
                                  color: index == watch.index
                                      ? Style.green
                                      : Style.darkGrey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.r))),
                            ),
                          );
                        }),
                  ),
                ),
              ],
            ),
          ],
        );

  }
}
