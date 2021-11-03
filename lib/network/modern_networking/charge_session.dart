class ChargeSessionDTO { // TODO: delete later
  int id;
  String param1;
  String param2;
  String param3;

  ChargeSessionDTO(this.id, this.param1, this.param2, this.param3);
  ChargeSessionDTO.createChargeSession(this.id, this.param1, this.param2, this.param3);

  @override
  String toString() {
    return 'User{userId: $id, param1: $param1, param2: $param2, param3: $param3}';
  }
}
