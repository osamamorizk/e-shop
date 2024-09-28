import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/feature/cart/presentation/manger/cubit/cart_cubit.dart';
import 'package:shop_app/feature/cart/presentation/views/widgets/order_info.dart';
import 'package:shop_app/feature/home/data/models/product_model.dart';
import 'package:shop_app/feature/home/presentation/views/widgets/add_to_cart_button.dart';
import 'package:shop_app/feature/home/presentation/views/widgets/product_count.dart';
import 'package:shop_app/feature/home/presentation/views/widgets/product_image_stack.dart';
import 'package:shop_app/feature/home/presentation/views/widgets/product_rate.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Center(child: ImageStack(image: productModel.image)),
            const SizedBox(height: 10),
            Text(
              productModel.title,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            ProductRate(
              productModel: productModel,
            ),
            Text(
              productModel.description,
              style: const TextStyle(
                color: Colors.blueGrey,
                fontSize: 18,
              ),
            ),
            const Divider(),
            OrderInfo(title: 'Price', info: r'$ ' '${productModel.price}'),
            const SizedBox(height: 15),
            BlocListener<CartCubit, CartState>(
              listener: (context, state) {
                if (state is CartAddSuccess) {
                  Fluttertoast.showToast(
                      msg: "Successfuly Add",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0);
                }
                if (state is CartAddFailure) {
                  Fluttertoast.showToast(
                      msg: state.errorMessage,
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                }
              },
              child: AddCartAndCount(productModel: productModel),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class AddCartAndCount extends StatelessWidget {
  const AddCartAndCount({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    var cartCubit = BlocProvider.of<CartCubit>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const SizedBox(
          height: 60,
          width: 170,
          child: ProductCount(),
        ),
        AddCartButton(
          onTap: () async {
            await cartCubit.addProductCart(
              title: productModel.title,
              description: productModel.description,
              rate: productModel.rate,
              image: productModel.image,
              price: productModel.price,
              id: productModel.id,
              category: productModel.category,
              count: BlocProvider.of<CartCubit>(context).cartCount,
            );
          }
          // () {
          //     Fluttertoast.showToast(
          //         msg: 'Already in cart',
          //         toastLength: Toast.LENGTH_SHORT,
          //         gravity: ToastGravity.BOTTOM,
          //         timeInSecForIosWeb: 1,
          //         backgroundColor: Colors.red,
          //         textColor: Colors.white,
          //         fontSize: 16.0);
          //   }
          ,
          productModel: productModel,
        ),
      ],
    );
  }
}
