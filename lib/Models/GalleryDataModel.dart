class GalleryDataModel {
  String? message;
  List<Gallery>? gallery;

  GalleryDataModel({this.message, this.gallery});

  GalleryDataModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['gallery'] != null) {
      gallery = <Gallery>[];
      json['gallery'].forEach((v) {
        gallery!.add(new Gallery.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.gallery != null) {
      data['gallery'] = this.gallery!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Gallery {
  int? id;
  int? userID;
  List<String>? images;
  String? description;
  String? createdAt;
  String? updatedAt;

  Gallery(
      {this.id,
        this.userID,
        this.images,
        this.description,
        this.createdAt,
        this.updatedAt});

  Gallery.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userID = json['userID'];
    images = json['images'].cast<String>();
    description = json['description'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userID'] = this.userID;
    data['images'] = this.images;
    data['description'] = this.description;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
