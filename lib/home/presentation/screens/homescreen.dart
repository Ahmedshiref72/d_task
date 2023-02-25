import 'dart:io';
import 'package:d_task/home/componantes/uploadImage_widget.dart';
import 'package:d_task/home/presentation/controller/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/components/alert_dialoge.dart';
import '../../../shared/components/alert_dialoge_result.dart';
import '../../../shared/components/toast_component.dart';
import '../../../shared/utils/app_assets.dart';
import '../../../shared/utils/app_strings.dart';
import '../../componantes/main_button.dart';
import '../../componantes/text_widget.dart';
import '../controller/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context,state){

        //showDialog that have the image we pick

     if (state is PickImageSuccessState) {
          {showDialog(context: context, builder: (_) {
                  Future.delayed(const Duration(seconds: 4), () {
                    Navigator.of(context).pop();});
                  return  AlertDialogWidget(
                    imageSrc: File(HomeCubit.get(context).imagePath!),
                    text: AppStrings.result,
                  );}
          );}}

     //showDialog that have the Result

        else  if (state is ChangeDurationEndState) {
          {showDialog(
                context: context,
                builder: (_) {
                  return   const AlertDialogResult(
                    imageSrc: ImageAssets.line,
                    text:
                    AppStrings.result,
                    text2:  AppStrings.bengin,
                  );});}}
        //show toast error
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
                  //this stack have image and text
                  Stack(
                      alignment: Alignment.bottomCenter,
                      children:  [
                        //image
                        const Center(child: UploadImage()),
                        //text
                        Stack(
                          alignment: Alignment.bottomLeft,
                          children: const [
                            TextWidget(),
                          ],
                        ),
                      ]
                  ),
                  //upload button
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
