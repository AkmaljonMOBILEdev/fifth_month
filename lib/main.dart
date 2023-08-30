import 'package:fifth_month/cubits/auth/auth_cubit.dart';
import 'package:fifth_month/cubits/counter_cubit.dart';
import 'package:fifth_month/cubits/math_cubit.dart';
import 'package:fifth_month/cubits/tab_box_cubit.dart';
import 'package:fifth_month/data/firebase/firebase_service.dart';
import 'package:fifth_month/ui/auth_screen/auth_screen.dart';
import 'package:fifth_month/ui/home_screen/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => CounterCubit()),
      BlocProvider(create: (context) => TabBoxCubit()),
      BlocProvider(create: (context)=>MathCubit()),
      BlocProvider(create: (context)=>AuthCubit(fireBaseService: FireBaseService()))
    ], child: MyApp());
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
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                colorScheme:
                    const ColorScheme.light(primary: Colors.deepOrangeAccent)),
            home: AuthScreen(),
          );
        });
  }
}
