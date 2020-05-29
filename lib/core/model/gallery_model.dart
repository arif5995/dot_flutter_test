class GalleryModel {
  int statusCode;
  List<Gallery> data;

  GalleryModel({this.statusCode, this.data});

  GalleryModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    if (json['data'] != null) {
      data = new List<Gallery>();
      json['data'].forEach((v) {
        data.add(new Gallery.fromJson(v));
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

class Gallery {
  String caption;
  String thumbnail;
  String image;

  Gallery({this.caption, this.thumbnail, this.image});

  Gallery.fromJson(Map<String, dynamic> json) {
    caption = json['caption'];
    thumbnail = json['thumbnail'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['caption'] = this.caption;
    data['thumbnail'] = this.thumbnail;
    data['image'] = this.image;
    return data;
  }
}
