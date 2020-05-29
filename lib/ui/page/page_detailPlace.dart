import 'package:dotfluttertest/core/model/places_model.dart';
import 'package:flutter/material.dart';

class Page_DetailList extends StatefulWidget {
  final Place place;

  Page_DetailList({this.place});

  @override
  _Page_DetailListState createState() => _Page_DetailListState();
}

class _Page_DetailListState extends State<Page_DetailList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Place Detail",
            style: TextStyle(fontFamily: 'Childern', color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            new ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0)),
              child: Image.network(
                widget.place.image,
                width: double.infinity,
                height: MediaQuery.of(context).size.width / 2,
                fit: BoxFit.cover,
              ),
            ),
            new SizedBox(height: 4,),
            new Card(
              margin: EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        new Icon(Icons.assignment, size: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: new Text(
                            widget.place.name, style: TextStyle(fontFamily: "Childern", fontSize: 20, fontWeight: FontWeight.bold ),
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          widget.place.location, style: TextStyle(fontFamily: "Childern", fontSize: 15, ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: new Text(widget.place.description, style: TextStyle(fontFamily: "Childern", fontSize: 18,),),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
