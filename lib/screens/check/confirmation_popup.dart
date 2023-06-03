import 'package:doctor_application/layout/doctor_screen.dart';
import 'package:doctor_application/models/confirmation_model.dart';
import 'package:flutter/material.dart';

class ConfirmationPopup extends StatelessWidget {
  final ConfirmationModel confirmationModel;
  const ConfirmationPopup({super.key, required this.confirmationModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/success.png',
          height: 70,
        ),
        const SizedBox(height: 20),
        Text(
          confirmationModel.title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 50),
        _confirmationRowContent(
            title: 'patient name', description: confirmationModel.name ?? ''),
        const Divider(),
        _confirmationRowContent(
            title: 'phone', description: confirmationModel.phone ?? ''),
        const Divider(),
        _confirmationRowContent(
            title: 'age', description: confirmationModel.age ?? ''),
        const Divider(),
        _confirmationRowContent(
            title: 'Description',
            description: confirmationModel.description ?? ''),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.grey)),
                child: const Text("Cancel"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.red[200])),
                child: const Text("Save"),
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const LayoutScreen()));
                },
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _confirmationRowContent({
    required String title,
    required String description,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        Text(
          description,
          style: TextStyle(
            color: Colors.red[200],
          ),
        )
      ],
    );
  }
}
