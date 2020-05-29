class PlaceModel {
  int statusCode;
  List<Place> data;

  PlaceModel({this.statusCode, this.data});

  PlaceModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    if (json['data'] != null) {
      data = new List<Place>();
      json['data'].forEach((v) {
        data.add(new Place.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Place {
  String name;
  String location;
  String description;
  String image;

  Place({this.name, this.location, this.description, this.image});

  Place.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    location = json['location'];
    description = json['description'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['location'] = this.location;
    data['description'] = this.description;
    data['image'] = this.image;
    return data;
  }
}
