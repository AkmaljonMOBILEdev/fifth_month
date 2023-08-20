import 'package:fifth_month/cubits/tab_box_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TabBoxCubit, int>(
        builder: (context, tabIndex){
          return context.read<TabBoxCubit>().screens[tabIndex];
        },
      ),
      bottomNavigationBar: BlocBuilder<TabBoxCubit, int>(
        builder:(context, tabIndex){
          return  BottomNavigationBar(
            onTap: (value){
              context.read<TabBoxCubit>().changeIndex(value);
            },
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.black38,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.deepOrangeAccent,
            currentIndex: tabIndex,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.multitrack_audio), label: "Counter"),
              BottomNavigationBarItem(icon: Icon(Icons.calculate_outlined), label: "Math"),
              BottomNavigationBarItem(icon: Icon(Icons.app_registration), label: "Sign"),
            ],
          );
        }
      ),
    );
  }
}
