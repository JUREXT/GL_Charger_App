
class ChargerModel {
  String chargerName;
  bool isOnline;
  bool chargingState;
  String chargerLocation;
  String maxPower;

  ChargerModel({
    this.chargerName,
    this.isOnline,
    this.chargingState,
    this.chargerLocation,
    this.maxPower,
  });

  @override
  String toString() {
    return 'ChargerModel{chargerName: $chargerName, isOnline: $isOnline, chargingState: $chargingState, chargerLocation: $chargerLocation, maxPower: $maxPower}';
  }

// ChargerModel.fromJson(Map<String, dynamic> json) {
  //   username = json['username'];
  //   email = json['email'];
  //   country = json['country'];
  //   photoUrl = json['photoUrl'];
  //   signedUpAt = json['signedUpAt'];
  //   isOnline = json['isOnline'];
  //   lastSeen = json['lastSeen'];
  //   bio = json['bio'];
  //   id = json['id'];
  // }
  //
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['username'] = this.username;
  //   data['country'] = this.country;
  //   data['email'] = this.email;
  //   data['photoUrl'] = this.photoUrl;
  //   data['bio'] = this.bio;
  //   data['signedUpAt'] = this.signedUpAt;
  //   data['isOnline'] = this.isOnline;
  //   data['lastSeen'] = this.lastSeen;
  //   data['id'] = this.id;
  //
  //   return data;
  // }
}
