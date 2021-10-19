import 'package:admin_app/core/router/app_router.dart';
import 'package:admin_app/di/di.dart';
import 'package:admin_app/ui/dashboard/dashboard_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with AutomaticKeepAliveClientMixin<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Dashboard'),
            ElevatedButton(
              onPressed: () {
                context.read(dashboardViewModelProvider.notifier).login();
              },
              child: Text('Call API from core'),
            ),
            ElevatedButton(
              onPressed: () {
                getIt.get<AppRouter>().navigateTo('/sharedinfo');
              },
              child: Text('Go to SharedInfo'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
