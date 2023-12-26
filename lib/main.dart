import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_group_52/controllers/main/main_cubit.dart';
import 'package:state_management_group_52/controllers/prodcuts/produdcts_cubit.dart';
import 'package:state_management_group_52/controllers/theme_switch/theme_switch_cubit.dart';
import 'package:state_management_group_52/views/products_screen.dart';

import 'views/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MainCubit()),
        BlocProvider(create: (context) => ThemeSwitchCubit()),
        BlocProvider(create: (context) => ProdudctsCubit()),
      ],
      child: BlocConsumer<ThemeSwitchCubit, ThemeSwitchState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return MaterialApp(
            themeMode: ThemeSwitchCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            darkTheme: ThemeData.dark(),
            theme: ThemeData.light(),
            debugShowCheckedModeBanner: false,
            home: ProductsScreen(),
          );
        },
      ),
    );
  }
}
