class ProductsModel {
  String? color;
  String? suptitle;
  String? details;
  String? image;
  String? price;
  String? size;
  String? title;
  String? prodid;

  ProductsModel(
      {this.color,
        this.suptitle,
        this.details,
        this.image,
        this.price,
        this.size,
        this.prodid,
        this.title});

  ProductsModel.fromJson(Map<dynamic, dynamic> json) {
    color = json['color'];
    suptitle = json['suptitle'];
    details = json['details'];
    image = json['image'];
    price = json['price'];
    size = json['size'];
    title = json['title'];
    prodid = json['prodid'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['color'] = this.color;
    data['suptitle'] = this.suptitle;
    data['details'] = this.details;
    data['image'] = this.image;
    data['price'] = this.price;
    data['size'] = this.size;
    data['title'] = this.title;
    data['prodid'] = this.prodid;
    return data;
  }
}
