class UserModel {
  String? id;
  final String fullName;
  final String phoneNumber;
  final String emailAddress;
  final String idNumber;
  final String mpin;
  UserModel({
    required this.fullName,
    required this.phoneNumber,
    required this.emailAddress,
    required this.idNumber,
    this.id,
    required this.mpin,
  });
  UserModel.fromJson(Map<String, Object?> json)
      : this(
          id: json['id']! as String,
          fullName: json['fullName']! as String,
          phoneNumber: json['phoneNumber']! as String,
          idNumber: json['idNumber']! as String,
          emailAddress: json['emailAddress']! as String,
          mpin: json['mpin']! as String,
        );

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'idNumber': idNumber,
      'emailAddress': emailAddress,
      'mpin': mpin,
    };
  }
}
