import 'package:flutter/material.dart';

import '../../shared/global/app_colors.dart';
import '../../shared/utils/app_assets.dart';
import '../../shared/utils/app_strings.dart';
import '../../shared/utils/app_values.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(

      children:  [
        const Text(AppStrings.headText,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),

        const Text(AppStrings.bodyText,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: AppColors.boldGrey
          ),
        ),
        SizedBox(height: mediaQueryHeight(context)*.12,)
      ],
    );
  }
}
