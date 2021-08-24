class Package {
  late String packageData;
  late String detailsData;
  late String packageTime;
  late String detailsTime;
  late String packageValidity;
  late String detailsValidity;
  late bool havepassword;
  late bool isActive;
  late String sId;
  late String networkId;
  late String userInitiate;
  late PackagePriceId packagePriceId;
  late String createdAt;
  late String updatedAt;
  late int iV;

  Package(
      {required this.packageData,
      required this.detailsData,
      required this.packageTime,
      required this.detailsTime,
      required this.packageValidity,
      required this.detailsValidity,
      required this.havepassword,
      required this.isActive,
      required this.sId,
      required this.networkId,
      required this.userInitiate,
      required this.packagePriceId,
      required this.createdAt,
      required this.updatedAt,
      required this.iV});

  Package.fromJson(Map<String, dynamic> json) {
    packageData = json['Package_data'];
    detailsData = json['details_data'];
    packageTime = json['Package_time'];
    detailsTime = json['details_time'];
    packageValidity = json['Package_validity'];
    detailsValidity = json['details_validity'];
    havepassword = json['havepassword'];
    isActive = json['isActive'];
    sId = json['_id'];
    networkId = json['networkId'];
    userInitiate = json['User_initiate'];
    if (json['Package_PriceId'] != null) {
      packagePriceId = new PackagePriceId.fromJson(json['Package_PriceId']);
    } else {
      packagePriceId = null!;
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Package_data'] = this.packageData;
    data['details_data'] = this.detailsData;
    data['Package_time'] = this.packageTime;
    data['details_time'] = this.detailsTime;
    data['Package_validity'] = this.packageValidity;
    data['details_validity'] = this.detailsValidity;
    data['havepassword'] = this.havepassword;
    data['isActive'] = this.isActive;
    data['_id'] = this.sId;
    data['networkId'] = this.networkId;
    data['User_initiate'] = this.userInitiate;
    if (this.packagePriceId != null) {
      data['Package_PriceId'] = this.packagePriceId.toJson();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class PackagePriceId {
  late String packagePrice;
  late String network;
  late String id;
  late bool isAdd;
  PackagePriceId(
      {required this.packagePrice, required this.network, required this.id,required this.isAdd});

  PackagePriceId.fromJson(Map<String, dynamic> json) {
    packagePrice = json['Package_Price'];
    network = json['network'];
    id = json['_id'];
    isAdd = json['isAdd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Package_Price'] = this.packagePrice;
    data['network'] = this.network;
    data['_id'] = this.id;
     data['isAdd'] = this.isAdd;
    return data;
  }
}
// class PackagePrice {
// late  String packagePrice;
// late  String id;
//  late String? network;
  

//   PackagePrice({required this.packagePrice, required this.id,  this.network, });

//   PackagePrice.fromJson(Map<String, dynamic> json) {
//     packagePrice = json['Package_Price'];
//     id = json['_id'];
//     network = json['network'];
   
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['Package_Price'] = this.packagePrice;
//     data['_id'] = this.id;
//     data['network'] = this.network;
 
//     return data;
//   }
// }

// class PackagePrice1 {
//   late final String packagePrice;
//   late final List<String>? network;
//   late final String? id;
// 
//   PackagePrice1({
//     required this.packagePrice,
//     this.network,
//     this.id,
//   });

//   PackagePrice1.fromJson(Map<String, dynamic> json) {
//     packagePrice = json['Package_Price'];
//     network = json['network'].cast<String>();
//     id = json['_id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['Package_Price'] = this.packagePrice;
//     data['network'] = this.network;
//     data['_id'] = this.id;

//     return data;
//   }
// }
