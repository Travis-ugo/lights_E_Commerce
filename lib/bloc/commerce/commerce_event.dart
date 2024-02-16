// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'commerce_bloc.dart';

class CommerceEvent extends Equatable {
  const CommerceEvent();

  @override
  List<Object> get props => [];
}

class FetchItemsEvent extends CommerceEvent {}

class FetchAdsDataEvent extends CommerceEvent {}

class AddItemToCartEvent extends CommerceEvent {
  const AddItemToCartEvent({required this.item});
  final Item item;

  @override
  List<Object> get props => [item];
}

class RemoveItemFromCartEvent extends CommerceEvent {
  const RemoveItemFromCartEvent(this.item);
  final Item item;

  @override
  List<Object> get props => [item];
}

class EditItemToCartEvent extends CommerceEvent {
  final ItemDTO item;

  const EditItemToCartEvent({required this.item});
}

class FilterAndSearchEvent extends CommerceEvent {
  final String title;

  const FilterAndSearchEvent({required this.title});
}

class AddToFavEvent extends CommerceEvent {
  final Item item;
  const AddToFavEvent({required this.item});
}

class RemoveFromFavEvent extends CommerceEvent {
  final Item item;
  const RemoveFromFavEvent({
    required this.item,
  });
}
