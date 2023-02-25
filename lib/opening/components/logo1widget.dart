import 'package:flutter/material.dart';

import '../../shared/utils/app_assets.dart';
import '../../shared/utils/app_values.dart';

class Logo1Widget extends StatelessWidget {
  const Logo1Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImageAssets.logo1,
      height: mediaQueryHeight(context) / AppSize.s4,

    );
  }
}
