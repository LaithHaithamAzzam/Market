class CartProductsModel {
  String? nAME;
  String? iMAGE;
  String? pRICE;
  String? prodid;
  int? qUINTITY;

  CartProductsModel({this.nAME, this.iMAGE, this.pRICE, this.qUINTITY, this.prodid});

  CartProductsModel.fromJson(Map<dynamic, dynamic> json) {
    nAME = json['NAME'];
    iMAGE = json['IMAGE'];
    pRICE = json['PRICE'];
    qUINTITY = json['QUINTITY'];
    prodid = json['prodid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['NAME'] = this.nAME;
    data['IMAGE'] = this.iMAGE;
    data['PRICE'] = this.pRICE;
    data['QUINTITY'] = this.qUINTITY;
    data['prodid'] = this.prodid;
    return data;
  }
}
