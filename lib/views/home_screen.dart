import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_group_52/controllers/main/main_cubit.dart';
import 'package:state_management_group_52/controllers/theme_switch/theme_switch_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocConsumer<ThemeSwitchCubit, ThemeSwitchState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                return Switch(
                  value: ThemeSwitchCubit.get(context).isDark,
                  onChanged: (val) {
                    ThemeSwitchCubit.get(context).changeTheme(val);
                  },
                );
              },
            ),
            BlocConsumer<MainCubit, MainState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                print(state);
                return Text(
                  MainCubit.get(context).counter.toString(),
                  style: TextStyle(
                    fontSize: 50,
                    color: state is IncrementState ? Colors.green : Colors.red,
                  ),
                );
              },
            ),
            IconButton(
              onPressed: () {
                MainCubit.get(context).incerment();
                // counter++;
                // setState(() {});
              },
              icon: Icon(Icons.add),
            ),
            IconButton(
              onPressed: () {
                MainCubit.get(context).decerment();
                // counter--;
                // setState(() {});
              },
              icon: Icon(Icons.minimize),
            ),
          ],
        ),
      ),
    );
  }
}
