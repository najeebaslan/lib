
class CreeatNetwork {
  late final String nameA;
  late final String nameE;
  dynamic iamge;
  late final String address;
  late final bool isActive;
  late final String userInitiate;
  late final String phones;
  late final String governorate;
  late final String city;
  
  late final String maintenancephone;


  CreeatNetwork(
      {required this.nameA,
      required this.nameE,
      this.iamge,
      required this.address,
      required this.isActive,
      required this.userInitiate,
      required this.phones,
      required this.governorate,
      required this.city,
      
      required this.maintenancephone,
     });

  CreeatNetwork.fromJson(Map<String, dynamic> json) {
    nameA = json['nameA'];
    nameE = json['nameE'];
    iamge = json['iamge'];
    address = json['address'];
    isActive = json['isActive'];
    userInitiate = json['User_initiate'];
    phones = json['Phones'];
    governorate = json['Governorate'];
    city = json['City'];
  
    maintenancephone = json['Maintenancephone'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nameA'] = this.nameA;
    data['nameE'] = this.nameE;
    data['iamge'] = this.iamge;
    data['address'] = this.address;
    data['isActive'] = this.isActive;
    data['User_initiate'] = this.userInitiate;
    data['Phones'] = this.phones;
    data['Governorate'] = this.governorate;
    data['City'] = this.city;

    data['Maintenancephone'] = this.maintenancephone;
   
    return data;
  }
}


class NetworkById {
 late String img;
  bool? isActive;
  List<String>? allcaverageErea;
  List<String>? coverageArea;
  String?sId;
  String?nameA;
  String?nameE;
  String?userInitiate;
  String?phones;
  String?createdAt;
  String?updatedAt;
  int ?iV;

  NetworkById(
      {required this.img,
      this.isActive,
      this.allcaverageErea,
      this.coverageArea,
      this.sId,
      this.nameA,
      this.nameE,
      this.userInitiate,
      this.phones,
      this.createdAt,
      this.updatedAt,
      this.iV});

  NetworkById.fromJson(Map<String, dynamic> json) {
    img = json['img'];
    isActive = json['isActive'];
    allcaverageErea = json['Allcaverage_erea'].cast<String>();
    coverageArea = json['Coverage_area'].cast<String>();
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
    data['Allcaverage_erea'] = this.allcaverageErea;
    data['Coverage_area'] = this.coverageArea;
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