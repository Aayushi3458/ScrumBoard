import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'global_variables.dart';
import 'package:provider/provider.dart';

//enum MyThemes { light, dark }
class ThemesNotifier with ChangeNotifier {
  static String modeImage = "light";
  ThemeData _selectedTheme;
  ThemeData light = ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(
      color: Hexcolor('#0D5EDE'),
      textTheme: TextTheme(
        headline6: TextStyle(
          fontSize: 25,
          fontFamily: Variables.fontFamily,
          color: Hexcolor('#FFFFFF'),
        ),
      ),
    ),
    iconTheme: IconThemeData(
      color: Hexcolor('#FFFFFF'),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Hexcolor('#000000'),
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(
        color: Hexcolor('#000000'),
        fontFamily: Variables.fontFamily,
        fontSize: Variables.fontSize,
      ),
      bodyText2: TextStyle(
        color: Hexcolor('#000000'),
        fontFamily: Variables.fontFamily,
        fontSize: Variables.fontSize,
      ),
      headline6: TextStyle(
        fontSize: 25,
        fontFamily: Variables.fontFamily,
        color: Hexcolor('#FFFFFF'),
      ),
    ),
    accentIconTheme: IconThemeData(color: Hexcolor('#0D5EDE')),
    scaffoldBackgroundColor: Hexcolor('#FFFFFF'),
    primaryColor: Hexcolor('#0D5EDE'),
    buttonColor: Hexcolor('#FEEFEF'),
  );
  ThemeData dark = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Hexcolor('#202125'),
    brightness: Brightness.dark,
    iconTheme: IconThemeData(
      color: Hexcolor('#EDE02B'),
    ),
    accentIconTheme: IconThemeData(color: Hexcolor('#EDE02B')),
    appBarTheme: AppBarTheme(
      color: Hexcolor('#000000'),
      textTheme: TextTheme(
        headline6: TextStyle(
          fontSize: 25,
          fontFamily: Variables.fontFamily,
          color: Hexcolor('#FFFFFF'),
        ),
      ),
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(
        color: Hexcolor('#000000'),
        fontFamily: Variables.fontFamily,
        fontSize: Variables.fontSize,
      ),
      bodyText2: TextStyle(
        color: Hexcolor('#FFFFFF'),
        fontFamily: Variables.fontFamily,
        fontSize: Variables.fontSize,
      ),
      headline6: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 25,
        fontFamily: Variables.fontFamily,
        color: Hexcolor('#000000'),
      ),
    ),
    primaryColor: Hexcolor('#000000'),
    buttonColor: Hexcolor('#EDE02B'),
    accentColor: Hexcolor('#EDE02B'),
  );

  ThemesNotifier({bool isDarkMode}) {
    _selectedTheme = isDarkMode ? dark : light;
    if (_selectedTheme == dark) {
      modeImage = "dark";
      print(modeImage);
    } else if (_selectedTheme == light) {
      modeImage = "light";
      print(modeImage);
    }
  }

  ThemeData get getTheme => _selectedTheme;

  void changeTheme() {
    _selectedTheme = _selectedTheme == dark ? light : dark;
    if (_selectedTheme == dark) {
      modeImage = "dark";
      print(modeImage);
    } else if (_selectedTheme == light) {
      modeImage = "light";
      print(modeImage);
    }
    notifyListeners();
  }

  /*Widget image() {
    if (_selectedTheme == light) {
      return Container(
        height: 250,
        decoration: BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.topLeft,

            fit: BoxFit.fitWidth,
          ),
        ),
      );
    }else if(_selectedTheme==dark){return Container(
      height: 250,
      decoration: BoxDecoration(
        image: DecorationImage(
          alignment: Alignment.topLeft,

          fit: BoxFit.fitWidth,
        ),
      ),
    );}

  }*/

  void changeFontSize({double size}) {
    Variables.fontSize = size;
    notifyListeners();
  }
}

class ModeSwitch extends StatefulWidget {
  @override
  _ModeSwitchState createState() => _ModeSwitchState();
}

class _ModeSwitchState extends State<ModeSwitch> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ThemesNotifier>(context)._selectedTheme,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
              ),
              onPressed: () => Navigator.pushNamed(context, '/settings')),
          centerTitle: true,
          title: Text(
            'Settings',
          ),
        ),
        body: Center(
          child: IconButton(
            onPressed: () {
              ThemesNotifier themesNotifier =
              Provider.of<ThemesNotifier>(context, listen: false);
              themesNotifier.changeTheme();
            },
            icon: Icon(
              Icons.brightness_medium,
              color: Theme.of(context).accentIconTheme.color,
            ),
          ), /*Container(
            color: Theme.of(context).buttonColor,
            height: 400.0,
            width: 500.0,
            child: RaisedButton(
              padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
              child: Text(
                "Switch Theme",
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                ThemesNotifier themesNotifier =
                    Provider.of<ThemesNotifier>(context, listen: false);
                themesNotifier.changeTheme();
                //print("yo");
              },
            ),
          ),*/
        ),
      ),
    );
  }
}
