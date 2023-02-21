// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
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
            children: [
              const CustomTitle(
                iconData: Icons.spa_outlined,
                title: "Keşfet",
              ),
              CarouselSlider(
                options: CarouselOptions(enlargeCenterPage: true),
                items: [1, 2, 3, 4, 5].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: const BoxDecoration(color: Colors.amber),
                          child: Text(
                            'text $i',
                            style: const TextStyle(fontSize: 16.0),
                          ));
                    },
                  );
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
