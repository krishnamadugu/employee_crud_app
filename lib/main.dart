import 'package:employee_info/core/services/storage_service/hive_storage/app_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/route_config/route_handler.dart';
import 'config/theme_config/app_theme_config.dart';
import 'core/constants/app_constants/text_values.dart';
import 'feat/home/view_model/emp_record_view_model/emp_record_bloc.dart';

void main() async {
  /// hive local data base setup
  await AppDatabase.instance.initialize();

  /// run app command
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<EmployeeRecordBloc>(
          create: (BuildContext context) =>
              EmployeeRecordBloc()..add(OnFetchEmpData()),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,

        /// theme and title properties
        title: AppTexts.kAppTitle,
        theme: AppThemeConfig.lightTheme,
        darkTheme: AppThemeConfig.darkTheme,

        /// router properties
        routerConfig: RouteHandler.router,
      ),
    );
  }
}
