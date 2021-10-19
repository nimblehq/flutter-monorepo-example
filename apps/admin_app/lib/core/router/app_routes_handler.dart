import 'package:admin_app/ui/home/home_screen.dart';
import 'package:fluro/fluro.dart';

final Handler rootHandler = Handler(
  handlerFunc: (context, params) {
    return HomeScreen();
  },
);
