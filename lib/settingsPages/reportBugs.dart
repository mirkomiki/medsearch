import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class BugReportForm extends StatefulWidget {
  const BugReportForm({super.key});

  @override
  _BugReportFormState createState() => _BugReportFormState();
}

class _BugReportFormState extends State<BugReportForm> {
  final _bugDescriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bug Report Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _bugDescriptionController,
              decoration: InputDecoration(labelText: 'Bug Description'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final bugDescription = _bugDescriptionController.text;

                final Email email = Email(
                  body: bugDescription,
                  subject: 'Bug Report',
                  recipients: ['medsearchmirko@gmail.com'],
                );

                await FlutterEmailSender.send(email);
                },
              child: const Text('Submit Bug Report'),
            ),
          ],
        ),
      ),
    );
  }
}
