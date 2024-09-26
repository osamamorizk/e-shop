import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_app/core/helpers/consts.dart';

class ImageStack extends StatelessWidget {
  const ImageStack({
    super.key,
    required this.image,
  });

  final String image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 300,
          width: 350,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32), color: Colors.white),
        ),
        Positioned(
          bottom: 25,
          right: 50,
          child: Image(width: 250, height: 250, image: NetworkImage(image)),
        ),
        Positioned(
          top: 10,
          right: 15,
          child: CircleAvatar(
              backgroundColor: kPrimaryColor.withOpacity(.07),
              child: IconButton(
                  onPressed: () {}, icon: const Icon(FontAwesomeIcons.heart))),
        ),
      ],
    );
  }
}
