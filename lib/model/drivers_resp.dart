class AllDrivers {
  String name;
  String phone;
  String email;
  String code;
  String address;
  String city;
  String state;
  String userId;
  dynamic driverLicense;
  String companyId;
  String dateAdded;
  String companyName;
  int assigned;
  bool vehicleAssigned;
  List<String> roles;
  List<Vehicles> vehicles;
  String id;

  AllDrivers(
      {this.name,
      this.phone,
      this.email,
      this.code,
      this.address,
      this.city,
      this.state,
      this.userId,
      this.driverLicense,
      this.companyId,
      this.dateAdded,
      this.companyName,
      this.assigned,
      this.vehicleAssigned,
      this.roles,
      this.vehicles,
      this.id});

  AllDrivers.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    code = json['code'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    userId = json['userId'];
    driverLicense = json['driverLicense'];
    companyId = json['companyId'];
    dateAdded = json['dateAdded'];
    companyName = json['companyName'];
    assigned = json['assigned'];
    vehicleAssigned = json['vehicleAssigned'];
    roles = json['roles'].cast<String>();
    if (json['vehicles'] != null) {
      vehicles = new List<Vehicles>();
      json['vehicles'].forEach((v) {
        vehicles.add(new Vehicles.fromJson(v));
      });
    }
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['phone'] = phone;
    data['email'] = email;
    data['code'] = code;
    data['address'] = address;
    data['city'] = city;
    data['state'] = state;
    data['userId'] = userId;
    data['driverLicense'] = driverLicense;
    data['companyId'] = companyId;
    data['dateAdded'] = dateAdded;
    data['companyName'] = companyName;
    data['assigned'] = assigned;
    data['vehicleAssigned'] = vehicleAssigned;
    data['roles'] = roles;
    if (vehicles != null) {
      data['vehicles'] = vehicles.map((v) => v.toJson()).toList();
    }
    data['id'] = id;
    return data;
  }
}

class Vehicles {
  String plateNumber;
  String vin;
  String carMake;
  String carModel;
  int carModelYear;
  dynamic carReceiptId;
  String dateAdded;
  dynamic track;
  String type;
  String ownerId;
  int fuelConsumed;
  bool deleted;
  dynamic dateDeleted;
  String id;

  Vehicles(
      {this.plateNumber,
      this.vin,
      this.carMake,
      this.carModel,
      this.carModelYear,
      this.carReceiptId,
      this.dateAdded,
      this.track,
      this.type,
      this.ownerId,
      this.fuelConsumed,
      this.deleted,
      this.dateDeleted,
      this.id});

  Vehicles.fromJson(Map<String, dynamic> json) {
    plateNumber = json['plateNumber'];
    vin = json['vin'];
    carMake = json['carMake'];
    carModel = json['carModel'];
    carModelYear = json['carModelYear'];
    carReceiptId = json['carReceiptId'];
    dateAdded = json['dateAdded'];
    track = json['track'];
    type = json['type'];
    ownerId = json['ownerId'];
    fuelConsumed = json['fuelConsumed'];
    deleted = json['deleted'];
    dateDeleted = json['dateDeleted'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['plateNumber'] = plateNumber;
    data['vin'] = vin;
    data['carMake'] = carMake;
    data['carModel'] = carModel;
    data['carModelYear'] = carModelYear;
    data['carReceiptId'] = carReceiptId;
    data['dateAdded'] = dateAdded;
    data['track'] = track;
    data['type'] = type;
    data['ownerId'] = ownerId;
    data['fuelConsumed'] = fuelConsumed;
    data['deleted'] = deleted;
    data['dateDeleted'] = dateDeleted;
    data['id'] = id;
    return data;
  }
}
