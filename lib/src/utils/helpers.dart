import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:flutter/material.dart';

import '../views/other_views/no_internet_page.dart';
import 'constants.dart';

class Helper {
  static TimeOfDay timeParser({String time}) {
    return TimeOfDay(
        hour: int.parse(time.split(":")[0]),
        minute: int.parse(time.split(":")[1]));
  }

// static SvgPicture LevelIndicator({@required int level, double size}) {
//   if (level == 2) {
//     return SvgPicture.asset(
//       'assets/lvl2${Data.locale.languageCode}.svg',
//       height: size,
//     );
//   } else if (level == 3) {
//     return SvgPicture.asset('assets/lvl3${Data.locale.languageCode}.svg',
//         height: size);
//   } else if (level == 4) {
//     return SvgPicture.asset('assets/lvl4${Data.locale.languageCode}.svg',
//         height: size);
//   } else if (level == 5) {
//     return SvgPicture.asset('assets/lvl5${Data.locale.languageCode}.svg',
//         height: size);
//   } else {
//     return SvgPicture.asset('assets/lvl1${Data.locale.languageCode}.svg',
//         height: size);
//   }
// }

}

class DynamicValidator {
  static dynamic validate(dynamic value, context) {
    if (value == null) {
      return '*Required';
    }
    return null;
  }
}

class FieldValidator {
  static String validate(String value, context) {
    if (value.isEmpty) {
      return '*Required';
    }
    return null;
  }
}

class EmailValidator {
  static String validate(String value, context) {
    if (value.isEmpty) {
      return '*Required';
    }
    RegExp regExp = new RegExp(Constants.emailRegExp);
    if (!regExp.hasMatch(value)) {
      return 'Enter A Valid Email';
    }
    return null;
  }
}

class MobileValidator {
  static String validate(String value, context) {
    if (value.isEmpty) {
      return '*Required';
    }
    if (value.length < 8 || value.length > 14) {
      return 'Mobile must between 8 and 14 digits';
    }
    return null;
  }
}

class PasswordValidator {
  static String validate(String value, context) {
    if (value.isEmpty) {
      return '*Required';
    }
    if (value.length < 8) {
      return 'Password must be at least 8-characters';
    }
    return null;
  }
}

class N extends Navigator {
  static Future push(context, Widget value) async {
    var dynamicValue;
    bool result = await InternetConnectionChecker().hasConnection;

    if (result) {
      dynamicValue = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => value,
          ));
    } else {
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NoInternetPage(widget: value),
        ),
      );
    }
    return dynamicValue;
  }

  static Future pushReplacement(context, Widget value) async {
    var dynamicValue;
    bool result = await InternetConnectionChecker().hasConnection;
    if (result) {
      dynamicValue = await Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => value,
          ));
    } else {
      await Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => NoInternetPage(widget: value),
        ),
      );
    }
    return dynamicValue;
  }

  static popUntilFirst(context) {
    Navigator.popUntil(
      context,
      (route) => route.isFirst,
    );
  }

  static pop(context) {
    Navigator.pop(context);
  }
}
