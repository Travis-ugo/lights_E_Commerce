import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lights_on_heights_e_commerce_assessment/bloc/commerce/commerce_bloc.dart';
import 'package:lights_on_heights_e_commerce_assessment/presentation/widgets/item_in_search_view_widget.dart';
import 'package:lights_on_heights_e_commerce_assessment/presentation/widgets/sales_cart_widget.dart';
import 'package:lights_on_heights_e_commerce_assessment/presentation/widgets/title_and_subtitle_widget.dart';

class FavouritesView extends StatelessWidget {
  const FavouritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TitleAndSubTitleWidget(
                title: 'Hi Andrew',
                subTitle: "Here are your Fav's",
                subTitleFontWeight: FontWeight.w600,
                subTitleFontSize: 18,
              ),
              SalesCartWidget(),
            ],
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 20),
        ),
        BlocBuilder<CommerceBloc, CommerceState>(
          builder: (context, state) {
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount:  state.favouriteItems.length,
                (context, index) => Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: ItemInSearchViewWidget(
                    item: state.favouriteItems[index],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
