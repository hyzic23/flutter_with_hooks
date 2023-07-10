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
  bool? isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,

        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text('Please enter beneficiary details : ',
                style: TextStyle(fontSize: 16)),
          ),
          Padding(
            //padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            padding: const EdgeInsets.fromLTRB(20.0, 40, 20, 0.0),
            child: dropDownForm(),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: firstNameField(),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: lastNameField(),
          ),
          // const SizedBox(height: 5),
          // CheckboxListTile(
          //   title: const Text('Checkbox List Tile'),
          //   value: isChecked,
          //   onChanged: (bool? newValue) {
          //     setState(() {
          //       isChecked = newValue;
          //     });
          //   },
          //   activeColor: Colors.orangeAccent,
          //   checkColor: Colors.white,
          //   //subtitle: const Text('This is the subtitle'),
          //   //controlAffinity: ListTileControlAffinity.leading,
          //   //tristate: true,
          // ),
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

  Widget firstNameField() => const TextFormFieldWidget(
        labelText: 'First Name',
        hintText: 'First Name',
      );

  Widget lastNameField() => const TextFormFieldWidget(
        labelText: 'Last Name',
        hintText: 'Last Name',
      );
}
