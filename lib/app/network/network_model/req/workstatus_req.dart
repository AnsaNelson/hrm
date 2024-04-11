class WorkstatusReq {
  String? error;
  String? name;
  String? date;
  String? businessName;
  String? description;
  String? phoneNumber;
  String? workStatus;
  String? department;

  WorkstatusReq(
      {this.error,
      this.name,
      this.date,
      this.businessName,
      this.description,
      this.phoneNumber,
      this.workStatus,
      this.department, });

  WorkstatusReq.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    name = json['name'];
    date = json['date'];
    businessName = json['businessName'];
    description = json['description'];
    phoneNumber = json['phoneNumber'];
    workStatus = json['workStatus'];
    department = json['department'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['name'] = this.name;
    data['date'] = this.date;
    data['businessName'] = this.businessName;
    data['description'] = this.description;
    data['phoneNumber'] = this.phoneNumber;
    data['workStatus'] = this.workStatus;
    data['department'] = this.department;
    return data;
  }
}
