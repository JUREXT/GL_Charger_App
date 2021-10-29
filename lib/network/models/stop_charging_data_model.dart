class StopChargingDataModel {
  String app;
  DataStop data;

  StopChargingDataModel({this.app, this.data});

  StopChargingDataModel.fromJson(Map<String, dynamic> json) {
    app = json['app'];
    data = json['data'] != null ? new DataStop.fromJson(json['data']) : null;
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

class DataStop {
  String ocppId;
  String userUUID;
  String command;
  ParametersStop parameters;

  DataStop({this.ocppId, this.userUUID, this.command, this.parameters});

  DataStop.fromJson(Map<String, dynamic> json) {
    ocppId = json['ocppId'];
    userUUID = json['userUUID'];
    command = json['command'];
    parameters = json['parameters'] != null
        ? new ParametersStop.fromJson(json['parameters'])
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

class ParametersStop {
  String transactionId;

  ParametersStop({this.transactionId});

  ParametersStop.fromJson(Map<String, dynamic> json) {
    transactionId = json['transactionId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['transactionId'] = this.transactionId;
    return data;
  }
}