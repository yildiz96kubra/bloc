import 'package:bloc/blocs/card_bloc.dart';
import 'package:bloc/blocs/lesson_bloc.dart';
import 'package:bloc/models/cart.dart';
import 'package:flutter/material.dart';

class LessonListScreens extends StatelessWidget {
  const LessonListScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          " Dersler ",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey,
        leading: Icon(Icons.library_books),
        actions: [
          IconButton(
              onPressed: () => Navigator.pushNamed(context, "/cart"),
              icon: Icon(Icons.archive))
        ],
      ),
      body: buildLessonList(),
    );
  }

  buildLessonList() {
    return StreamBuilder(
      initialData: lessonBloc.getALL(),
      stream: lessonBloc.getStream,
      builder: (context, snapshot) {
        return snapshot.data.length > 0
            ? buildLessonListItems(snapshot)
            : Center(
                child: Text("Data yok"),
              );
      },
    );
  }

  buildLessonListItems(AsyncSnapshot snapshot) {
    return ListView.builder(
      itemCount: snapshot.data.length,
      itemBuilder: (BuildContext context, index) {
        final list = snapshot.data;
        return ListTile(
          title: Text(list[index].name),
          subtitle: Text("kredisi:" + list[index].point.toString()),
          trailing: IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              cartBloc.addToCart(Cart(list[index]));
              AlertDialog alertDialog = AlertDialog(
                title: Text("İşlem Başarılı"),
                content: Text("Ders eklendi: ${list[index].name}"),
              );
              showDialog(context: context, builder: (_) => alertDialog);
            },
          ),
        );
      },
    );
  }
}
