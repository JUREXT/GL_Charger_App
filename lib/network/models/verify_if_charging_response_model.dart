class VerifyIfChargingResponseModel {
  String id;
  int transactionId;
  String chargePointId;
  String chargePointOcppId;
  Null chargePointConnectorId;
  String connectorId;
  String startIdTag;
  String startTimestamp;
  int meterStart;
  String endTimestamp;
  int meterStop;
  int maxPower;
  String status;
  String stopReason;
  String timestamp;
  String createdAt;
  String updatedAt;

  VerifyIfChargingResponseModel(
      {this.id,
        this.transactionId,
        this.chargePointId,
        this.chargePointOcppId,
        this.chargePointConnectorId,
        this.connectorId,
        this.startIdTag,
        this.startTimestamp,
        this.meterStart,
        this.endTimestamp,
        this.meterStop,
        this.maxPower,
        this.status,
        this.stopReason,
        this.timestamp,
        this.createdAt,
        this.updatedAt});

  VerifyIfChargingResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    transactionId = json['transactionId'];
    chargePointId = json['chargePointId'];
    chargePointOcppId = json['chargePointOcppId'];
    chargePointConnectorId = json['chargePointConnectorId'];
    connectorId = json['connectorId'];
    startIdTag = json['startIdTag'];
    startTimestamp = json['startTimestamp'];
    meterStart = json['meterStart'];
    endTimestamp = json['endTimestamp'];
    meterStop = json['meterStop'];
    maxPower = json['maxPower'];
    status = json['status'];
    stopReason = json['stopReason'] == null ? null : json['stopReason']; // Used to verify is charging or not, null is charging, any thing else is not
    timestamp = json['timestamp'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['transactionId'] = this.transactionId;
    data['chargePointId'] = this.chargePointId;
    data['chargePointOcppId'] = this.chargePointOcppId;
    data['chargePointConnectorId'] = this.chargePointConnectorId;
    data['connectorId'] = this.connectorId;
    data['startIdTag'] = this.startIdTag;
    data['startTimestamp'] = this.startTimestamp;
    data['meterStart'] = this.meterStart;
    data['endTimestamp'] = this.endTimestamp;
    data['meterStop'] = this.meterStop;
    data['maxPower'] = this.maxPower;
    data['status'] = this.status;
    data['stopReason'] = this.stopReason;
    data['timestamp'] = this.timestamp;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }

  @override
  String toString() {
    return 'VerifyIfChargingResponseModel{transactionId: $transactionId, stopReason: $stopReason}';
  }
}