import 'package:go_router/go_router.dart';
import 'package:pawang_hujan/presentation/pages/home_page.dart';
import 'package:pawang_hujan/presentation/routes/component_route.dart';

import '../pages/splash_page.dart';

final router = GoRouter(
  routes: [
    goRoute(
      name: 'splash',
      path: '/',
      child: const SplashPage(),
    ),
    goRoute(
      name: 'home',
      path: '/home',
      child: const HomePage(),
    )
  ],
);
