import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class BrandFooter extends StatelessWidget {
  final bool showDivider;
  final EdgeInsetsGeometry? padding;

  const BrandFooter({super.key, this.showDivider = true, this.padding});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        if (showDivider)
          Divider(
            color: colorScheme.outline.withOpacity(0.3),
            thickness: 1,
            height: 60,
          ),
        Padding(
          padding: padding ?? const EdgeInsets.symmetric(vertical: 40),
          child: Column(
            children: [
              // Logo and tagline
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/planora_logo.png',
                    height: 28,
                    color: colorScheme.primary,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Planora',
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Your vibe, organized.',
                style: GoogleFonts.poppins(
                  color: colorScheme.primary,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 32),

              // Social media links
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSocialIcon(
                    context: context,
                    icon: FontAwesomeIcons.instagram,
                    url: 'https://instagram.com/planoraapp',
                  ),
                  const SizedBox(width: 20),
                  _buildSocialIcon(
                    context: context,
                    icon: FontAwesomeIcons.tiktok,
                    url: 'https://tiktok.com/@planoraapp',
                  ),
                  const SizedBox(width: 20),
                  _buildSocialIcon(
                    context: context,
                    icon: FontAwesomeIcons.twitter,
                    url: 'https://twitter.com/planoraapp',
                  ),
                  const SizedBox(width: 20),
                  _buildSocialIcon(
                    context: context,
                    icon: FontAwesomeIcons.discord,
                    url: 'https://discord.gg/planora',
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Links row
              Wrap(
                spacing: 24,
                runSpacing: 16,
                alignment: WrapAlignment.center,
                children: [
                  _buildFooterLink(
                    context: context,
                    text: 'Privacy Policy',
                    onTap: () => Navigator.pushNamed(context, '/privacy'),
                  ),
                  _buildFooterLink(
                    context: context,
                    text: 'Terms of Service',
                    onTap: () => Navigator.pushNamed(context, '/terms'),
                  ),
                  _buildFooterLink(
                    context: context,
                    text: 'Contact Us',
                    onTap: () => launchUrl(Uri.parse('mailto:hi@planora.app')),
                  ),
                  _buildFooterLink(
                    context: context,
                    text: 'Blog',
                    onTap:
                        () => launchUrl(Uri.parse('https://blog.planora.app')),
                  ),
                  _buildFooterLink(
                    context: context,
                    text: 'Careers',
                    onTap:
                        () =>
                            launchUrl(Uri.parse('https://planora.app/careers')),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Copyright text
              Text(
                '© ${DateTime.now().year} Planora. All vibes reserved.',
                style: GoogleFonts.poppins(
                  color: colorScheme.onSurface.withOpacity(0.6),
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Made with ❤️ for productivity',
                style: GoogleFonts.poppins(
                  color: colorScheme.onSurface.withOpacity(0.6),
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSocialIcon({
    required BuildContext context,
    required IconData icon,
    required String url,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return IconButton(
      icon: FaIcon(icon, size: 20),
      color: colorScheme.primary,
      onPressed: () async {
        if (await canLaunchUrl(Uri.parse(url))) {
          await launchUrl(Uri.parse(url));
        }
      },
    );
  }

  Widget _buildFooterLink({
    required BuildContext context,
    required String text,
    required VoidCallback onTap,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          text,
          style: GoogleFonts.poppins(
            color: colorScheme.primary,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
