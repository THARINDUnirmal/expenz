import 'package:expenz_app/utils/colors.dart';
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
                "User details store succsessfull",
                style: TextStyle(
                  fontSize: 20,
                  color: kWhite,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          );
        }
      }
    } catch (e) {
      e.toString();
    }
  }

  static Future<bool> isStroeUserData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? isIn = pref.getString("userName");
    if (isIn == null) {
      return false;
    } else {
      return true;
    }
  }
}
