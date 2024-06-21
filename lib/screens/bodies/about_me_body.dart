import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/services/screen_service.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMeBody extends StatelessWidget {
  const AboutMeBody({Key? key}) : super(key: key);

  void onSocialTap(String link) async {
    final Uri url = Uri.parse(link);
    await launchUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                FractionallySizedBox(
                  widthFactor: isDesktop(context) ? 0.5 : 1,
                  child: CircleAvatar(
                    radius: isDesktop(context) ? 200 : 150,
                    backgroundImage: const AssetImage('images/nadav.jpg'),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Nadav Vazana',
                  style: TextStyle(fontSize: 30),
                )
              ],
            ),
            FractionallySizedBox(
              widthFactor: 0.7,
              child: Row(
                children: [
                  SizedBox(
                    width: 50,
                    child: GestureDetector(
                      onTap: () {
                        onSocialTap('https://il.linkedin.com/in/nadavvazana');
                      },
                      child: Image.asset('images/linkedin.png'),
                    ),
                  ),
                  const SizedBox(width: 30),
                  SizedBox(
                    width: 50,
                    child: GestureDetector(
                      onTap: () {
                        onSocialTap('https://github.com/NadavVazana');
                      },
                      child: Image.asset('images/github.jpg'),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
