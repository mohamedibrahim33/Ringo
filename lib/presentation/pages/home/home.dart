import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dev_test/presentation/pages/projects/projects.dart';
import 'package:flutter_dev_test/presentation/pages/home/cubit/home_cubit.dart';
import 'package:flutter_dev_test/presentation/pages/home/widgets/bottom_navigation_bar.dart';
import 'package:flutter_dev_test/presentation/pages/main/main_page.dart';
import 'package:flutter_dev_test/presentation/pages/profile/profile.dart';
import 'package:flutter_dev_test/presentation/pages/Calendar/calendar.dart';

class HomePage extends StatelessWidget {
  final List<Widget> navBarPagesList = [
    const MainPage(),
     Projects(),
    const CalendarPage(),
    const ProfilePage(),
  ];
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          HomeCubit cubit = HomeCubit.get(context);
          return Scaffold(
            bottomNavigationBar: const BottomNavigationBarWidget(),
            body: navBarPagesList[cubit.currentIndex],
          );
        },
      ),
    );
  }
}
