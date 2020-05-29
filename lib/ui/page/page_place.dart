import 'package:dotfluttertest/bloc/place/place_state.dart';
import 'package:dotfluttertest/bloc/place/places_bloc.dart';
import 'package:dotfluttertest/bloc/place/places_event.dart';
import 'package:dotfluttertest/core/model/places_model.dart';
import 'package:dotfluttertest/ui/page/page_detailPlace.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlacePage extends StatefulWidget {
  @override
  _PlacePageState createState() => _PlacePageState();
}

class _PlacePageState extends State<PlacePage> {
  PlaceBloc placeBloc;

  @override
  void initState() {
    super.initState();
    placeBloc = BlocProvider.of<PlaceBloc>(context);
    placeBloc.add(FetchPlaceEvent());
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
                backgroundColor: Colors.green,
                title: Text(
                  "List Place",
                  style: TextStyle(fontFamily: 'Childern', fontSize: 20),
                ),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.refresh),
                    onPressed: () {
                      placeBloc.add(FetchPlaceEvent());
                    },
                  ),
                ],
              ),
              body: Container(
                  child: BlocListener<PlaceBloc, PlaceState>(
                listener: (BuildContext context, PlaceState state) {
                  if (state is PlaceErrorState) {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text(state.message),
                    ));
                  }
                },
                child: BlocBuilder<PlaceBloc, PlaceState>(
                  builder: (context, state) {
                    if (state is PlaceInitialState) {
                      return buildLoading();
                    } else if (state is PlaceLoadingState) {
                      return buildLoading();
                    } else if (state is PlaceLoadedState) {
                      return buildPlaceList(state.place);
                    } else if (state is PlaceErrorState) {
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

Widget buildPlaceList(List<Place> data) {
  return ListView.builder(
    itemCount: data.length,
    itemBuilder: (context, item) {
      return Padding(
        padding: EdgeInsets.all(8.0),
        child: InkWell(
          child: Stack(
            children: <Widget>[
              new ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0)),
                child: Image.network(
                  data[item].image,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.width / 2,
                  fit: BoxFit.cover,
                ),
              ),
              new Positioned(
                  bottom: 10,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black.withOpacity(0.5),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          data[item].name,
                          style: TextStyle(fontFamily: 'Childern' ,fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        Text(
                          data[item].location,
                          style: TextStyle(fontFamily: 'Childern', fontSize: 15, color: Colors.grey),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        )
                      ],
                    ),
                  ))
            ],
          ),
          onTap: () => Navigator.push(context, MaterialPageRoute(
            builder: (context) => Page_DetailList(place: data[item],)
        )),
        ),
      );
    },
  );
}
