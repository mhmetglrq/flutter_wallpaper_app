// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:animations/animations.dart';

import 'package:flutter/material.dart';

import 'package:flutter_wallpaper_app/models/photo_model.dart';

class PhotoCard extends StatelessWidget {
  const PhotoCard({
    Key? key,
    required this.photo,
  }) : super(key: key);

  final Photo photo;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedColor: Colors.transparent,
      openColor: Colors.transparent,
      closedElevation: 0,
      openElevation: 0,
      closedBuilder: (context, action) => buildMovieCard(context),
      openBuilder: (context, action) {
        return Container();
      },
      // openBuilder: (context, action) => DetailsScreen(
      //   movie: movie,
      // ),
    );
  }

  Column buildMovieCard(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 4,
                  color: Colors.black26,
                ),
              ],
              borderRadius: BorderRadius.circular(50),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(photo.src.landscape),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
