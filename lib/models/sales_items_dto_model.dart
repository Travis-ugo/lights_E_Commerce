// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

import 'package:lights_on_heights_e_commerce_assessment/models/ads_model.dart';
import 'package:lights_on_heights_e_commerce_assessment/models/sales_item_model.dart';

class SalesItemDTO extends Equatable {
  final List<Item> items;

  const SalesItemDTO({required this.items});

  @override
  List<Object?> get props => [items];
}

class ItemDTO extends Equatable {
  final Item item;
  final String itemQuantity;
  final String itemSize;

  const ItemDTO({
    required this.item,
    required this.itemQuantity,
    required this.itemSize,
  });

  @override
  List<Object?> get props => [
        item,
        itemQuantity,
        itemSize,
      ];
}

class AdsDTO extends Equatable {
  final List<Ad> ads;
  const AdsDTO({
    required this.ads,
  });

  @override
  List<Object?> get props => [ads];
}
