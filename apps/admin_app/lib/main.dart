import 'package:admin_app/core/router/app_router.dart';
import 'package:admin_app/di/di.dart';
import 'package:admin_app/ui/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:admin_app/gen/assets.gen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  await configureInjection();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  // TODO: implement Routes then remove `home: MyHomePage()` and use initialRoute instead.
  final String initialRoute;

  MyApp({this.initialRoute = '/'});

  @override
  Widget build(BuildContext context) {
    final appRouter = getIt.get<AppRouter>();
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        fontFamily: Assets.fonts.neuzeit,
      ),
      home: HomeScreen(),
      onGenerateRoute: appRouter.generateRoutes,
      navigatorKey: appRouter.navigatorKey,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder<PackageInfo>(
            future: PackageInfo.fromPlatform(),
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? Text(snapshot.data?.appName ?? "")
                  : SizedBox.shrink();
            }),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 24),
            FractionallySizedBox(
              widthFactor: 0.5,
              child: Image.asset(
                Assets.images.nimbleLogo.path,
                fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(height: 24),
            Text(AppLocalizations.of(context)!.hello),
            Text(
              FlutterConfig.get('SECRET'),
              style: TextStyle(color: Colors.black, fontSize: 24),
            )
          ],
        ),
      ),
    );
  }
}
