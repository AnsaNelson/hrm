class WorkstatusRes {
  String? error;
  String? message;
  Client? client;

  WorkstatusRes({this.error, this.message, this.client});

  WorkstatusRes.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    client =
        json['client'] != null ? new Client.fromJson(json['client']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['message'] = this.message;
    if (this.client != null) {
      data['client'] = this.client!.toJson();
    }
    return data;
  }
}

class Client {
  String? sId;
  String? name;
  String? date;
  String? businessName;
  String? description;
  String? phoneNumber;
  String? department;
  String? workStatus;
  int? iV;

  Client(
      {this.sId,
      this.name,
      this.date,
      this.businessName,
      this.description,
      this.phoneNumber,
      this.department,
      this.workStatus,
      this.iV});

  Client.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    date = json['date'];
    businessName = json['businessName'];
    description = json['description'];
    phoneNumber = json['phoneNumber'];
    department = json['department'];
    workStatus = json['workStatus'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['date'] = this.date;
    data['businessName'] = this.businessName;
    data['description'] = this.description;
    data['phoneNumber'] = this.phoneNumber;
    data['department'] = this.department;
    data['workStatus'] = this.workStatus;
    data['__v'] = this.iV;
    return data;
  }
}
