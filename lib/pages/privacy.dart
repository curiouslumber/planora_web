import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planora_web/pages/footer.dart';
import 'package:url_launcher/url_launcher.dart';

class Privacy extends StatelessWidget {
  const Privacy({super.key});

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
                  'Planora Privacy Policy',
                  style: textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Text(
                'Last Updated: 27th March, 2025',
                style: textTheme.bodyLarge?.copyWith(
                  color: colorScheme.primary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),

              _buildSectionTitle(context, '1. What We Collect'),
              _buildSectionText(
                context,
                'When you use Planora, we may collect:',
              ),
              _buildBulletPoint(
                context,
                'Account info (email, name when you register)',
              ),
              _buildBulletPoint(
                context,
                'Meeting data you create (titles, notes, times)',
              ),
              _buildBulletPoint(
                context,
                'Device info (type, OS version for bug fixes)',
              ),
              _buildBulletPoint(
                context,
                'Usage patterns (which features you use most)',
              ),

              const SizedBox(height: 32),
              _buildSectionTitle(context, '2. How We Use Your Data'),
              _buildSectionText(context, 'We only use your info to:'),
              _buildBulletPoint(context, 'Provide and improve Planora'),
              _buildBulletPoint(context, 'Personalize your experience'),
              _buildBulletPoint(context, 'Respond to your support requests'),
              _buildBulletPoint(
                context,
                'Send important service updates (no spam, promise)',
              ),

              const SizedBox(height: 32),
              _buildSectionTitle(context, '3. Data Sharing'),
              _buildSectionText(
                context,
                'We will never sell your data. We only share info when:',
              ),
              _buildBulletPoint(
                context,
                'You choose to share meetings with others',
              ),
              _buildBulletPoint(
                context,
                'Required by law (like a court order)',
              ),
              _buildBulletPoint(
                context,
                'With service providers who help run Planora (they\'re under strict confidentiality)',
              ),

              const SizedBox(height: 32),
              _buildSectionTitle(context, '4. Your Rights'),
              _buildSectionText(context, 'You can:'),
              _buildBulletPoint(
                context,
                'Access, update, or delete your account anytime',
              ),
              _buildBulletPoint(context, 'Opt out of non-essential emails'),
              _buildBulletPoint(context, 'Request a copy of your data'),
              _buildBulletPoint(
                context,
                'Delete your account permanently (we\'ll be sad to see you go)',
              ),

              const SizedBox(height: 32),
              _buildSectionTitle(context, '5. Security'),
              _buildSectionText(
                context,
                'We use industry-standard measures to protect your data including:',
              ),
              _buildBulletPoint(context, 'Encryption in transit (SSL/TLS)'),
              _buildBulletPoint(context, 'Secure servers with regular audits'),
              _buildBulletPoint(
                context,
                'Limited employee access to user data',
              ),

              const SizedBox(height: 32),
              _buildSectionTitle(context, '6. Changes to This Policy'),
              _buildSectionText(
                context,
                'We\'ll notify you about significant changes through:',
              ),
              _buildBulletPoint(context, 'In-app announcements'),
              _buildBulletPoint(context, 'Email (if major changes)'),
              _buildBulletPoint(
                context,
                'Updated "Last Updated" date at the top of this page',
              ),

              const SizedBox(height: 32),
              _buildSectionTitle(context, '7. Contact Us'),
              _buildSectionText(context, 'Questions? Hit us up at:'),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.tertiary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                  ),
                  onPressed: () {
                    launchUrl(Uri.parse('mailto:privacy@planora.app'));
                  },
                  child: Text(
                    'Email Our Privacy Team',
                    style: textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: colorScheme.onTertiary,
                    ),
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
