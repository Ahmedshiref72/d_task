import 'package:d_task/home/presentation/controller/home_cubit.dart';
import 'package:d_task/shared/global/app_theme.dart';
import 'package:d_task/shared/utils/app_routes.dart';
import 'package:d_task/shared/utils/app_strings.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  //Bloc.observer = MyBlocObserver();
  // DioHelper.init();
 // CacheHelper.init();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
      statusBarBrightness: Brightness.dark, // For iOS (dark icons)
    ),
  );

  runApp(DevicePreview(enabled: !kReleaseMode, builder: (context) => MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // const MyApp._internal();
  //
  // static const MyApp instance = MyApp._internal();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider (
      providers: [
        BlocProvider(create: (BuildContext context) =>HomeCubit()),
      ],
      child: MaterialApp(
            debugShowCheckedModeBanner: false,
            useInheritedMediaQuery: true,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            onGenerateRoute: RouteGenerator.getRoute,
            theme: lightTheme,
            title: AppStrings.appTitle,
      ),
    );

  }
}

