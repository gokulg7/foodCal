import 'package:flutter/material.dart';
import 'package:animated_weight_picker/animated_weight_picker.dart';

class WeightPicker extends StatefulWidget {
  final TextEditingController controller;

  const WeightPicker({required this.controller});

  @override
  _WeightPickerState createState() => _WeightPickerState();
}

class _WeightPickerState extends State<WeightPicker> {
  late double _selectedWeight;

  @override
  void initState() {
    super.initState();
    // Set initial weight value
    _selectedWeight = 50.0;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Select Your Weight'),
      content: AnimatedWeightPicker(

        min: 50,
        max: 200,
        onChange: (value) {
          setState(() {
            _selectedWeight = double.parse(value);
          });
        },
      ),
      actions: [
        TextButton(
          onPressed: () {
            // Update the controller with the selected weight
            widget.controller.text = '$_selectedWeight kg';
            Navigator.pop(context);
          },
          child: Text('OK'),
        ),
      ],
    );
  }
}
