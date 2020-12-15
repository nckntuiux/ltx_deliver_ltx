import 'package:flutter/material.dart';
import 'package:ltx_deliver/view/search.dart';
import 'package:ltx_deliver/items.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:superellipse_shape/superellipse_shape.dart';

import '../assets/styles.dart';
import '../assets/strings.dart';

import 'launch/login.dart';
import 'cart.dart';
import 'account/account.dart';

int _selectedBottomIndex = 0;

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{

  RefreshController _refreshController = RefreshController(initialRefresh: false);
  TabController _tabController;
  int _currentIndex = 0;
  final List<Widget> _children = [];

  void _onBottomItemTapped(int index) {
    setState(() {
      _selectedBottomIndex = index;
      if (_selectedBottomIndex == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CartPage()),
        );
      } else if (_selectedBottomIndex == 2) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AccountPage()),
        );
      }
    });
  }

  void _onActionLoginItemPressed() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }

  void _onSearchItemPressed() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SearchPage()),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 5, vsync: this, initialIndex: 0);
    _onBottomItemTapped(0);
  }

  void _onRefresh() async{
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async{
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()

    if(mounted)
      setState(() {

      });
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            centerTitle: true,
            leading: IconButton(icon: Icon(Icons.search), onPressed: _onSearchItemPressed,),
            title: Text('Lunatex', style: sAppBarText,),
            bottom: TabBar(
                isScrollable: true,
                unselectedLabelColor: Colors.black.withOpacity(0.3),
                indicatorColor: Colors.black,
                indicatorPadding: EdgeInsets.only(bottom: 4.0, left: 8.0, right: 8.0),
                tabs: [
                  Tab(
                    child: Text('Недавние'),
                  ),
                  Tab(
                    child: Text('Комплекты белья'),
                  ),
                  Tab(
                    child: Text('Подушки'),
                  ),
                  Tab(
                    child: Text('Одеяла'),
                  ),
                  Tab(
                    child: Text('Рынок'),
                  ),
                ]),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: new IconButton(icon: Icon(Icons.person_outline), onPressed: _onActionLoginItemPressed),
              ),
            ],
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [ BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 28.8,
                  spreadRadius: 2.0,
                )]
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0)),
              child: SizedBox(
                height: 64,
                child: BottomNavigationBar(
                  iconSize: 32.0,
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Главная',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.shopping_cart),
                      label: 'Корзина',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: 'Профиль',
                    ),
                  ],
                  currentIndex: _selectedBottomIndex,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  backgroundColor: Colors.white,
                  selectedItemColor: brandRGB0[900],
                  unselectedItemColor: Colors.black,
                  onTap: _onBottomItemTapped,
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: SmartRefresher(
                    controller: _refreshController,
                    enablePullUp: true,
                    header: ClassicHeader(),
                    onRefresh: _onRefresh,
                    onLoading: _onLoading,
                    child: ListView(children: [
                      new ListItem(),
                      new Divider(color: Colors.white,),
                      new ListItem()
                    ]),
                  ),
                ),
              ),
              Container(
                child: Center(
                  child: SmartRefresher(
                    controller: _refreshController,
                    enablePullUp: true,
                    header: ClassicHeader(),
                    onRefresh: _onRefresh,
                    onLoading: _onLoading,
                    child: ListView(children: [
                      new ListItem(),
                      new Divider(color: Colors.white,),
                      new ListItem()
                    ]),
                  ),
                ),
              ),
              Container(
                child: Center(
                  child: SmartRefresher(
                    controller: _refreshController,
                    enablePullUp: true,
                    header: ClassicHeader(),
                    onRefresh: _onRefresh,
                    onLoading: _onLoading,
                    child: ListView(children: [
                      new ListItem(),
                      new Divider(color: Colors.white,),
                      new ListItem()
                    ]),
                  ),
                ),
              ),
              Container(
                child: Center(
                  child: SmartRefresher(
                    controller: _refreshController,
                    enablePullUp: true,
                    header: ClassicHeader(),
                    onRefresh: _onRefresh,
                    onLoading: _onLoading,
                    child: ListView(children: [
                      new ListItem(),
                      new Divider(color: Colors.white,),
                      new ListItem()
                    ]),
                  ),
                ),
              ),
              Container(
                child: Center(
                  child: SmartRefresher(
                    controller: _refreshController,
                    enablePullUp: true,
                    header: ClassicHeader(),
                    onRefresh: _onRefresh,
                    onLoading: _onLoading,
                    child: ListView(children: [
                      new ListItem(),
                      new Divider(color: Colors.white,),
                      new ListItem()
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}