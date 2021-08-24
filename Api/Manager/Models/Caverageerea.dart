class Allcaverage_erea {
  String ?id;
  late String allcaverageErea;
  late String? networkid;

  Allcaverage_erea({
     this.id,
    required this.allcaverageErea,
     this.networkid,
  });

  Allcaverage_erea.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    allcaverageErea = json['Allcaverage_erea'];
    networkid = json['networkid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['Allcaverage_erea'] = this.allcaverageErea;
    data['networkid'] = this.networkid;

    return data;
  }

}
class EreaNotidnetwork {
  String ?id;
  late String allcaverageErea;
  EreaNotidnetwork({
     this.id,
    required this.allcaverageErea,
  });
  EreaNotidnetwork.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    allcaverageErea = json['Allcaverage_erea'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['Allcaverage_erea'] = this.allcaverageErea;
    return data;
  }

}
