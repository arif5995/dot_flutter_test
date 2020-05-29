import 'dart:convert';
import 'package:dotfluttertest/core/model/places_model.dart';
import 'package:http/http.dart' as http;

abstract class PlaceRepository{
  Future<List<Place>> getPlace();
}

class PlaceRepositoryImpl extends PlaceRepository{
  @override
  Future<List<Place>> getPlace() async {
    var response = await http.get("https://dot-test-70d73.firebaseapp.com/list_place.json");
    if(response.statusCode == 200){
      var data = json.decode(response.body);
      List<Place> place = PlaceModel.fromJson(data).data;
      print("data ada");
      return place;
    } else {
      throw Exception();
    }
  }

}