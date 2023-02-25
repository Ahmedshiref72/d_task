import 'package:d_task/home/componantes/uploadImage_widget.dart';
import 'package:d_task/shared/global/app_colors.dart';
import 'package:d_task/shared/utils/app_values.dart';
import 'package:flutter/material.dart';

import '../../../shared/utils/app_strings.dart';
import '../../componantes/main_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                  alignment: Alignment.center,
                  children:  [
                Center(child: UploadImage()),
                Column(

                  children: const [
                    SizedBox(height: 130,),
                    Text(AppStrings.headText,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    SizedBox(height: 2,),
                    Text(AppStrings.bodyText,
                    style: TextStyle(
                      fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: AppColors.boldGrey
                    ),
                    ),
                  ],
                ),


              ]),
              MainButton(
                title: AppStrings.upload,
                onPressed: () {

                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
