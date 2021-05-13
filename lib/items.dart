import 'package:flutter/material.dart';
import 'package:ltx_deliver/assets/styles.dart';
import 'package:ltx_deliver/view/account/address_edit.dart';
import 'package:ltx_deliver/view/item.dart';

class GridItemState extends State<GridItem> {

  bool inCart = false;     //Товаров в корзине

  void _onAddItemPressed() {      //DEPRECATED!! Счетчик товаров в корзине, сделано через жопу
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ItemPage()),
    );
  }

  Widget _buildButtons() {                    //DEPRECATED!! Перестраивает кнопки в карточке, оставил на всякий
    if (!inCart) {

    } else {
      new Container(
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          child: new FlatButton(
            onPressed: () => _onAddItemPressed(),
            child: SizedBox(width: double.infinity, child: Text("*Ценовой диапазон*", style: sButton)),

            height: 48,
            color: Colors.grey[200],
          ),
        ),
        margin: EdgeInsets.all(4.0),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {             //TODO: Обработка нажатия на элемент
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ItemPage()),
        );
      },
      child: SizedBox.shrink(
        child: new Container(
          child: new Column(
            children: [
              new Container(
                  //padding: EdgeInsets.only(right: 15),
                  //margin: EdgeInsets.only(right: 15),
                  //child: AspectRatio(aspectRatio: 1, child: Image(image: AssetImage('res_fake/fakecontent.jpg'), width: double.infinity,)) //TODO: ПОФИКСИТЬ КАРТИНКУ!!!
              ),
              new Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                new Text("12-15 шт/уп"),
                new Text("  "),
                new Text("9 цаетов"),
              ],),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  new Text("Поплин"),
                  new Text("Полисатин 85 гр."),
                ],
              ),
              new Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  child: new FlatButton(
                    onPressed: () => _onAddItemPressed(),
                    child: SizedBox(
                        width: double.infinity,
                        child: Center(child: Text("*Сумма выбранных товаров*", style: sButton))      //TODO: Изменить цвет и надпись динамически от выбранных в корзине товаров
                    ),
                    height: 48,
                    color: Colors.grey[200],
                  ),
                ),
                margin: EdgeInsets.all(4.0),
              )
            ],
          ),
        ),
      ),
    );
  }

}       //Элемент сетки главного экрана

class ListItemState extends State<ListItem> {
  
  int inCart = 0;

  void _onItemInGridTapped() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ItemPage()),
    );
  }

  void _onAddItemPressed(int addedItems) {
    if (addedItems == 1) {
      setState(() {
        inCart++;
      });
    } else if (addedItems <= -1) {
      setState(() {
        inCart--;
      });
    } else if (addedItems > 1) {
      setState(() {
        _buildButtons();
        inCart += addedItems;
      });
    } else {
      setState(() {
        _buildButtons();
      });
    }
    
  }
  
  Widget _buildButtons() {
    if (inCart == 0) {
      return new Row(
        children: [
          new Container(
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              child: new FlatButton(
                onPressed: () => _onAddItemPressed(1),
                child: Text("В корзину", style: sButton),
                minWidth: 54,
                height: 48,
                color: Colors.grey[200],
              ),
            ),
            margin: EdgeInsets.all(4.0),
          ),
          new Container(
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              child: new FlatButton(
                onPressed: () => _onAddItemPressed(5),
                child: Text("5", style: sButton),
                minWidth: 54,
                height: 48,
                color: Colors.grey[200],
              ),
            ),
            margin: EdgeInsets.all(4.0),
          ),
          new Container(
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              child: new FlatButton(
                onPressed: () => _onAddItemPressed(15),
                child: Text("15", style: sButton),
                minWidth: 54,
                height: 48,
                color: Colors.grey[200],
              ),
            ),
            margin: EdgeInsets.all(4.0),
          ),
        ],
      );
    } else {
      return new Row(
        children: [
          new Container(
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              child: new FlatButton(
                onPressed: () => _onAddItemPressed(1),
                child: Text("+", style: sButton,),
                minWidth: 54,
                height: 48,
                color: Colors.grey[200],
              ),
            ),
            margin: EdgeInsets.only(left: 4.0),
          ),
          new Container(
            child: new Text(inCart.toString(), style: sButton,),
            padding: new EdgeInsets.symmetric(horizontal: 32.0),
            margin: EdgeInsets.only(left: 4.0),
          ),
          new Container(
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              child: new FlatButton(
                onPressed: () => _onAddItemPressed(-1),
                child: Text("-", style: sButton,),
                minWidth: 54,
                height: 48,
                color: Colors.grey[200],
              ),
            ),
            margin: EdgeInsets.only(left: 4.0),
          ),
        ],
      );
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ItemPage()),
        );
      },
      child: new Container(
        margin: EdgeInsets.all(8.0),
        child: new Row(
          children: [
            new Container(
                width: 81,
                height: 81,
                padding: EdgeInsets.only(right: 15),
                //margin: EdgeInsets.only(right: 15),
                child: Image(image: AssetImage('res_fake/fakecontent.jpg'))),
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 6.0,),
                  child: new Text("2499 ₽", style: sAlt,),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 6.0,),
                  child: new Text("Сатин «Эконом» Евро 2н", style: sHeading,),
                ),
                _buildButtons(),
              ],
            ),
          ],
        ),
      ),
    );
  }
  
}       //DEPRECATED!! Элемент списка главного экрана

