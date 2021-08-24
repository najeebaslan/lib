//THis is for regester user
class User {
  late final String username;
  late final String password;
  late final String userType;

  dynamic image;
  late bool isActive;
  late String? sId;
  late final String name;
  late final String sex;
  late final String phone;
  dynamic createdAt;
  dynamic updatedAt;
  User({
    required this.userType,
    this.image,
    required this.isActive,
    this.sId,
    required this.name,
    required this.sex,
    required this.phone,
    required this.username,
    required this.password,
    this.createdAt,
    this.updatedAt,
  });

  User.fromJson(Map<String, dynamic> json) {
    userType = json['userType'];
    image = json['image'];
    isActive = json['isActive'];
    sId = json['_id'];
    name = json['name'];
    sex = json['sex'];
    phone = json['phone'];
    username = json['username'];
    password = json['password'];

    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userType'] = this.userType;
    data['image'] = this.image;
    data['isActive'] = this.isActive;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['sex'] = this.sex;
    data['phone'] = this.phone;
    data['username'] = this.username;
    data['password'] = this.password;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;

    return data;
  }
}

class UserProfile {
  late String? sId;
  late String username;
  late String numberAcount;
  late final int balance;

  UserProfile({
    this.sId,
    required this.username,
    required this.numberAcount,
    required this.balance,
  });

  UserProfile.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    username = json['username'];
    numberAcount = json['numberAcount'];
    balance = json['balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['username'] = this.username;
    data['numberAcount'] = this.numberAcount;
    data['balance'] = this.balance;

    return data;
  }
}

class UserId {
  late String? userType;
  late String image;
  late bool? isActive;
  late String? sId;
  late String name;
  late String? sex;
  late String phone;
  late String? createdAt;
  late String? updatedAt;
  late int? iV;
  late String numberAcount;

  UserId(
      {this.userType,
      required this.image,
      this.isActive,
      this.sId,
      required this.name,
      this.sex,
      required this.phone,
      required this.numberAcount,
      this.createdAt,
      this.updatedAt,
      this.iV});

  UserId.fromJson(Map<String, dynamic> json) {
    userType = json['userType'];
    image = json['image'];
    isActive = json['isActive'];
    sId = json['_id'];
    name = json['name'];
    sex = json['sex'];
    phone = json['Phone'];
    numberAcount = json['numberAcount'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userType'] = this.userType;
    data['image'] = this.image;
    data['isActive'] = this.isActive;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['sex'] = this.sex;
    data['Phone'] = this.phone;
    data['numberAcount'] = this.numberAcount;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
