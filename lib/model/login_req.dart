class UserLogin {
  UserLogin({
    this.email,
    this.password,
  });

  final String email;
  final String password;

  factory UserLogin.fromJson(Map<String, dynamic> json) => UserLogin(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
