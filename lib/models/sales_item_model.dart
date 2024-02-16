import 'dart:convert';

SalesItem salesItemFromJson(String str) => SalesItem.fromJson(json.decode(str));

String salesItemToJson(SalesItem data) => json.encode(data.toJson());

class SalesItem {
  final List<Item> items;

  const SalesItem({
    required this.items,
  });

  factory SalesItem.fromJson(Map<String, dynamic> json) => SalesItem(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  final String id;
  final String itemName;
  final String itemPrice;
  final String itemCategory;
  final List<String> itemImages;

  const Item({
    required this.id,
    required this.itemName,
    required this.itemPrice,
    required this.itemCategory,
    required this.itemImages,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        itemName: json["item_name"],
        itemPrice: json["item_price"],
        itemCategory: json["item_category"],
        itemImages: List<String>.from(json["item_images"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "item_name": itemName,
        "item_price": itemPrice,
        "item_category": itemCategory,
        "item_images": List<dynamic>.from(itemImages.map((x) => x)),
      };
}
