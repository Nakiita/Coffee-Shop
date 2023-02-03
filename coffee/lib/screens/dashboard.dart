import 'package:coffee_shop/screens/option.dart';
import 'package:coffee_shop/services/notification_service.dart';
import 'package:coffee_shop/widgets/items_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabSelection);
    super.initState();
  }

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  PageController pageController = PageController();
  int selectedIndex = 0;
  _onPageChanged(int index) {
    // onTap
    setState(() {
      selectedIndex = index;
    });
  }

  _itemTapped(int selectedIndex) {
    pageController.jumpToPage(selectedIndex);
    setState(() {
      this.selectedIndex = selectedIndex;
    });
  }

  final form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => Option(),
                  ));
                },
                child: Icon(
                  Icons.filter_list,
                  color: Colors.black,
                ),
              ),
              label: "More",
            ),
          ],
          backgroundColor: Color.fromARGB(255, 235, 197, 197),
          elevation: 0,
        ),
        backgroundColor: Color.fromARGB(255, 235, 197, 197),
        body: SafeArea(
          child: ListView(children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed("/notification");
                    },
                    child: IconButton(
                        icon: Icon(
                          Icons.notifications_active,
                        ),
                        onPressed: () {
                          NotificationService.display(
                              "Welcome!!",
                              "Best Coffee Offer till the date",
                              "Order Yours",
                              context);
                          Positioned(
                            top: 12,
                            right: 12,
                            child: Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
            Container(),
            SingleChildScrollView(
              child: Form(
                key: form,
                child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(10),
                          child: const Text(
                            'Its Great Day for Coffee',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          )),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                        height: 60,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 228, 211, 211),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Find Your Coffee",
                            hintStyle: TextStyle(color: Colors.black),
                            prefixIcon: GestureDetector(
                              onTap: () {},
                              child: Icon(
                                Icons.search,
                                size: 30,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      TabBar(
                          controller: _tabController,
                          labelColor: Colors.black,
                          isScrollable: true,
                          indicator: UnderlineTabIndicator(
                            borderSide:
                                BorderSide(width: 7, color: Colors.black),
                          ),
                          tabs: [
                            Tab(
                              text: "Coffee",
                            ),
                          ]),
                      Center(
                        child: [
                          ItemsWidget(),
                        ][_tabController.index],
                      ),
                    ]),
              ),
            ),
          ]),
        ));
  }
}
