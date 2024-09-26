class Categories_Model {
  String? image;
  String? title;

  Categories_Model({this.image, this.title});

  Categories_Model.fromJson(Map<dynamic, dynamic> json) {
    image = json['image'];
    title = json['title'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['title'] = this.title;
    return data;
  }
}
