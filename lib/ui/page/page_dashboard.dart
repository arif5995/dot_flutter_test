import 'package:dotfluttertest/bloc/gallery/gallery_bloc.dart';
import 'package:dotfluttertest/bloc/place/places_bloc.dart';
import 'package:dotfluttertest/core/repository/Dot_Repository.dart';
import 'package:dotfluttertest/core/repository/Gallery_Repository.dart';
import 'package:dotfluttertest/ui/page/page_about.dart';
import 'package:dotfluttertest/ui/page/page_gallery.dart';
import 'package:dotfluttertest/ui/page/page_place.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  //select index
  int selectIndex = 0;

  List<Widget> pageList = [
    BlocProvider(
      create: (context) => PlaceBloc(repository: PlaceRepositoryImpl()),
      child: PlacePage(),
    ),
    BlocProvider(
        create: (context) => GalleryBloc(galleryRepository: GalleryRepositoryImpl()),
        child: GalleryPage()),
    AboutPage()
  ];

  //Navbar Item
  final _bottomNavbarItem = <BottomNavigationBarItem>[
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("List Place")),
    BottomNavigationBarItem(
        icon: Icon(Icons.call_to_action), title: Text("List Gallery")),
    BottomNavigationBarItem(icon: Icon(Icons.info), title: Text("About")),
  ];

  void _onNavBarTapped(int index) {
    setState(() {
      selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[selectIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomNavbarItem,
        currentIndex: selectIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        onTap: _onNavBarTapped,
      ),
    );
  }
}
