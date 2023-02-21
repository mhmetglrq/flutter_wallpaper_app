// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_wallpaper_app/common/utils/sizes.dart';

import '../../../common/widget/custom_appbar.dart';
import '../../../common/widget/custom_title.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const String routeName = '/home-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: preferredSize,
        child: CustomAppBar(
          title: 'Duvar Kağıdı App',
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: paddingAll,
          child: Column(
            children: const [
              CustomTitle(
                iconData: Icons.spa_outlined,
                title: "Keşfet",
              )
            ],
          ),
        ),
      ),
    );
  }
}
