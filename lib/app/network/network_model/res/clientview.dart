class ClientviewRes {
  String? error;
  List<Clients>? clients;

  ClientviewRes({this.error, this.clients});

  ClientviewRes.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    if (json['clients'] != null) {
      clients = <Clients>[];
      json['clients'].forEach((v) {
        clients!.add(new Clients.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    if (this.clients != null) {
      data['clients'] = this.clients!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Clients {
  String? sId;
  String? name;
  String? date;
  String? businessName;
  String? description;
  String? phoneNumber;
  String? department;
  int? iV;

  Clients(
      {this.sId,
      this.name,
      this.date,
      this.businessName,
      this.description,
      this.phoneNumber,
      this.department,
      this.iV});

  Clients.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    date = json['date'];
    businessName = json['businessName'];
    description = json['description'];
    phoneNumber = json['phoneNumber'];
    department = json['department'];
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
    data['__v'] = this.iV;
    return data;
  }
}
