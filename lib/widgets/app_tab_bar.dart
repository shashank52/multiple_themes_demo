import 'package:flutter/material.dart';
import 'package:multiple_themes_demo/constant/routes.dart';
import 'package:multiple_themes_demo/widgets/app_buttons.dart';
import 'package:multiple_themes_demo/widgets/app_chips.dart';

class AppTabBar extends StatefulWidget {
  const AppTabBar({super.key});

  @override
  State<AppTabBar> createState() => _AppTabBarState();
}

class _AppTabBarState extends State<AppTabBar> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Switch Demo'),
        bottom: TabBar(
          controller: _tabController,
          dividerColor: Colors.transparent,
          tabs: const <Widget>[
            Tab(
              text: 'Buttons',
            ),
            Tab(
              text: 'Chips',
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: InkWell(
                onTap: () => Navigator.of(context).pushNamed(Routes.setting),
                child: const Icon(Icons.settings)),
          )
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[AppButtons(), AppChips()],
      ),
    );
  }
}
