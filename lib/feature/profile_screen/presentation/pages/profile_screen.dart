import 'package:anime_app/core/providers/theme_provider.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          Switch(
            value: ThemeProvider.of(context).isLightTheme,
            onChanged: ThemeProvider.of(context).toggleTheme,
          ),
        ],
      ),
    );
  }
}
