import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planora_web/pages/footer.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

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
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Planora Terms of Service',
                  style: textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              _buildSectionTitle(context, '1. Acceptance of Terms'),
              _buildSectionText(
                context,
                'By accessing or using Planora ("the App"), you agree to be bound by these Terms of Service. '
                'If you do not agree to all the terms, do not use our services.',
              ),

              const SizedBox(height: 32),
              _buildSectionTitle(context, '2. Description of Service'),
              _buildSectionText(
                context,
                'Planora provides productivity tools including but not limited to: '
                'scheduling, note-taking, meeting organization, and collaboration features. '
                'We reserve the right to modify or discontinue any features at any time.',
              ),

              const SizedBox(height: 32),
              _buildSectionTitle(context, '3. User Responsibilities'),
              _buildSectionText(context, 'You agree to:'),
              _buildBulletPoint(
                context,
                'Provide accurate registration information',
              ),
              _buildBulletPoint(
                context,
                'Maintain the security of your account credentials',
              ),
              _buildBulletPoint(
                context,
                'Not use the service for illegal purposes',
              ),
              _buildBulletPoint(
                context,
                'Not attempt to reverse engineer the App',
              ),

              const SizedBox(height: 32),
              _buildSectionTitle(context, '4. Intellectual Property'),
              _buildSectionText(
                context,
                'All content and trademarks on Planora, including the "Your vibe, organized." tagline, '
                'are owned by or licensed to us. You may not use our branding without express permission.',
              ),

              const SizedBox(height: 32),
              _buildSectionTitle(context, '5. Privacy'),
              _buildSectionText(
                context,
                'Your use of Planora is subject to our Privacy Policy. We collect and use data as described therein.',
              ),

              const SizedBox(height: 32),
              _buildSectionTitle(context, '6. Limitation of Liability'),
              _buildSectionText(
                context,
                'Planora shall not be liable for any indirect, incidental, or consequential damages '
                'arising from use of the service. We do not guarantee uninterrupted or error-free service.',
              ),

              const SizedBox(height: 32),
              _buildSectionTitle(context, '7. Modifications'),
              _buildSectionText(
                context,
                'We may revise these terms at any time. Continued use after changes constitutes acceptance. '
                'We will notify users of significant changes through the App or email.',
              ),

              const SizedBox(height: 32),
              _buildSectionTitle(context, '8. Governing Law'),
              _buildSectionText(
                context,
                'These terms shall be governed by the laws of Mumbai, India without regard to conflict of law principles.',
              ),

              const SizedBox(height: 40),
              Center(
                child: Text(
                  'Effective: April 1, 2025',
                  style: textTheme.bodyLarge?.copyWith(
                    color: colorScheme.primary,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              const SizedBox(height: 60),
              const BrandFooter(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String text) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: colorScheme.tertiary,
        ),
      ),
    );
  }

  Widget _buildSectionText(BuildContext context, String text) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: 16,
          height: 1.6,
          color: colorScheme.onSurface.withOpacity(0.8),
        ),
      ),
    );
  }

  Widget _buildBulletPoint(BuildContext context, String text) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 6, right: 8),
            child: Icon(Icons.circle, size: 8, color: colorScheme.primary),
          ),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: 16,
                height: 1.6,
                color: colorScheme.onSurface.withOpacity(0.8),
              ),
            ),
          ),
        ],
      ),
    );
  }
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
              Icon(Icons.auto_awesome, size: 40, color: colorScheme.onPrimary),
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
