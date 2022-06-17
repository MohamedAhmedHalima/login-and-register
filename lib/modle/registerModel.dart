class registerModel {
  String ? name ;
  String ? email ;
  String ? password ;
  String ? password_confirmation ;
  String ? avatar ;

  registerModel(
      {this.name,
      this.email,
      this.password,
      this.password_confirmation,
      this.avatar});

  factory registerModel.fromJson(Map<String, dynamic> json) {
    return registerModel(
      name: json["name"],
      email: json["email"],
      password: json["password"],
      password_confirmation: json["password_confirmation"],
      avatar: json["avatar"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": this.name,
      "email": this.email,
      "password": this.password,
      "password_confirmation": this.password_confirmation,
      "avatar": this.avatar,
    };
  }
//


}