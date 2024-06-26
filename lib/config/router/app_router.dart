


import 'package:go_router/go_router.dart';
import 'package:smartfood/domain/entities/recomendacion.dart';
import 'package:smartfood/presentation/screens/carrito/carrito_screen.dart';
import 'package:smartfood/presentation/screens/chat/chat_screen.dart';
import 'package:smartfood/presentation/screens/detalle_platillo/detalle_platillo_screen.dart';
import 'package:smartfood/presentation/screens/favoritos_ver_todas/recomendaciones_ver_todas.dart';
import 'package:smartfood/presentation/screens/login/login_screen.dart';
import 'package:smartfood/presentation/screens/pedidos/pedidos_screen.dart';
import 'package:smartfood/presentation/screens/preferencias/preferencias_modificar_screen.dart';
import 'package:smartfood/presentation/screens/recomendaciones_ver_todas/recomendaciones_ver_todas.dart';
import 'package:smartfood/presentation/screens/screens.dart';
import 'package:smartfood/presentation/screens/signup/preferencias_screen.dart';
import 'package:smartfood/presentation/screens/splash/splash_screen.dart';

final appRouter = GoRouter(

  initialLocation: '/',
  routes: [

    GoRoute(
      path: '/',
      builder: (context, state) => LoginScreen(),
    ),

    GoRoute(
      path: '/splash',
      builder: (context, state) => SplashScreen(),
    ),

    GoRoute(
      path: '/login',
      builder: (context, state) =>  LoginScreen(),
    ),

    GoRoute(
      path: '/signup',
      builder: (context, state) => const SignUpScreen(),
    ),

    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),

    GoRoute(
      path: '/detalle-platillo',
      builder: (context, state) => DetallePlatilloScreen(platillo: state.extra! as Recomendacion),
    ),

    GoRoute(
      path: '/carrito',
      builder: (context, state) => const CarritoScreen(),
    ),

    GoRoute(
      path: '/recomendaciones-ver-todas',
      builder: (context, state) => const RecomendacionesVerTodasScreen(),
    ),

    GoRoute(
      path: '/favoritos-ver-todos',
      builder: (context, state) => const FavoritosVerTodasScreen(),
    ),

    GoRoute(
      path: '/chat',
      builder: (context, state) => const ChatScreen(),
    ),

    GoRoute(
      path: '/preferencias',
      builder: (context, state) => PreferenciasModificarScreen(),
    ),

    GoRoute(
      path: '/historial-pedidos',
      builder: (context, state) => PedidosScreen(),
    ),

  ]

);