import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:lights_on_heights_e_commerce_assessment/models/sales_item_model.dart';
import 'package:lights_on_heights_e_commerce_assessment/models/sales_items_dto_model.dart';
import 'package:lights_on_heights_e_commerce_assessment/view_model/view_model.dart';

part 'commerce_event.dart';
part 'commerce_state.dart';

class CommerceBloc extends Bloc<CommerceEvent, CommerceState> {
  final ECommerceViewModelImp _eCommerceViewModelImp;

  CommerceBloc({
    required ECommerceViewModelImp eCommerceViewModelImp,
  })  : _eCommerceViewModelImp = eCommerceViewModelImp,
        super(const CommerceState()) {
    on<FetchItemsEvent>(_onFetchDataEvent);
    on<FetchAdsDataEvent>(_onFetchAdsDataEvent);
    on<AddItemToCartEvent>(_onAddItemToCartEvent);
    on<RemoveItemFromCartEvent>(_onRemoveItemToCartEvent);
    on<EditItemToCartEvent>(_onEditItemToCartEvent);
    on<FilterAndSearchEvent>(_onFilterAndSearchEvent);
    on<AddToFavEvent>(_onAddToFavEvent);
    on<RemoveFromFavEvent>(_onRemoveFromFavEvent);
  }
  List<ItemDTO> modifiableList = [];
  List<Item> filterAndSearchList = [];
  List<Item> favouriteItems = [];

  void _onFetchDataEvent(
      FetchItemsEvent event, Emitter<CommerceState> emit) async {
    var items = await _eCommerceViewModelImp.readItemsFromJsonFile();

    emit(state.copyWith(salesItemDTO: SalesItemDTO(items: items.items)));
  }

  void _onFilterAndSearchEvent(
      FilterAndSearchEvent event, Emitter<CommerceState> emit) {
    if (event.title.isEmpty) {
      emit(state.copyWith(filterAndSearchItemList: state.salesItemDTO.items));
    } else {
      filterAndSearchList.map((e) {
        if (e.itemName == event.title) {}
      });
      emit(state.copyWith(filterAndSearchItemList: filterAndSearchList));
    }
  }

  // add item to fav list
  void _onAddToFavEvent(AddToFavEvent event, Emitter<CommerceState> emit) {
    favouriteItems.add(event.item);

    emit(state.copyWith(favouriteItems: favouriteItems));
  }

  // remove item from fav
  void _onRemoveFromFavEvent(
      RemoveFromFavEvent event, Emitter<CommerceState> emit) {
    favouriteItems.removeWhere((element) => element.id == event.item.id);

    emit(state.copyWith(favouriteItems: favouriteItems));
  }

  // add items to cart
  void _onAddItemToCartEvent(
      AddItemToCartEvent event, Emitter<CommerceState> emit) {
    var item = ItemDTO(item: event.item, itemQuantity: "1", itemSize: "M");
    // var total = modifiableList.map((e) {
      var price = int.parse(event.item.itemPrice);
    //   t += t;
    //   print("VALUE $t");
    // });
    
    print("print item $price");
    modifiableList.add(item);
    emit(state.copyWith(
      cartItems: modifiableList,
      // totalPrice: total.first,
    ));
  }

  // remove items from cart
  void _onRemoveItemToCartEvent(
      RemoveItemFromCartEvent event, Emitter<CommerceState> emit) {
    modifiableList.removeWhere((item) => item.item.id == event.item.id);
    emit(state.copyWith(
      cartItems: modifiableList,
    ));
  }

  // edit item in cart
  void _onEditItemToCartEvent(
      EditItemToCartEvent event, Emitter<CommerceState> emit) {
    //  var item = ItemDTO(item: event.item, itemQuantity: "1", itemSize: "M");
    modifiableList.firstWhere((item) {
      if (item.item.id == event.item.item.id) {
        item = event.item;
        return true;
      }
      return false;
    });
    emit(state.copyWith(
      cartItems: modifiableList,
    ));
  }

  // purchase item from cart

  void _onFetchAdsDataEvent(
    FetchAdsDataEvent event,
    Emitter<CommerceState> emit,
  ) async {
    var ads = await _eCommerceViewModelImp.readAdsFromJsonFile();

    emit(state.copyWith(
      ads: AdsDTO(ads: ads.ads),
    ));
  }
}
