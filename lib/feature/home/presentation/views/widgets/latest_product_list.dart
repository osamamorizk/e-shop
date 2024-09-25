import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_app/core/helpers/consts.dart';
import 'package:shop_app/feature/home/presentation/manger/all_products/all_product_cubit.dart';
import 'package:shop_app/feature/home/presentation/views/widgets/latest_product_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LatestProductList extends StatelessWidget {
  const LatestProductList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllProductCubit, AllProductState>(
      builder: (context, state) {
        if (state is SucessAllProducts) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: state.allProducts.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(left: 0),
              child: GestureDetector(
                onTap: () {},
                child: LatestProductItem(
                  productModel: state.allProducts[index],
                ),
              ),
            ),
          );
        } else if (state is FailureAllProducts) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else {
          return const SizedBox(child: SkeletonizerLatestProduct());
        }
      },
    );
  }
}

class SkeletonizerLatestProduct extends StatelessWidget {
  const SkeletonizerLatestProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: 5,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      height: 110,
                      width: 100,
                    ),
                    const SizedBox(
                      width: 180,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'the title of product willl appear here',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            r'$' 'the price of product willl appear here',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: kPrimaryColor.withOpacity(.07),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(FontAwesomeIcons.heart)),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
