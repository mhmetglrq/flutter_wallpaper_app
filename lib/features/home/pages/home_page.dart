// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_wallpaper_app/common/utils/sizes.dart';
import 'package:flutter_wallpaper_app/features/home/repository/home_repository.dart';

import '../../../common/widget/custom_appbar.dart';
import '../../../common/widget/custom_title.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const String routeName = '/home-page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var repository = HomeRepository();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    repository.fetchPhotos();
  }

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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
