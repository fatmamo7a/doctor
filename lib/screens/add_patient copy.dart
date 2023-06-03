import 'package:flutter/material.dart';

class checkheart extends StatefulWidget {
  const checkheart({required Key key}) : super(key: key);

  @override
  _PatientInfoFormState createState() => _PatientInfoFormState();
}

class _PatientInfoFormState extends State<checkheart> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _phoneController = TextEditingController();
  String _gender = '';

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient Information'),
        backgroundColor: const Color(0xFFF5CEB8),
      ),
       
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'enter patient name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(
                  labelText: 'Address',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return ' enter patient address';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  labelText: 'Phone number',
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'enter patient phone number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              const Text('Gender'),
              RadioListTile(
                title: const Text('Male'),
                value: 'Male',
                groupValue: _gender,
                onChanged: (value) {
                  setState(() {
                    _gender = value.toString();
                  });
                },
              ),
              RadioListTile(
                title: const Text('Female'),
                value: 'Female',
                groupValue: _gender,
                onChanged: (value) {
                  setState(() {
                    _gender = value.toString();
                  });
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Form is valid, submit data
                    final name = _nameController.text;
                    final address = _addressController.text;
                    final phone = _phoneController.text;
                    final gender = _gender;
                    print('Name: $name');
                    print('Address: $address');
                    print('Phone: $phone');
                    print('Gender: $gender');
                  }
                },
                child: const Text('Save'),
                
                 
              ),
            ],
          ),
        ),
      ),
    );
  }
}