class SizeListItemState extends State<SizeListItem> {

  int inCart = 0;

  void _onAddItemPressed(int addedItems) {              // Счетчик товаров в корзине, сделано через жопу
    if (addedItems == 1) {
      setState(() {
        inCart++;
      });
    } else if (addedItems <= -1) {
      setState(() {
        inCart--;
      });
    } else if (addedItems > 1) {
      setState(() {
        _buildButtons();
        inCart += addedItems;
      });
    } else {
      setState(() {
        _buildButtons();
      });
    }

  }

  Widget _buildButtons() {
    return new Row(
      children: [
        new Container(
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            child: new FlatButton(
              onPressed: () => _onAddItemPressed(1),
              child: Text("+", style: sButton,),
              minWidth: 54,
              height: 48,
              color: Colors.grey[200],
            ),
          ),
          margin: EdgeInsets.only(left: 4.0),
        ),
        new Container(
          child: new Text(inCart.toString(), style: sButton,),
          padding: new EdgeInsets.symmetric(horizontal: 32.0),
          margin: EdgeInsets.only(left: 4.0),
        ),
        new Container(
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            child: new FlatButton(
              onPressed: () => _onAddItemPressed(-1),
              child: Text("-", style: sButton,),
              minWidth: 54,
              height: 48,
              color: Colors.grey[200],
            ),
          ),
          margin: EdgeInsets.only(left: 4.0),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.all(8.0),
      child: new Row(
        children: [
          new Text("Название размера"),
          _buildButtons(),
        ],
      ),
    );
  }

}       //Элемент списка размеров

class AddressItemState extends State<AddressItem> {

  String btnName = "Сделать основным";

  void _onDefaultPressed() {
    setState(() {
      btnName = "Основной";
    });
  }
  
  void _onEditPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddressChangePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [ BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 28.8,
            spreadRadius: 2.0,
          )]
      ),
      child: new Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        margin: EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: new Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Container(child: new AddressTextItem(), width: double.infinity,),
              ),
              new Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      child: new FlatButton(onPressed: _onEditPressed, child: new Text("Изменить", style: sButton,), color: Colors.grey[200], height: 48,),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    child: new FlatButton(onPressed: _onDefaultPressed, child: new Text(btnName, style: sButton,), color: Colors.grey[200], height: 48,),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}       //Элемент списка адресов

class GridItem extends StatefulWidget {
  @override
  createState() => new GridItemState();
}                   //Виджеты с
class ListItem extends StatefulWidget {
  @override
  createState() => new ListItemState();
}
class SizeListItem extends StatefulWidget {
  @override
  createState() => new SizeListItemState();
}
class AddressItem extends StatefulWidget {
  @override
  createState() => new AddressItemState();
}

class ListItemCompact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Row(
      children: [
        new Container(
            width: 61,
            height: 61,
            padding: EdgeInsets.only(right: 15),
            //margin: EdgeInsets.only(right: 15),
            child: Image.asset('res_fake/fakecontent.png', width: 61, height: 61,)),
        new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            new Text("2499 ₽ | Полутороспальный (1.5)", style: sAlt,),
            new Row(
              children: [
                new Text("Сатин Люкс+", style: sHeading,),
                new Text("2 шт.", style: sHeadingCompact),
              ],
            )
          ],
        ),
      ],
    );
  }
}           //DEPRECATED!! Элемент списка корзины
class AddressTextItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 4.0),
          child: new Text("Офис (Основной адрес)", style: sHeading,),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: new Text("Кантемировская ул., 47А, корп. 2, стр. 6,\nМосква, Россия\nПолучатель: Первышин Михаил Анатольевич \n+7 (904) 371-48-57"),
        ),
      ],
    );
  }
}           //Элемент текстового описания адреса


