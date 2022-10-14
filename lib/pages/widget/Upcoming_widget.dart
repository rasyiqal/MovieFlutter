import 'package:flutter/material.dart';
import 'package:movie/theme/theme.dart';

class UpcomingMovie extends StatelessWidget {
  const UpcomingMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Upcoming Movie',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: bold,
                ),
              ),
              Text(
                'see all',
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
