import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'presentation/bloc/location_bloc.dart';
import 'presentation/bloc/weather_bloc.dart';
import 'presentation/routes/app_route.dart';

import 'injection.dart' as injection;

void main() {
  injection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => injection.locator<GetWeatherBloc>(),
        ),
        BlocProvider(
          create: (_) => injection.locator<LocationBloc>(),
        )
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
      ),
    );
  }
}
