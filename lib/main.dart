import 'package:fifth_month/cubit/downloader_cubit/downloader_cubit.dart';
import 'package:fifth_month/ui/chat/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'data/services/local_notification_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => DownloaderCubit())],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return ScreenUtilInit(
        designSize: Size(screenSize.width, screenSize.height),
        splitScreenMode: true,
        minTextAdapt: true,
        builder: (BuildContext context, Widget? child) {
          final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
          LocalNotificationService.localNotificationService.init(navigatorKey);
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: ChatScreen(),
          );
        });
  }
}
