import 'package:flutter/material.dart';
import 'package:flutter_with_hooks_app/widgets/drop_down_form_widget.dart';
import 'package:flutter_with_hooks_app/widgets/text_form_field_widget.dart';

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
    return Form(
      key: formKey,
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 40, 20, 0.0),
            child: dropDownForm(),
          ),
          //const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 40, 20, 0.0),
            child: firstNameField(),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 40, 20, 0.0),
            child: lastNameField(),
          ),
          const SizedBox(height: 5)
        ],
      ),
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
              style: const TextStyle(fontSize: 17),
            ),
          );
        }).toList(),
      );

  Widget firstNameField() => TextFormFieldWidget(
        labelText: 'First Name',
        hintText: 'First Name',
      );

  Widget lastNameField() => TextFormFieldWidget(
        labelText: 'Last Name',
        hintText: 'Last Name',
      );
}
