import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wallpaper_app/common/widget/photo_card.dart';

import '../../features/home/repository/home_repository.dart';
import '../utils/sizes.dart';

class PopularPhotos extends StatelessWidget {
  const PopularPhotos({
    super.key,
    required this.repository,
  });

  final HomeRepository repository;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingVertical,
      child: FutureBuilder(
        future: repository.fetchPhotos(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? SizedBox(
                  height: 200,
                  child: CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: false,
                      aspectRatio: 2.0,
                      enlargeCenterPage: true,
                    ),
                    items: repository.item!.photos
                        .map((item) => PhotoCard(
                              photo: item,
                            ))
                        .toList(),
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
