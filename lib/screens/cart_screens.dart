import 'package:bloc/blocs/card_bloc.dart';
import 'package:flutter/material.dart';

class CartScreens extends StatelessWidget {
  const CartScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Seçilen Dersler",
        ),
        backgroundColor: Colors.red[900],
      ),
      body: StreamBuilder(
        stream: cartBloc.getStream,
        initialData: cartBloc.getCart(),
        builder: (context, snapshot) {
          return buildCart(snapshot);
        },
      ),
    );
  }

  Widget buildCart(AsyncSnapshot snapshot) {
    return ListView.builder(
      itemCount: snapshot.data.length,
      itemBuilder: (BuildContext context, index) {
        final cart = snapshot.data;
        return ListTile(
          title: Text(cart[index].lesson.name),
          subtitle: Text("kredisi:" + cart[index].lesson.point.toString()),
          trailing: IconButton(
            icon: Icon(Icons.remove),
            onPressed: () {
              cartBloc.removeFromCart(cart[index]);
              AlertDialog alertDialog = new AlertDialog(
                title: Text("İşlem Başarılı"),
                content: Text("ders Silindi"),
              );
              showDialog(
                context: context,
                builder: (_) => alertDialog,
              );
            },
          ),
        );
      },
    );
  }
}
