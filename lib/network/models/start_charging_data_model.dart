class StartChargingDataModel {
  String app;
  Data data;

  StartChargingDataModel({this.app, this.data});

  StartChargingDataModel.fromJson(Map<String, dynamic> json) {
    app = json['app'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['app'] = this.app;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String ocppId;
  String userUUID;
  String command;
  Parameters parameters;

  Data({this.ocppId, this.userUUID, this.command, this.parameters});

  Data.fromJson(Map<String, dynamic> json) {
    ocppId = json['ocppId'];
    userUUID = json['userUUID'];
    command = json['command'];
    parameters = json['parameters'] != null
        ? new Parameters.fromJson(json['parameters'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ocppId'] = this.ocppId;
    data['userUUID'] = this.userUUID;
    data['command'] = this.command;
    if (this.parameters != null) {
      data['parameters'] = this.parameters.toJson();
    }
    return data;
  }
}

class Parameters {
  String current;

  Parameters({this.current});

  Parameters.fromJson(Map<String, dynamic> json) {
    current = json['current'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current'] = this.current;
    return data;
  }
}