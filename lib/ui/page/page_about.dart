import 'package:dotfluttertest/ui/page/page_informasi.dart';
import 'package:dotfluttertest/ui/page/page_versiliris.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> with SingleTickerProviderStateMixin{
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("About",
            style: TextStyle(fontFamily: 'Childern', fontSize: 20),),
          bottom: new TabBar(
              controller: controller,
              tabs: <Widget>[
                new Tab(icon: Icon(Icons.perm_contact_calendar), text: "Informasi",),
                new Tab(icon: Icon(Icons.info), text: "Versi Rilis",)
          ]),
        ),
        body: TabBarView(
            controller: controller,
            children: <Widget>[
            PageInformasi(), PageRilis(),
        ]),
      ),
    );
  }
}

