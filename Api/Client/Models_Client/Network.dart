class Network {
late String img;
late bool isActive;
late List<AllcaverageErea> allcaverageErea;
late List<CoverageArea> coverageArea;
late List<Packages> packages;
late String sId;
late String nameA;
late String nameE;
late String userInitiate;
late String phones;
late String createdAt;
late String updatedAt;
late int iV;

  Network(
      { 
   required this.img,
   required this.isActive,
   required this.allcaverageErea,
   required this.coverageArea,
   required this.packages,
   required this.sId,
   required this.nameA,
   required this.nameE,
   required this.userInitiate,
   required this.phones,
   required this.createdAt,
   required this.updatedAt,
   required this.iV});

  Network.fromJson(Map<String, dynamic> json) {
    img = json['img'];
    isActive = json['isActive'];
    if (json['Allcaverage_erea'] != null) {
      allcaverageErea = <AllcaverageErea>[];
      json['Allcaverage_erea'].forEach((v) {
        allcaverageErea.add(new AllcaverageErea.fromJson(v));
      });
    }
    if (json['Coverage_area'] != null) {
      coverageArea = <CoverageArea>[];
      json['Coverage_area'].forEach((v) {
        coverageArea.add(new CoverageArea.fromJson(v));
      });
    }
    if (json['Packages'] != null) {
      packages = <Packages>[];
      json['Packages'].forEach((v) {
        packages.add(new Packages.fromJson(v));
      });
    }
    sId = json['_id'];
    nameA = json['nameA'];
    nameE = json['nameE'];
    userInitiate = json['User_initiate'];
    phones = json['Phones'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['img'] = this.img;
    data['isActive'] = this.isActive;
    if (this.allcaverageErea != null) {
      data['Allcaverage_erea'] =
          this.allcaverageErea.map((v) => v.toJson()).toList();
    }
    if (this.coverageArea != null) {
      data['Coverage_area'] = this.coverageArea.map((v) => v.toJson()).toList();
    }
    if (this.packages != null) {
      data['Packages'] = this.packages.map((v) => v.toJson()).toList();
    }
    data['_id'] = this.sId;
    data['nameA'] = this.nameA;
    data['nameE'] = this.nameE;
    data['User_initiate'] = this.userInitiate;
    data['Phones'] = this.phones;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class AllcaverageErea {
 late String allcaverageErea;

  AllcaverageErea({required this.allcaverageErea});

  AllcaverageErea.fromJson(Map<String, dynamic> json) {
    allcaverageErea = json['Allcaverage_erea'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Allcaverage_erea'] = this.allcaverageErea;
    return data;
  }
}

class CoverageArea {
 late String address;
late  String governorate;
 late String city;
late  int maintenancephone;
 late String userInitiate;
late  int iV;

  CoverageArea(
      { 
     required this.address,
     required this.governorate,
     required this.city,
     required this.maintenancephone,
     required this.userInitiate,
     required this.iV});

  CoverageArea.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    governorate = json['Governorate'];
    city = json['City'];
    maintenancephone = json['Maintenancephone'];
    userInitiate = json['User_initiate'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['Governorate'] = this.governorate;
    data['City'] = this.city;
    data['Maintenancephone'] = this.maintenancephone;
    data['User_initiate'] = this.userInitiate;
    data['__v'] = this.iV;
    return data;
  }
}

class Packages {
 late String packageData;
late  String detailsData;
 late String packageTime;
 late String detailsTime;
 late String packageValidity;
 late String detailsValidity;
late  PackagePriceId packagePriceId;

  Packages(
      {
     required this.packageData,
     required this.detailsData,
     required this.packageTime,
     required this.detailsTime,
     required this.packageValidity,
     required this.detailsValidity,
     required this.packagePriceId});

  Packages.fromJson(Map<String, dynamic> json) {
    packageData = json['Package_data'];
    detailsData = json['details_data'];
    packageTime = json['Package_time'];
    detailsTime = json['details_time'];
    packageValidity = json['Package_validity'];
    detailsValidity = json['details_validity'];
    if (json['Package_PriceId'] != null) {
      packagePriceId = new PackagePriceId.fromJson(json['Package_PriceId']);
    } else {
      packagePriceId = null!;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Package_data'] = this.packageData;
    data['details_data'] = this.detailsData;
    data['Package_time'] = this.packageTime;
    data['details_time'] = this.detailsTime;
    data['Package_validity'] = this.packageValidity;
    data['details_validity'] = this.detailsValidity;
    if (this.packagePriceId != null) {
      data['Package_PriceId'] = this.packagePriceId.toJson();
    }
    return data;
  }
}

class PackagePriceId {
 late String packagePrice;

  PackagePriceId({required this.packagePrice});

  PackagePriceId.fromJson(Map<String, dynamic> json) {
    packagePrice = json['Package_Price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Package_Price'] = this.packagePrice;
    return data;
  }
}
