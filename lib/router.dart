import 'package:flutter/material.dart';
import 'package:flutter_wallpaper_app/common/widget/error_page.dart';

import 'features/home/pages/home_page.dart';

Route<dynamic> generateRout(RouteSettings settings) {
  switch (settings.name) {
    case HomePage.routeName:
      return MaterialPageRoute(
        builder: ((context) => const HomePage()),
      );

    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: ErrorPage(error: "Bir hatayla karşılaşıldı!"),
        ),
      );
  }
}
