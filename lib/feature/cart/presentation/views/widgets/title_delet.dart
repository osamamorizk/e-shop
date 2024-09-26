import 'package:flutter/material.dart';
import 'package:shop_app/core/helpers/consts.dart';

class TitleAndDelet extends StatelessWidget {
  const TitleAndDelet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            width: 140,
            child: Text(
              "John Hardy Women's Legends Naga Gold & Silver Dragon Station Chain Bracelet",
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
          CircleAvatar(
            backgroundColor: kPrimaryColor.withOpacity(.07),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                )),
          ),
        ],
      ),
    );
  }
}
