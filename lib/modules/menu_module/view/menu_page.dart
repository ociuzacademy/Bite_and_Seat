import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bite_and_seat/modules/menu_module/providers/menu_state_provider.dart';
import 'package:bite_and_seat/modules/menu_module/widgets/menu_page_content.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();

  static route() => MaterialPageRoute(builder: (context) => const MenuPage());
}

class _MenuPageState extends State<MenuPage> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MenuStateProvider(),
      child: MenuPageContent(tabController: _tabController),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
