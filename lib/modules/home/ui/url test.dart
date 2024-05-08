import 'package:flutter/material.dart';

import '../../../data/url_launcer/url_launcher.dart';

class UrlTest extends StatelessWidget {
  const UrlTest({super.key});

  void _handlePhonePressed(String value) => UrlLauncher.openPhoneNumber(value);

  void _handleEmailPressed(String value) => UrlLauncher.openEmail(value);

  void _handleLocationPressed(String value) => UrlLauncher.openGoogleMaps(value);

  void _handleGitPressed(String value) => UrlLauncher.openGitUser(value);

  void _handleTwitterPressed(String value) => UrlLauncher.openTwitterUser(value);

  void _handleLinkPressed(String value) => UrlLauncher.openHttp(value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                _handleEmailPressed("navghandabhi@megamindsunited.com");
              },
              child: const Text("open email")),
          const SizedBox(height: 8),
          ElevatedButton(
              onPressed: () {
                _handlePhonePressed("12345677985");
              },
              child: const Text("open phone ")),
          const SizedBox(height: 8),
          ElevatedButton(
              onPressed: () {
                _handleLocationPressed("Raysangpar");
              },
              child: const Text("location ")),
          const SizedBox(height: 8),
          ElevatedButton(
              onPressed: () {
                _handleGitPressed("dabhinavaghan");
              },
              child: const Text("Github")),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
