import 'package:flutter/material.dart';
import 'package:flutter_with_hooks_app/widgets/drop_down_form_widget.dart';

class AddBeneficiary extends StatefulWidget {
  const AddBeneficiary({super.key});

  @override
  State<AddBeneficiary> createState() => _AddBeneficiaryState();
}

class _AddBeneficiaryState extends State<AddBeneficiary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Beneficiary'),
        centerTitle: true,
      ),
      body: const AddBeneficiaryWidget(),
    );
  }
}

class AddBeneficiaryWidget extends StatefulWidget {
  const AddBeneficiaryWidget({super.key});

  @override
  State<AddBeneficiaryWidget> createState() => _AddBeneficiaryWidgetState();
}

class _AddBeneficiaryWidgetState extends State<AddBeneficiaryWidget> {
  final formKey = GlobalKey<FormState>();
  String dropDownValue = 'Dog';
  @override
  Widget build(BuildContext context) {
    return Column(
      key: formKey,
      children: [
        dropDownForm(),
      ],
    );
  }

  Widget dropDownForm() => DropDownFormWidget(
        filled: false,
        radius: 10,
        selectedValue: dropDownValue,
        color: Colors.white,
        onChanged: (newValue) {
          setState(() {
            dropDownValue = newValue;
            print('New Value $dropDownValue');
          });
        },
        dropdownItems: <String>['Dog', 'Cat', 'Tiger', 'Lion']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: const TextStyle(fontSize: 30),
            ),
          );
        }).toList(),
      );
}
