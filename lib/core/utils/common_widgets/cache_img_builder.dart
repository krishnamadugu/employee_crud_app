import 'package:flutter/material.dart';

class CacheImgBuilder extends StatelessWidget {
  const CacheImgBuilder({
    super.key,
    required this.imageProvider,
    required this.heightVal,
    required this.widthVal,
    required this.borderRadiusVal,
  });

  final ImageProvider<Object> imageProvider;
  final double heightVal;
  final double widthVal;
  final double borderRadiusVal;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightVal,
      width: widthVal,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(
          borderRadiusVal,
        ),
      ),
    );
  }
}
