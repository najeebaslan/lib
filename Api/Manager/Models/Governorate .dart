
class Governorate {
  final String governorate;
  const Governorate({
    required this.governorate,
  });

  static Governorate fromJson(Map<String, dynamic> json) => Governorate(
        governorate: json['Governorate'],
      );
}

