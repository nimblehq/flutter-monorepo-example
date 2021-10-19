import 'package:features/ui/other_screen.dart';
import 'package:features/ui/shared_info_screen.dart';
import 'package:fluro/fluro.dart';

final Handler sharedInfoHandler = Handler(
  handlerFunc: (context, params) {
    return const SharedInfoScreen();
  },
);

final Handler otherHandler = Handler(
  handlerFunc: (context, params) {
    return const OtherScreen();
  },
);
