import 'package:mini_proj/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:mini_proj/src/constants/image_strings.dart';
import 'package:mini_proj/src/common_widgets/round_textfield.dart';
import 'package:mini_proj/src/common_widgets/round_button.dart';
import 'package:mini_proj/src/constants/text_string.dart';
import 'package:intl/intl.dart';
import 'package:mini_proj/src/features/authentication/screens/main_tab/main_tab_view.dart';

import 'helpers/height_picker.dart';
import 'helpers/weight_picker.dart';

class GetProfileScreen extends StatefulWidget {
  const GetProfileScreen({super.key});

  @override
  State<GetProfileScreen> createState() => _GetProfileScreen();
}

class _GetProfileScreen extends State<GetProfileScreen> {

  TextEditingController txtDate = TextEditingController();
  TextEditingController txtWeight = TextEditingController();
  TextEditingController txtHeight = TextEditingController();
  TextEditingController txtGender = TextEditingController();
  TextEditingController txtPhoneNum = TextEditingController();

  List<Map<String, dynamic>> genders = [
    {"name": "Male", "icon": Icons.male},
    {"name": "Female", "icon": Icons.female},
    {"name": "Other", "icon": Icons.transgender},
  ];
  String? selectedGender;

  bool isButtonEnabled = false;

  void checkFields() {
    setState(() {
      isButtonEnabled = txtDate.text.isNotEmpty &&
          txtWeight.text.isNotEmpty &&
          txtHeight.text.isNotEmpty &&
          txtGender.text.isNotEmpty &&
          txtPhoneNum.text.isNotEmpty;
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      final formattedDate = DateFormat('dd/MM/yyyy').format(picked);
      setState(() {
        txtDate.text = formattedDate;// Update the text field with the selected date
        checkFields();
      });
    }
  }

  Future<void> _selectWeight(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return WeightPicker(controller: txtWeight);
      },
    ).then((_) => checkFields());
  }

  Future<void> _selectHeight(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return HeightPicker(controller: txtHeight);
      },
    ).then((_) => checkFields());
  }

  Future<void> _selectGender(BuildContext context) async {
    final result = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Gender', style: TextStyle(color: Colors.blue)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: genders
                .map((gender) => ListTile(
              leading: Icon(gender['icon'], color: Colors.black),
              title: Text(gender['name'], style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.pop(context, gender['name']);
              },
            ))
                .toList(),
          ),
        );
      },
    );

    if (result != null) {
      setState(() {
        selectedGender = result;
        txtGender.text = selectedGender!;
        checkFields();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Image(image: const AssetImage(proScreenImg),
                  width: media.width,
                  fit: BoxFit.fitWidth,
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                Text(
                  finProfile,
                  style: TextStyle(
                      color: TColor.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  knowMore,
                  style: TextStyle(color: TColor.gray, fontSize: 12),
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: [
                      RoundTextField(
                        controller: txtGender,
                        hitText: gender,
                        icon: genderIcon,
                        readOnly: true,
                        onChanged: (_) => checkFields(),
                        onTap: () {
                          _selectGender(context);
                        },
                      ),
                      SizedBox(
                        height: media.width * 0.04,
                      ),
                      RoundTextField(
                        controller: txtPhoneNum,
                        hitText: number,
                        onChanged: (_) => checkFields(),
                        icon: phoneIcon,
                        readOnly: false,
                      ),
                      SizedBox(
                        height: media.width * 0.04,
                      ),
                      RoundTextField(
                        controller: txtDate,
                        hitText: "Date of Birth",
                        onChanged: (_) => checkFields(),
                        icon: dobIcon,
                        readOnly: true,
                        onTap: () {
                          _selectDate(context); // Open DatePicker when the text field is tapped
                        },
                      ),
                      SizedBox(
                        height: media.width * 0.04,
                      ),
                      RoundTextField(
                        controller: txtWeight,
                        hitText: "Your Weight",
                        onChanged: (_) => checkFields(),
                        readOnly: true,
                        icon: weightIcon,
                        onTap: () {
                          _selectWeight(context);
                        },
                      ),
                      SizedBox(
                        height: media.width * 0.04,
                      ),
                      RoundTextField(
                        controller: txtHeight,
                        onChanged: (_) => checkFields(),
                        hitText: "Your Height",
                        icon: heightIcon,
                        readOnly: true,
                        onTap: (){
                          _selectHeight(context);
                        },
                      ),
                      SizedBox(
                        height: media.width * 0.07,
                      ),
                      /*RoundButton(
                          title: "Next >",

                          onPressed: isButtonEnabled ? () {
                            print('haii');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  const MainTabView()),
                            );
                          } : null,
                      ),*/
                      SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: isButtonEnabled ? accentColor : Colors.transparent,
                                foregroundColor: isButtonEnabled ? darkColor : Colors.transparent,),
                            onPressed: isButtonEnabled ? () {
                              print('haii');
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    const MainTabView()),
                              );
                            } : null,
                            child: const Text(
                              "Next >",
                              style: TextStyle(color: whiteColor),
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
