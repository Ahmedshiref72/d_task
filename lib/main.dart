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
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
      statusBarBrightness: Brightness.dark, // For iOS (dark icons)
    ),
  );

  runApp(DevicePreview(enabled: !kReleaseMode, builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
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

