import 'package:flutter/material.dart';

import '../../components/about_us/about_us_content.dart';
import '../../components/about_us/donate_content.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [DonateContent(), AboutUsContent()],
      ),
    );
  }
}
