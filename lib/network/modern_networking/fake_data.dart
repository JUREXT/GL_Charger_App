import 'package:gl_charge_app/network/charger.dart';
import 'package:gl_charge_app/network/charger_session.dart';

List<Charger> listOfFakeChargers = [
  Charger("1", "Parking Lot", true, true, "Giza", "11", "ocppId"),
  Charger("2", "Home Garage", true, false, "New Cairo", "11", "ocppId"),
  Charger("3", "Home Outside", true, true, "New Cairo", "11", "ocppId"),
  Charger("4", "Office Front", true, false, "Cairo", "11", "ocppId"),
  Charger("5", "Office Back", true, true, "Cairo", "22", "ocppId"),
];

List<ChargerSession> listOfFakeSessions = [
  ChargerSession(
      "1", // id
      "09.09.2021 13:10", // date
      200, // duration (min)
      10, // average
      "35"), // consumed

  ChargerSession("2", "15.09.2021 09:15", 180, 10, "33"),
  ChargerSession("3", "20.09.2021 07:20", 100, 5, "8"),
  ChargerSession("4", "01.10.2021 16:18", 150, 7, "15"),
  ChargerSession("5", "09.10.2021 09:34", 50, 10, "9"),
  ChargerSession("6", "30.10.2021 23:12", 100, 10, "16"),
  ChargerSession("7", "01.11.2021 11:08", 80, 10, "15"),
  ChargerSession("8", "05.11.2021 20:11", 50, 6, "6"),
  ChargerSession("9", "05.11.2021 06:12", 20, 10, "3"),
];