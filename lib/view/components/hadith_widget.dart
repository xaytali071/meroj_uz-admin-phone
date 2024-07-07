import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meroj_uz_admin_phone/controller/network_controller/network_state.dart';
import 'package:meroj_uz_admin_phone/controller/provider.dart';
import 'package:meroj_uz_admin_phone/view/components/image/custom_network_image.dart';
import 'package:meroj_uz_admin_phone/view/components/style.dart';


class HadithWidget extends ConsumerStatefulWidget {
  const HadithWidget({super.key, });

  @override
  ConsumerState<HadithWidget> createState() => _HadithWidgetState();
}

class _HadithWidgetState extends ConsumerState<HadithWidget> {
  @override
  void initState() {
    ref.read(networkProvider.notifier).gethadith();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final event=ref.read(networkProvider.notifier);
    NetworkState watch=ref.watch(networkProvider);

        return DraggableScrollableSheet(
    initialChildSize: 0.5,
      maxChildSize: 1,
      builder: (context,scontroller) {
        return ListView.builder(
            shrinkWrap: true,
           // physics: NeverScrollableScrollPhysics(),
            controller: scontroller,
            itemCount: watch.listOfHadith.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Style.white,
                      borderRadius: BorderRadius.circular(20.r)
                  ),
                  child: Padding(
                    padding:  EdgeInsets.all(10.r),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          watch.listOfHadith[index].title ?? "", style: Style.normalText(),),
                        10.verticalSpace,
                        watch.listOfHadith[index].image == null || watch.listOfHadith[index].image == ""
                            ? const SizedBox.shrink()
                            : CustomImageNetwork(image: watch.listOfHadith[index].image ??
                            "", height: 200,),
                        10.verticalSpace,
                        Text(watch.listOfHadith[index].body ?? "", style: Style.miniText(),)
                      ],
                    ),
                  ),
                ),
              );
            });
      }
    );

  }
}
