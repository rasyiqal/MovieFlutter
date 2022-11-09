import 'package:flutter/material.dart';
import 'package:movie/theme/theme.dart';
import 'package:movie/widget/notification_service.dart';

class SetTime extends StatefulWidget {
  const SetTime({super.key});

  @override
  State<SetTime> createState() => _SetTimeState();
}

class _SetTimeState extends State<SetTime> {
  NotificationServices notificationServices = NotificationServices();

  @override
  void initState() {
    super.initState();
    notificationServices.initialisetNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Set Time'),
        leading: GestureDetector(
          child: IconButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, 'home', (route) => false);
            },
            icon: Icon(
              Icons.arrow_back,
            ),
          ),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                notificationServices.sendNotification(
                  "UTS IOS",
                  "Ini local notifikasiiii Fikri",
                );
              },
              child: const Text(
                'Send Notification',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                notificationServices.sceduleNotification(
                  "Notifikasii setiap menit",
                  "UTS IOs",
                );
              },
              child: const Text(
                'Scedule Notification',
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                'Stop Notification',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
