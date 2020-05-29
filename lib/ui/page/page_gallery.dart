import 'package:dotfluttertest/bloc/gallery/gallery_bloc.dart';
import 'package:dotfluttertest/bloc/gallery/gallery_event.dart';
import 'package:dotfluttertest/bloc/gallery/gallery_state.dart';
import 'package:dotfluttertest/core/model/gallery_model.dart';
import 'package:dotfluttertest/ui/page/page_detailGallery.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GalleryPage extends StatefulWidget {
  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  GalleryBloc galleryBloc;

  @override
  void initState() {
    super.initState();
    galleryBloc = BlocProvider.of<GalleryBloc>(context);
    galleryBloc.add(FetchGalleryEvent());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) {
          return Material(
            child: Scaffold(
              appBar: AppBar(
                title: Text(
                  "List Gallery",
                  style: TextStyle(fontFamily: 'Childern', fontSize: 20),
                ),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.refresh),
                    onPressed: () {
                      galleryBloc.add(FetchGalleryEvent());
                    },
                  ),
                ],
              ),
              body: Container(
                  child: BlocListener<GalleryBloc, GalleryState>(
                    listener: (BuildContext context, GalleryState state) {
                      if (state is GalleryErrorState) {
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text(state.message),
                        ));
                      }
                    },
                    child: BlocBuilder<GalleryBloc, GalleryState>(
                      builder: (context, state) {
                        if (state is GalleryInitialState) {
                          return buildLoading();
                        } else if (state is GalleryLoadingState) {
                          return buildLoading();
                        } else if (state is GalleryLoadedState) {
                          return buildPlaceList(state.gallery, context);
                        } else if (state is GalleryErrorState) {
                          return buildErrorUi(state.message);
                        } else {
                          return null;
                        }
                      },
                    ),
                  )),
            ),
          );
        },
      ),
    );
  }
}

Widget buildLoading() {
  return Center(
    child: CircularProgressIndicator(),
  );
}

Widget buildErrorUi(String message) {
  return Center(
    child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(message, style: TextStyle(color: Colors.red))),
  );
}

Widget buildPlaceList(List<Gallery> gallery, BuildContext context) {
  return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: MediaQuery.of(context)
              .orientation == Orientation.portrait ? 3 : 4),
      itemCount: gallery.length == null ? 0 : gallery.length,
      itemBuilder: (BuildContext context, int index){
      return InkWell(
        child: ClipRRect(
          child: Image.network(gallery[index].image, fit: BoxFit.cover,),
        ),
        onTap: () => Navigator.push(context, MaterialPageRoute(
            builder: (context) => Page_DetailGallery(gallery: gallery[index],)
        )),
      );
  });
}