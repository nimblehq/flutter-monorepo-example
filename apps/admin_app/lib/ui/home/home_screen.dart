import 'package:admin_app/ui/dashboard/dashboard_screen.dart';
import 'package:admin_app/ui/setting/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedPageProvider = StateProvider.autoDispose<int>((_) => 0);

class HomeScreen extends HookWidget {
  final List<Widget> _widgetOptions = <Widget>[
    DashboardScreen(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final PageController pageController = usePageController(initialPage: 0);
    return ProviderListener<StateController<int>>(
      provider: selectedPageProvider,
      onChange: (context, indexProvider) {
        pageController.animateToPage(indexProvider.state,
            duration: Duration(milliseconds: 200), curve: Curves.fastOutSlowIn);
      },
      child: Scaffold(
        body: PageView(
            controller: pageController,
            physics: NeverScrollableScrollPhysics(),
            children: _widgetOptions),
        bottomNavigationBar: Consumer(
          builder: (context, ScopedReader watch, _) {
            final index = watch(selectedPageProvider).state;
            return BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Dashboard',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Setting',
                ),
              ],
              currentIndex: index,
              selectedItemColor: Colors.amber[800],
              onTap: (index) {
                print(index);
                context.read(selectedPageProvider).state = index;
              },
            );
          },
        ),
      ),
    );
  }
}
