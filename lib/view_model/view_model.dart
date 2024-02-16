import 'package:flutter/services.dart';
import 'package:lights_on_heights_e_commerce_assessment/models/ads_model.dart';
import 'package:lights_on_heights_e_commerce_assessment/models/sales_item_model.dart';

abstract class ECommerceViewModel {
  // fetch available items
  Future<SalesItem> readItemsFromJsonFile();

  Future<Ads> readAdsFromJsonFile();

  // add items to cart

  // remove items from cart

  // purchase item from cart

  // add item to fav list

  // remove item from favf

  // edit item in cart
}

class ECommerceViewModelImp implements ECommerceViewModel {
  @override
  Future<SalesItem> readItemsFromJsonFile() async {
    final String response = await rootBundle.loadString('assets/items.json');

    return salesItemFromJson(response);
  }

  @override
  Future<Ads> readAdsFromJsonFile() async {
    final String response = await rootBundle.loadString('assets/ads.json');

    return adsFromJson(response);
  }
}
