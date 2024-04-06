class HomeReq {
  String? error;
  String? email;
  String? password;

  HomeReq({this.error, this.email, this.password});

  HomeReq.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}
