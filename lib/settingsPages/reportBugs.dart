import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

class BugReportForm extends StatelessWidget {
  final _bugDescriptionController = TextEditingController();

  BugReportForm({super.key});

  _sendBugReportEmail(String bugDescription) async {
    final smtpServer = gmail('YOUR_EMAIL@gmail.com', 'YOUR_PASSWORD');
    
    final message = Message()
      ..from = Address('YOUR_EMAIL@gmail.com')
      ..recipients.add('medsearchmirko@gmail.com')
      ..subject = 'Bug Report'
      ..text = bugDescription;
    
    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print('Message not sent. Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bug Report Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _bugDescriptionController,
              decoration: InputDecoration(labelText: 'Bug Description'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final bugDescription = _bugDescriptionController.text;
                _sendBugReportEmail(bugDescription);
              },
              child: Text('Submit Bug Report'),
            ),
          ],
        ),
      ),
    );
  }
}
