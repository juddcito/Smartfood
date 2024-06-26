

import 'package:flutter/material.dart';
import 'package:smartfood/domain/models/menu_item.dart';

final  appMenuItems = <MenuItem> [

  MenuItem(
    title: 'Inicio',
    link: '/',
    icon: const Icon(Icons.home)
  ),

  MenuItem(
    title: 'Preferencias',
    link: '/preferencias',
    icon: const Icon(Icons.settings_accessibility_outlined)
  ),

  MenuItem(
    title: 'Historial de pedidos',
    link: '/historial-pedidos',
    icon: const Icon(Icons.local_mall)
  ),

  MenuItem(
    title: 'Cerrar sesión',
    link: '/logout',
    icon: const Icon(Icons.logout)
  ),

];
