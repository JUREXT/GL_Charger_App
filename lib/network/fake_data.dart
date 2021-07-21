import 'package:gl_charge_app/network/user.dart';
import 'charger.dart';

List<Charger> listOfChargersFake = [
  Charger(chargerName: "Home Charger 1",
      isOnline: true,
      chargingState: true,
      chargerLocation: "Ljubljana",
      maxPower: "1.5"),
  Charger(chargerName: "Home Charger 2",
      isOnline: false,
      chargingState: true,
      chargerLocation: "Ljubljana",
      maxPower: "1.5"),
  Charger(chargerName: "Home Charger 3",
      isOnline: true,
      chargingState: false,
      chargerLocation: "Ljubljana",
      maxPower: "1.5"),
  Charger(chargerName: "Home Charger 4",
      isOnline: true,
      chargingState: false,
      chargerLocation: "Ljubljana",
      maxPower: "1.5"),
  Charger(chargerName: "Home Charger 5",
      isOnline: true,
      chargingState: false,
      chargerLocation: "Celje",
      maxPower: "1.9"),
  Charger(chargerName: "Home Charger 6",
      isOnline: false,
      chargingState: true,
      chargerLocation: "Novo Mesto",
      maxPower: "8,6"),
];

List<User> listOfUsersFake = [
  User.createUserByName(1, "User 1", "Surname", null),
];