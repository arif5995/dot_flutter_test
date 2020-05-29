import 'dart:convert';
import 'package:dotfluttertest/core/model/gallery_model.dart';
import 'package:http/http.dart' as http;

abstract class GalleryRepository{
  Future<List<Gallery>> getGallery();
}

class GalleryRepositoryImpl extends GalleryRepository{
  @override
  Future<List<Gallery>> getGallery() async{
    var response = await http.get("https://dot-test-70d73.firebaseapp.com/list_gallery.json");
    if(response.statusCode == 200){
      var data = json.decode(response.body);
      List<Gallery> place = GalleryModel.fromJson(data).data;
      print("data ada");
      return place;
    } else {
      throw Exception();
    }
  }

}