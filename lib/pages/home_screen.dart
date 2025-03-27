import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planora_web/pages/home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: colorScheme.primaryContainer,
        title: Row(
          children: [
            const SizedBox(width: 12),
            Text(
              'Planora',
              style: textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.onPrimaryContainer,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Text(
              'Created By Noel Pinto',
              style: textTheme.bodyLarge?.copyWith(
                color: colorScheme.onPrimaryContainer,
              ),
            ),
          ),
        ],
        iconTheme: context.theme.appBarTheme.iconTheme,
      ),
      drawer: _buildDrawer(context),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colorScheme.tertiary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Icon(Icons.rocket_launch, color: colorScheme.onTertiary),
        onPressed: () => Get.toNamed('/waitlist'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [colorScheme.surfaceVariant, colorScheme.surface],
            radius: 1.5,
          ),
        ),
        child: const Home(),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Drawer(
      backgroundColor: colorScheme.surfaceVariant,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [colorScheme.primary, colorScheme.secondary],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.auto_awesome,
                  size: 40,
                  color: colorScheme.onPrimary,
                ),
                const SizedBox(height: 16),
                Text(
                  'Your Vibe,\nOrganized',
                  textAlign: TextAlign.center,
                  style: textTheme.headlineSmall?.copyWith(
                    color: colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          _buildDrawerTile(
            context: context,
            icon: Icons.home_filled,
            title: 'Home',
            action: () => Get.toNamed('/'),
          ),
          _buildDrawerTile(
            context: context,
            icon: Icons.privacy_tip,
            title: 'Privacy Policy',
            action: () => Get.toNamed('/privacy'),
          ),
          _buildDrawerTile(
            context: context,
            icon: Icons.description,
            title: 'Terms',
            action: () => Get.toNamed('/terms'),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerTile({
    required BuildContext context,
    required IconData icon,
    required String title,
    required Function action,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(icon, color: colorScheme.tertiary),
      title: Text(
        title,
        style: TextStyle(
          color: colorScheme.onSurfaceVariant,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: () => action(),
      hoverColor: colorScheme.tertiary.withOpacity(0.1),
    );
  }
}
