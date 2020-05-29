import 'package:dotfluttertest/core/model/gallery_model.dart';
import 'package:flutter/material.dart';

class Page_DetailGallery extends StatefulWidget {
  final Gallery gallery;

  Page_DetailGallery({this.gallery});
  @override
  _Page_DetailGalleryState createState() => _Page_DetailGalleryState();
}

class _Page_DetailGalleryState extends State<Page_DetailGallery> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("List Gallery",
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
                widget.gallery.image,
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
                child: new Text(widget.gallery.caption, style: TextStyle(fontFamily: "Childern", fontSize: 18,),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
