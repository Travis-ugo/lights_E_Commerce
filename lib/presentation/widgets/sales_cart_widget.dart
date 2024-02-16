// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lights_on_heights_e_commerce_assessment/bloc/commerce/commerce_bloc.dart';
import 'package:lights_on_heights_e_commerce_assessment/presentation/my_cart_view.dart';

class SalesCartWidget extends StatelessWidget {
  const SalesCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const MyCartView()));
      },
      child: Badge(
        label: BlocBuilder<CommerceBloc, CommerceState>(
          builder: (context, state) {
            return Text("${state.cartItems.length}");
          },
        ),
        backgroundColor: Colors.grey[900],
        child: const Icon(
          Icons.shopping_cart_outlined,
        ),
      ),
    );
  }
}
