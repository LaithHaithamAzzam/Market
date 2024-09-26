class UserModel {
  String? userid;
  String? email;
  String? name;
  String? picid;

  UserModel({this.userid, this.email, this.name, this.picid});

  UserModel.fromJson(Map<String, dynamic> json) {
    userid = json['userid'];
    email = json['email'];
    name = json['name'];
    picid = json['picid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userid'] = this.userid;
    data['email'] = this.email;
    data['name'] = this.name;
    data['picid'] = this.picid;
    return data;
  }
}
