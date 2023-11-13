


import 'package:go_router/go_router.dart';
import 'package:smartfood/presentation/screens/login/login.dart';
import 'package:smartfood/presentation/screens/screens.dart';

final appRouter = GoRouter(

  initialLocation: '/home',
  routes: [

    GoRoute(
      path: '/login',
      builder: (context, state) => const HomeScreen(),
    ),

    GoRoute(
      path: '/home',
      builder: (context, state) => const LoginScreen(),
    )

  ]

);