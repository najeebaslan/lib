class Offers {
  late String sId;
  late String package;
  late String offers;
  late String packageData;
  late String detailsData;
  late String packageTime;
  late String detailsTime;
  late String packageValidity;
  late String detailsValidity;
  late String limiteUptime;
  late String detailsLimiteUptime;
  late NetworkId networkId;
  late String createdAt;
  late String updatedAt;
  late int iV;

  Offers(
      {required this.sId,
      required this.package,
      required this.offers,
      required this.packageData,
      required this.detailsData,
      required this.packageTime,
      required this.detailsTime,
      required this.packageValidity,
      required this.detailsValidity,
      required this.limiteUptime,
      required this.detailsLimiteUptime,
      required this.networkId,
      required this.createdAt,
      required this.updatedAt,
      required this.iV});

  Offers.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    package = json['package'];
    offers = json['offers'];
    packageData = json['Package_data'];
    detailsData = json['details_data'];
    packageTime = json['Package_time'];
    detailsTime = json['details_time'];
    packageValidity = json['Package_validity'];
    detailsValidity = json['details_validity'];
    limiteUptime = json['limiteUptime'];
    detailsLimiteUptime = json['details_limiteUptime'];
    networkId = (json['networkId'] != null
        ? new NetworkId.fromJson(json['networkId'])
        : null)!;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['package'] = this.package;
    data['offers'] = this.offers;
    data['Package_data'] = this.packageData;
    data['details_data'] = this.detailsData;
    data['Package_time'] = this.packageTime;
    data['details_time'] = this.detailsTime;
    data['Package_validity'] = this.packageValidity;
    data['details_validity'] = this.detailsValidity;
    data['limiteUptime'] = this.limiteUptime;
    data['details_limiteUptime'] = this.detailsLimiteUptime;
    if (this.networkId != null) {
      data['networkId'] = this.networkId.toJson();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class NetworkId {
  late String img;
  late String sId;
  late String nameA;
  NetworkId({required this.img, required this.sId,required this.nameA,});

  NetworkId.fromJson(Map<String, dynamic> json) {
    img = json['img'];
    sId = json['_id'];
     nameA = json['nameA'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['img'] = this.img;
    data['_id'] = this.sId;
        data['nameA'] = this.nameA;
    return data;
  }
}
