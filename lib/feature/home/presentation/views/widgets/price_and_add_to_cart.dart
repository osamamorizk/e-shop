import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/widgets/custom_button.dart';
import 'package:shop_app/feature/cart/presentation/manger/cubit/cart_cubit.dart';
import 'package:shop_app/feature/home/data/models/product_model.dart';

class PriceANdAddCart extends StatelessWidget {
  const PriceANdAddCart({super.key, required this.productModel, this.onTap});
  final ProductModel productModel;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Price',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const Spacer(),
              Text(
                r'$' '${productModel.price}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 175,
            height: 58,
            child: BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                return ConditionalBuilder(
                    fallback: (context) =>
                        const Center(child: CircularProgressIndicator()),
                    condition: state is! CartAddLoading,
                    builder: (context) =>
                        CustomButton(onTap: onTap, text: 'Add to cart'));
              },
            ),
          )
        ],
      ),
    );
  }
}
