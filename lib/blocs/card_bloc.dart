import 'dart:async';

import 'package:bloc/data/cart_services.dart';
import 'package:bloc/models/cart.dart';

class CartBloc {
final cartStreamController = StreamController.broadcast ( ) ;
Stream get getStream => cartStreamController.stream ;
void addToCart ( Cart item ) {
CartServices.addCart ( item ) ;
cartStreamController.sink.add ( CartServices.getCart ( ) ) ;
}
void removeFromCart ( Cart item ) {
CartServices.removeFromCart ( item ) ;
cartStreamController.sink.add ( CartServices.getCart ( ) ) ;
}
List < Cart > getCart ( ) {
return CartServices.getCart ( ) ;

}
}
final cartBloc = CartBloc ( ) ;