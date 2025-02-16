import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class SettingsPageState {}

class _SettingsPageState extends State<SettingsPage> {
  final List<Locale> supportedLocales = [
    const Locale('en', 'US'), // English
    const Locale('hi', 'IN'), // Hindi
    const Locale('gu', 'IN'), // Gujarati
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.green,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 16, top: 25, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Settings",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Icon(
                    Icons.person,
                    color: Colors.green,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Account",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Divider(
                height: 15,
                thickness: 2,
              ),
              SizedBox(
                height: 10,
              ),
              buildAccountOptionRow(context, "Change password"),
              buildAccountOptionRow(context, "Content settings"),
              buildAccountOptionRow(context, "Social"),
              buildAccountOptionRow(context, "Language"),
              buildAccountOptionRow(context, "Privacy and security"),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Icon(
                    Icons.volume_up_outlined,
                    color: Colors.green,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Notifications",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Divider(
                height: 15,
                thickness: 2,
              ),
              SizedBox(
                height: 10,
              ),
              buildNotificationOptionRow("New for you", true),
              buildNotificationOptionRow("Account activity", true),
              buildNotificationOptionRow("Opportunity", false),
              SizedBox(
                height: 50,
              ),
              // Center(
              //   child: OutlinedButton(
              //     onPressed: () {
              //       Get.back();
              //     },
              //     child: Text("SIGN OUT",
              //         style: TextStyle(
              //             fontSize: 14,
              //             letterSpacing: 2.2,
              //             color: Colors.black)),
              //   ),
              // )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.defaultDialog(
              title: "Select Language",
              content: Column(mainAxisSize: MainAxisSize.min, children: [
                buildLanguageOption(context, supportedLocales[0]),
                // English
                buildLanguageOption(context, supportedLocales[1]),
                // English
                buildLanguageOption(context, supportedLocales[2]),
                // English
              ]));
        },
        child: Icon(Icons.language),
      ),
    );
  }

  Row buildNotificationOptionRow(String title, bool isActive) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600]),
        ),
        Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              value: isActive,
              onChanged: (bool val) {},
            ))
      ],
    );
  }

  GestureDetector buildAccountOptionRow(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        if (title == 'Change password') {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Change Password'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Old Password',
                      ),
                    ),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'New Password',
                      ),
                    ),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Confirm New Password',
                      ),
                    ),
                  ],
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text('Change'),
                  ),
                ],
              );
            },
          );
        } else {
          // For other options, show a default dialog
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Option 1'),
                    Text('Option 2'),
                    Text('Option 3'),
                  ],
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text('Close'),
                  ),
                ],
              );
            },
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  ListTile buildLanguageOption(BuildContext context, Locale locale) {
    String languageName = '';
    switch (locale.languageCode) {
      case 'en':
        languageName = 'English';
        break;
      case 'hi':
        languageName = 'Hindi';
        break;
      case 'gu':
        languageName = 'Gujarati';
        break;
      default:
        languageName = 'Unknown';
    }
    return ListTile(
      title: Text(languageName),
      onTap: () {
        // Set the selected locale when tapping on a language option
        Get.updateLocale(locale);
        Get.back();
      },
      selected: Get.locale?.languageCode == locale.languageCode,
    );
  }
}
