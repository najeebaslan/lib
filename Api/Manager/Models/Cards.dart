class Cards {
 late String sId;
 late String username;
 late String password;
 late String erialNo;
 late bool isActive;
 late String timestamp;
 late String packageId;

  Cards(
      {
    required  this.sId,
    required  this.username,
    required  this.password,
    required  this.erialNo,
    required  this.isActive,
    required  this.timestamp,
    required  this.packageId});

  Cards.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    username = json['username'];
    password = json['password'];
    erialNo = json['erialNo'];
    isActive = json['isActive'];
    timestamp = json['timestamp'];
    packageId = json['PackageId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['username'] = this.username;
    data['password'] = this.password;
    data['erialNo'] = this.erialNo;
    data['isActive'] = this.isActive;
    data['timestamp'] = this.timestamp;
    data['PackageId'] = this.packageId;
    return data;
  }
}