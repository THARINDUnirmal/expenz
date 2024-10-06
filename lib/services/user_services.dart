import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserServices {
  static Future<void> userDataStroe({
    required userName,
    required userEmail,
    required userPassword,
    required comfirmPassword,
    required BuildContext context,
  }) async {
    try {
      if (userPassword == comfirmPassword) {
        SharedPreferences prf = await SharedPreferences.getInstance();
        await prf.setString("userName", userName);
        await prf.setString("userEmail", userEmail);

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                "User Details Store Succsessfull",
              ),
            ),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Please Check Password And Comfirm Password"),
          ),
        );
      }
    } catch (e) {
      e.toString();
    }
  }

  //cheack user name

  static Future<bool> isStroeUserData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? isIn = pref.getString("userName");
    if (isIn == null) {
      return false;
    } else {
      return true;
    }
  }

  //get user Name and user Email

  static Future<Map<String, String>> getUserDetails() async {
    SharedPreferences prf = await SharedPreferences.getInstance();
    String? uName = prf.getString("userName");
    String? uEmail = prf.getString("userEmail");

    return {"userName": uName!, "userEmail": uEmail!};
  }

  //delete user data

  static Future<void> deleteUserData(BuildContext context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.remove("userName");
    await pref.remove("userEmail");
  }
}
