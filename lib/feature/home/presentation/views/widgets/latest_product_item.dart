import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LatestProductItem extends StatelessWidget {
  const LatestProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: Container(
        height: 120,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 110,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset('assets/images/test.jpg')),
            ),
            const SizedBox(
              width: 180,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    r'$ 1,290',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ),
            IconButton(
                onPressed: () {}, icon: const Icon(FontAwesomeIcons.heart))
          ],
        ),
      ),
    );
  }
}
