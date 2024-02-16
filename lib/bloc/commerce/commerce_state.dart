// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'commerce_bloc.dart';

class CommerceState extends Equatable {
  const CommerceState({
    this.salesItemDTO = const SalesItemDTO(items: []),
    this.cartItems = const [],
    this.ads = const AdsDTO(ads: []),
    this.filterAndSearchItemList = const [],
    this.favouriteItems = const [],
    this.totalPrice = "0",
  });

  final SalesItemDTO salesItemDTO;
  final List<ItemDTO> cartItems;
  final AdsDTO ads;
  final List<Item> filterAndSearchItemList;
  final List<Item> favouriteItems;
  final String totalPrice;

  @override
  List<Object?> get props => [
        salesItemDTO,
        cartItems,
        ads,
        filterAndSearchItemList,
        favouriteItems,
        totalPrice
      ];

  CommerceState copyWith({
    SalesItemDTO? salesItemDTO,
    List<ItemDTO>? cartItems,
    AdsDTO? ads,
    List<Item>? filterAndSearchItemList,
    List<Item>? favouriteItems,
    String? totalPrice,
  }) {
    return CommerceState(
      salesItemDTO: salesItemDTO ?? this.salesItemDTO,
      cartItems: cartItems ?? this.cartItems,
      ads: ads ?? this.ads,
      totalPrice: totalPrice ?? this.totalPrice,
      favouriteItems: favouriteItems ?? this.favouriteItems,
      filterAndSearchItemList:
          filterAndSearchItemList ?? this.filterAndSearchItemList,
    );
  }
}
