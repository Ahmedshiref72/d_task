import 'package:flutter/material.dart';
import '../../shared/global/app_theme.dart';
import '../../shared/utils/app_strings.dart';
import '../../shared/utils/app_values.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
         Text(AppStrings.headText,
          style: lightTheme.textTheme.displayLarge),
         Text(AppStrings.bodyText,
          style: lightTheme.textTheme.headlineMedium),
        SizedBox(height: mediaQueryHeight(context)*.12,)
      ],
    );
  }
}
