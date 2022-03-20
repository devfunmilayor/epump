import 'dart:convert';

UserLoginResp userLoginRespFromJson(String str) =>
    UserLoginResp.fromJson(json.decode(str));

String userLoginRespToJson(UserLoginResp data) => json.encode(data.toJson());

class UserLoginResp {
  UserLoginResp({
    this.token,
    this.fullName,
    this.email,
    this.phone,
    this.roles,
    this.isDeveloper,
    this.avatar,
    this.developer,
    this.isActive,
    this.country,
    this.userId,
  });

  final String token;
  final String fullName;
  final String email;
  final String phone;
  final List<String> roles;
  final bool isDeveloper;
  final dynamic avatar;
  final Developer developer;
  final bool isActive;
  final Country country;
  final String userId;

  factory UserLoginResp.fromJson(Map<String, dynamic> json) => UserLoginResp(
        token: json["token"] == null ? null : json["token"],
        fullName: json["fullName"] == null ? null : json["fullName"],
        email: json["email"] == null ? null : json["email"],
        phone: json["phone"] == null ? null : json["phone"],
        roles: json["roles"] == null
            ? null
            : List<String>.from(json["roles"].map((x) => x)),
        isDeveloper: json["isDeveloper"] == null ? null : json["isDeveloper"],
        avatar: json["avatar"],
        developer: json["developer"] == null
            ? null
            : Developer.fromJson(json["developer"]),
        isActive: json["isActive"] == null ? null : json["isActive"],
        country:
            json["country"] == null ? null : Country.fromJson(json["country"]),
        userId: json["userId"] == null ? null : json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "token": token == null ? null : token,
        "fullName": fullName == null ? null : fullName,
        "email": email == null ? null : email,
        "phone": phone == null ? null : phone,
        "roles": roles == null ? null : List<dynamic>.from(roles.map((x) => x)),
        "isDeveloper": isDeveloper == null ? null : isDeveloper,
        "avatar": avatar,
        "developer": developer == null ? null : developer.toJson(),
        "isActive": isActive == null ? null : isActive,
        "country": country == null ? null : country.toJson(),
        "userId": userId == null ? null : userId,
      };
}

class Country {
  Country({
    this.name,
    this.currency,
    this.code,
    this.utcTime,
    this.currencyName,
    this.currencyHtmlDisplay,
    this.isBlocked,
    this.id,
  });

  final String name;
  final String currency;
  final String code;
  final int utcTime;
  final String currencyName;
  final String currencyHtmlDisplay;
  final bool isBlocked;
  final String id;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: json["name"] == null ? null : json["name"],
        currency: json["currency"] == null ? null : json["currency"],
        code: json["code"] == null ? null : json["code"],
        utcTime: json["utcTime"] == null ? null : json["utcTime"],
        currencyName:
            json["currencyName"] == null ? null : json["currencyName"],
        currencyHtmlDisplay: json["currencyHTMLDisplay"] == null
            ? null
            : json["currencyHTMLDisplay"],
        isBlocked: json["isBlocked"] == null ? null : json["isBlocked"],
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "currency": currency == null ? null : currency,
        "code": code == null ? null : code,
        "utcTime": utcTime == null ? null : utcTime,
        "currencyName": currencyName == null ? null : currencyName,
        "currencyHTMLDisplay":
            currencyHtmlDisplay == null ? null : currencyHtmlDisplay,
        "isBlocked": isBlocked == null ? null : isBlocked,
        "id": id == null ? null : id,
      };
}

class Developer {
  Developer({
    this.id,
    this.active,
  });

  final String id;
  final bool active;

  factory Developer.fromJson(Map<String, dynamic> json) => Developer(
        id: json["id"] == null ? null : json["id"],
        active: json["active"] == null ? null : json["active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "active": active == null ? null : active,
      };
}
