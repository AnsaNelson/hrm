class HomeRes {
  String? error;
  String? sId;
  String? email;
  String? name;
  String? image;
  String? dateofbirth;
  String? joiningdate;
  String? salary;
  String? department;
  String? phone;
  String? address;
  int? iV;

  HomeRes(
      {this.error,
      this.sId,
      this.email,
      this.name,
      this.image,
      this.dateofbirth,
      this.joiningdate,
      this.salary,
      this.department,
      this.phone,
      this.address,
      this.iV});

  HomeRes.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    sId = json['_id'];
    email = json['email'];
    name = json['name'];
    image = json['image'];
    dateofbirth = json['dateofbirth'];
    joiningdate = json['joiningdate'];
    salary = json['salary'];
    department = json['department'];
    phone = json['phone'];
    address = json['address'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['name'] = this.name;
    data['image'] = this.image;
    data['dateofbirth'] = this.dateofbirth;
    data['joiningdate'] = this.joiningdate;
    data['salary'] = this.salary;
    data['department'] = this.department;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['__v'] = this.iV;
    return data;
  }
}