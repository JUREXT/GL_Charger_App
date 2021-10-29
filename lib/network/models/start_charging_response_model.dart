class StartChargingResponseModel {
  int transactionId;
  String chargePointId;
  String chargePointOcppId;
  String chargePointConnectorId;
  int connectorId;
  String startIdTag;
  String startTimestamp;
  int meterStart;
  String status;
  String timestamp;

  StartChargingResponseModel(
      {this.transactionId,
        this.chargePointId,
        this.chargePointOcppId,
        this.chargePointConnectorId,
        this.connectorId,
        this.startIdTag,
        this.startTimestamp,
        this.meterStart,
        this.status,
        this.timestamp});

  StartChargingResponseModel.fromJson(Map<String, dynamic> json) {
    transactionId = json['transactionId'];
    chargePointId = json['chargePointId'];
    chargePointOcppId = json['chargePointOcppId'];
    chargePointConnectorId = json['chargePointConnectorId'];
    connectorId = json['connectorId'];
    startIdTag = json['startIdTag'];
    startTimestamp = json['startTimestamp'];
    meterStart = json['meterStart'];
    status = json['status'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['transactionId'] = this.transactionId;
    data['chargePointId'] = this.chargePointId;
    data['chargePointOcppId'] = this.chargePointOcppId;
    data['chargePointConnectorId'] = this.chargePointConnectorId;
    data['connectorId'] = this.connectorId;
    data['startIdTag'] = this.startIdTag;
    data['startTimestamp'] = this.startTimestamp;
    data['meterStart'] = this.meterStart;
    data['status'] = this.status;
    data['timestamp'] = this.timestamp;
    return data;
  }
}