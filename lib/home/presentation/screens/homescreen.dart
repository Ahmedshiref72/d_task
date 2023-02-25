import 'dart:io';
import 'package:d_task/home/componantes/uploadImage_widget.dart';
import 'package:d_task/home/presentation/controller/home_state.dart';
import 'package:d_task/shared/global/app_colors.dart';
import 'package:d_task/shared/utils/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/components/alert_dialoge.dart';
import '../../../shared/components/alert_dialoge_result.dart';
import '../../../shared/components/toast_component.dart';
import '../../../shared/utils/app_assets.dart';
import '../../../shared/utils/app_strings.dart';
import '../../componantes/main_button.dart';
import '../controller/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context,state){
     if (state is PickImageSuccessState) {
          {
            showDialog(
                context: context,
                builder: (_) {
                  Future.delayed(Duration(seconds: 4), () {
                    Navigator.of(context).pop();
                  });
                  return  alertDialog(
                    imageSrc: File(HomeCubit.get(context).imagePath!),
                    text:
                    AppStrings.result,
                  );
                });
          }
        }
        else  if (state is ChangeDurationEndState) {
          {
            showDialog(
                context: context,
                builder: (_) {
                  return   const alertDialogResult(
                    imageSrc: ImageAssets.line,
                    text:
                    AppStrings.result,
                    text2:  AppStrings.bengin,
                  );
                });
          }
        }
        else if (state is PickImageErrorState) {
          showToast(
              text: AppStrings.tryAgain ,
              state: ToastStates.ERROR);
        }

      },
      builder: (context,state){

        return  Directionality(
          textDirection: TextDirection.ltr,
          child: SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                      alignment: Alignment.bottomCenter,
                      children:  [
                        const Center(child: UploadImage()),
                        Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Column(

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
                            ),
                          ],
                        ),


                      ]),
                  MainButton(
                    title: AppStrings.upload,
                    onPressed: () {
                      HomeCubit.get(context).pickMedia();
                      HomeCubit.get(context).counter();
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },

    );
  }
}
