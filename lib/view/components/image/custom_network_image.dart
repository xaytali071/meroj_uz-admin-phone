import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meroj_uz_admin_phone/view/components/image/shimmer_item.dart';


class CustomImageNetwork extends StatelessWidget {
  final String? image;
  final double height;
  final double width;
  final double radius;
  final BoxFit boxFit;
  final Widget child;

  const CustomImageNetwork(
      {Key? key,
        required this.image,
        this.height = 120,
        this.width = double.infinity,
        this.radius = 16,
        this.boxFit = BoxFit.cover,
        this.child= const SizedBox.shrink()})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: CachedNetworkImage(
        height: height,
        width: width,
        fit: boxFit,
        imageUrl: image ?? "",
        progressIndicatorBuilder: (context, text, DownloadProgress value) {
          return ShimmerItem(height: height, width: width, radius: radius);
        },
        errorWidget: (context, _, __) {
          return  const SizedBox.shrink();

        },
      ),
    );
  }
}