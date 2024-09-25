import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductCatItem extends StatelessWidget {
  const ProductCatItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 175,
          decoration: BoxDecoration(
            border: Border.all(width: .1),
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                SizedBox(
                  width: 150,
                  height: 150,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16)),
                    child:
                        Image.asset(fit: BoxFit.fill, 'assets/images/test.jpg'),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        r'$ 1,290',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          right: 10,
          top: 5,
          child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                  onPressed: () {}, icon: const Icon(FontAwesomeIcons.heart))),
        )
      ],
    );
  }
}
