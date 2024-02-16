import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lights_on_heights_e_commerce_assessment/bloc/commerce/commerce_bloc.dart';
import 'package:lights_on_heights_e_commerce_assessment/presentation/widgets/filter_selectable_widget.dart';
import 'package:lights_on_heights_e_commerce_assessment/presentation/widgets/item_in_search_view_widget.dart';
import 'package:lights_on_heights_e_commerce_assessment/presentation/widgets/sales_cart_widget.dart';
import 'package:lights_on_heights_e_commerce_assessment/presentation/widgets/search_item_widget.dart';

class SearchItemView extends StatelessWidget {
  const SearchItemView({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> itemFilterList = ["Men", "Women", "Shoes", "Bags"];

    return BlocBuilder<CommerceBloc, CommerceState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            const SliverAppBar(
              pinned: true,
              title: Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: SearchItemWidget()),
                      SizedBox(width: 10),
                      SalesCartWidget(),
                    ],
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 15),
                height: 40,
                child: ListView.builder(
                  padding: const EdgeInsets.only(left: 20),
                  scrollDirection: Axis.horizontal,
                  itemCount: itemFilterList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: FilterSelectableWidget(
                        fontSize: 16,
                        filterTitle: itemFilterList[index],
                      ),
                    );
                  },
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: state.filterAndSearchItemList.length,
                (context, index) => Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: ItemInSearchViewWidget(
                    item: state.favouriteItems[index],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
