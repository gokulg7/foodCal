import 'package:flutter/material.dart';
import 'package:animated_weight_picker/animated_weight_picker.dart';

class HeightPicker extends StatefulWidget {
  final TextEditingController controller;

  const HeightPicker({required this.controller});

  @override
  _HeightPickerState createState() => _HeightPickerState();
}

class _HeightPickerState extends State<HeightPicker> {
  late double _selectedHeight;

  @override
  void initState() {
    super.initState();
    // Set initial weight value
    _selectedHeight = 100.0;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Select Your Height'),
      content: AnimatedWeightPicker(
        suffixText: 'cm',
        min: 100,
        max: 250,
        onChange: (value) {
          setState(() {
            _selectedHeight = double.parse(value);
          });
        },
      ),
      actions: [
        TextButton(
          onPressed: () {
            // Update the controller with the selected weight
            widget.controller.text = '$_selectedHeight cm';
            Navigator.pop(context);
          },
          child: Text('OK'),
        ),
      ],
    );
  }
}
