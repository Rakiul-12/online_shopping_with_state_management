import 'package:cloud_firestore/cloud_firestore.dart';

class AddressModel {
  String id;
  final String name;
  final String phoneNumber;
  final String street;
  final String postalCode;
  final String city;
  final String state;
  final String country;
  final DateTime? dateTime;
  bool selectAddress;

  AddressModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.street,
    required this.postalCode,
    required this.city,
    required this.state,
    required this.country,
    this.dateTime,
    this.selectAddress = true,
  });

  static AddressModel empty() => AddressModel(
    id: "",
    name: "",
    phoneNumber: "",
    street: "",
    postalCode: "",
    city: "",
    state: "",
    country: "",
  );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "phoneNumber": phoneNumber,
      "street": street,
      "postalCode": postalCode,
      "city": city,
      "state": state,
      "country": country,
      "dateTime": dateTime,
      "selectedAddress": selectAddress,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> data) {
    return AddressModel(
      id: data["id"] ?? "",
      name: data["name"] ?? "",
      phoneNumber: data["phoneNumber"] ?? "",
      street: data["street"] ?? "",
      postalCode: data["postalCode"] ?? "",
      city: data["city"] ?? "",
      state: data["state"] ?? "",
      country: data["country"] ?? "",
      selectAddress: data["selectedAddress"] ?? false,
      dateTime: data["dateTime"] != null
          ? (data["dateTime"] as Timestamp).toDate()
          : null,
    );
  }

  factory AddressModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return AddressModel(
      id: snapshot.id,
      name: data["name"] ?? "",
      phoneNumber: data["phoneNumber"] ?? "",
      street: data["street"] ?? "",
      postalCode: data["postalCode"] ?? "",
      city: data["city"] ?? "",
      state: data["state"] ?? "",
      country: data["country"] ?? "",
      selectAddress: data["selectedAddress"] ?? false,
      dateTime: data["dateTime"] != null
          ? (data["dateTime"] as Timestamp).toDate()
          : null,
    );
  }

  @override
  String toString() {
    return "$street, $city, $state, $postalCode, $country";
  }
}
