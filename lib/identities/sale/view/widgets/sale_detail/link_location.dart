import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../settings/theme.dart';

class LinkLocation extends StatelessWidget {
  final String location;
  const LinkLocation({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    double latitude;
    double longitude;
    latitude = double.parse(location.split(',').first);
    longitude = double.parse(location.split(',').last);
    return IconButton(
        onPressed: () {
          openMap(latitude, longitude);
        },
        icon: const Icon(Icons.location_on,
            size: 30, color: ColorPalette.primaryText));
  }
}

Future<void> openMap(double latitude, double longitude) async {
  Uri url = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'No se pudo abrir Google Maps';
  }
}
