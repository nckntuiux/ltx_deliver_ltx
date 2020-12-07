import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ltx_deliver/view/order/order_finish.dart';

import 'package:superellipse_shape/superellipse_shape.dart';

import '../../assets/styles.dart';
import '../../assets/strings.dart';

class NewOrderPage extends StatefulWidget {
  NewOrderPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _NewOrderPageState createState() => _NewOrderPageState();
}

class _NewOrderPageState extends State<NewOrderPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {Navigator.pop(context);}, icon: Icon(Icons.close)),
        title: Text('Создать заказ'),
        elevation: 0,
        brightness: Brightness.light,
      ),
      body: Container(
        child: SafeArea(
          child: Column(
            children: [
              new Expanded(
                child: ListView(
                  children: [
                    new Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        new Text("Склад 1"),
                        new Text("Кантемировская ул., 47А, корп. 2, стр. 6, \nМосква, Россия"),
                        new Text("Получатель: Первышин Михаил Анатольевич"),
                        new Text("+7 (904) 371-48-57"),
                        new Row(
                          children: [
                            new Container(
                                width: 61,
                                height: 61,
                                padding: EdgeInsets.only(right: 15),
                                //margin: EdgeInsets.only(right: 15),
                                child: Image(image: AssetImage('res_fake/fakecontent.jpeg'))),
                            new Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                new Text("2499 ₽ | Полутороспальный (1.5)",),
                                new Row(
                                  children: [
                                    new Text("Сатин Люкс+"),
                                    new Text("2 шт.",),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ],),
                  ],
                ),
              ),
              new MaterialButton(onPressed: _onButtonPressed, child: Text("Оформить заказ на ХХХ руб."), color: Colors.amber,)
            ],
          ),

        ),
        padding: EdgeInsets.all(16.0),
      ),
    );
  }

  void _onButtonPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FinishOrderPage()),
    );
  }
}
