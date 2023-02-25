import 'package:flutter/material.dart';
import '../../shared/utils/app_assets.dart';
import '../../shared/utils/app_values.dart';

class UploadImage extends StatelessWidget {
  const UploadImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImageAssets.uploadImage,
      height: mediaQueryHeight(context) / AppSize.s1_5,
    );
  }
}
