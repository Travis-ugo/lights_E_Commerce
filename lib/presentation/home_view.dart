// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lights_on_heights_e_commerce_assessment/bloc/commerce/commerce_bloc.dart';
import 'package:lights_on_heights_e_commerce_assessment/presentation/item_details_view.dart';
import 'package:lights_on_heights_e_commerce_assessment/presentation/widgets/ads_card_widget.dart';
import 'package:lights_on_heights_e_commerce_assessment/presentation/widgets/category_title_widget.dart';
import 'package:lights_on_heights_e_commerce_assessment/presentation/widgets/item_widget.dart';
import 'package:lights_on_heights_e_commerce_assessment/presentation/widgets/sales_cart_widget.dart';
import 'package:lights_on_heights_e_commerce_assessment/presentation/widgets/title_and_subtitle_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommerceBloc, CommerceState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            const SliverAppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TitleAndSubTitleWidget(
                    title: 'Hi Andrew',
                    subTitle: 'Discover your style',
                    subTitleFontWeight: FontWeight.w600,
                    subTitleFontSize: 18,
                  ),
                  SalesCartWidget(),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                height: 210,
                child: ListView.builder(
                  padding: const EdgeInsets.only(left: 20),
                  scrollDirection: Axis.horizontal,
                  itemCount: state.ads.ads.length,
                  itemBuilder: (context, index) {
                    return AdsCardWidget(
                      title: 'New Drop',
                      subTitle: state.ads.ads[index].adsTitle,
                      imagePath: state.ads.ads[index].adsImagePath,
                    );
                  },
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CategoryTitleWidget(
                  categoryTitle: 'New Drop',
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 240,
                child: ListView.builder(
                  padding: const EdgeInsets.only(left: 20),
                  scrollDirection: Axis.horizontal,
                  itemCount: state.salesItemDTO.items.length,
                  itemBuilder: (context, index) {
                    return ItemWidget(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ItemDetailsView(
                              item: state.salesItemDTO.items[index],
                            ),
                          ),
                        );
                      },
                      items: state.salesItemDTO.items[index],
                    );
                  },
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CategoryTitleWidget(
                  categoryTitle: 'Introduce Shoe Number one',
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                height: 210,
                child: ListView.builder(
                  padding: const EdgeInsets.only(left: 20),
                  scrollDirection: Axis.horizontal,
                  itemCount: state.ads.ads.length,
                  itemBuilder: (context, index) {
                    return AdsCardWidget(
                      title: 'New Drop',
                      subTitle: state.ads.ads[index].adsTitle,
                      imagePath: state.ads.ads[index].adsImagePath,
                    );
                  },
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CategoryTitleWidget(
                  categoryTitle: 'New Drop',
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 240,
                child: ListView.builder(
                  padding: const EdgeInsets.only(left: 20),
                  scrollDirection: Axis.horizontal,
                  itemCount: state.salesItemDTO.items.length,
                  itemBuilder: (context, index) {
                    return BlocBuilder<CommerceBloc, CommerceState>(
                      builder: (context, state) {
                        return ItemWidget(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ItemDetailsView(
                                  item: state.salesItemDTO.items[index],
                                ),
                              ),
                            );
                          },
                          items: state.salesItemDTO.items[index],
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
