import 'package:FirebaseDemo/models/employer.dart';
import 'package:http/http.dart' as http;

class Api {
  Api._();
  static String url = "https://findmotel-cc4ed-default-rtdb.firebaseio.com/";
  static String authKey = "vetnmG9Mz1LKmba0FNB0KoCguNZIhFvh7FHCVklB";

  static Future<Employer> getUserInfo(String uid) async {
    Employer employer = Employer();
    try {
      var response = await http.get('$url/userInfo/$uid.json?auth=$authKey');
      if (response.statusCode == 200)
        employer = Employer.employerFromJson(response.body);
    } catch (e) {
      print("Catch in Api.getUserInfo: $e");
    }
    return employer;
  }

  static Future<bool> updateUserInfo(Employer employer, String uid) async {
    var result = false;
    try {
      var response = await http.put('$url/userInfo/$uid.json?auth=$authKey',
          body: Employer.employerToJson(employer));
      if (response.statusCode == 200) result = true;
    } catch (e) {
      print("Catch in Api.updateUserInfo: $e");
    }
    return result;
  }
}
