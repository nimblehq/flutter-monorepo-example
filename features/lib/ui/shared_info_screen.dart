import 'package:features/core/router/features_router.dart';
import 'package:features/core/router/features_routes.dart';
import 'package:features/di/di.dart';
import 'package:features/ui/shared_info_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SharedInfoScreen extends StatelessWidget {
  const SharedInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('sss'),
            ElevatedButton(
              onPressed: () {
                context.read(sharedInfoViewModelProvider.notifier).login();
              },
              child: Text("Press to login"),
            ),
            ElevatedButton(
              onPressed: () {
                featureGetIt
                    .get<FeaturesRouter>()
                    .navigateTo(FeaturesRoutes.OTHER);
              },
              child: Text("Navigate to other"),
            ),
          ],
        ),
      ),
    );
  }
}
