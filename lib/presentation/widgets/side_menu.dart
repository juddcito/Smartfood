

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smartfood/presentation/screens/home/menu_items.dart';

class SideMenu extends StatefulWidget {

  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({
    super.key,
    required this.scaffoldKey
  });



  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {

  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value;
        });

        final menuItem = appMenuItems[value];

        if (menuItem.title == 'Cerrar sesión') {
          widget.scaffoldKey.currentState?.closeDrawer();
          context.pushReplacement('/login');
        } else {
          context.push(appMenuItems[value].link);
          widget.scaffoldKey.currentState?.closeDrawer();
        }
        
      },
      children: [

        Padding(
           padding: EdgeInsets.fromLTRB(28, hasNotch ? 15 : 20 , 16, 25
           ),
          child: CircleAvatar(
            backgroundColor: colors.secondary,
            minRadius: 48,
            child: Icon(
              Icons.person,
              size: 64,
              color: colors.onPrimary,
            ),
          ),
        ),

        ...appMenuItems.map((item) => NavigationDrawerDestination(
          icon: item.icon,
          label: Text(item.title)
          )
        )

      ]
    );
  }
}

