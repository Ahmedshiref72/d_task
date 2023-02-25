import 'package:d_task/shared/global/app_colors.dart';
import 'package:d_task/shared/utils/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../shared/utils/app_routes.dart';
import '../../../shared/utils/navigation.dart';
import '../../components/logo1widget.dart';
import '../../components/logo_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

     Future.delayed(const Duration(seconds: 3), () {
      {
        navigateFinalTo(context: context, screenRoute: Routes.homeScreen);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,

      body: Column(
        children: [

          Center(
            child: Stack(
              children: [
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Center(child: Logo1Widget()),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: mediaQueryHeight(context)*.15,),
          Center(
            child: Stack(
              children: [
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Center(child: LogoWidget()),
                    ],
                  ),
                )
              ],
            ),
          ),

        ],
      ),
    );
  }
}
