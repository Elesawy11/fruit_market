import 'package:shared_preferences/shared_preferences.dart';

Future<SharedPreferences> createSharedPref() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs;
}

SharedPreferences? prefrenceObject;
void getSharedPref() async {
  prefrenceObject = await createSharedPref();
}
