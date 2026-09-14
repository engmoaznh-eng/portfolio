import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/app_colors.dart';
import 'core/constants/app_strings.dart';
import 'core/utils/url_launcher_util.dart';
import 'data/personal_data.dart';
import 'sections/home/home_section.dart';
import 'sections/about/about_section.dart';
import 'sections/skills/skills_section.dart';
import 'sections/projects/projects_section.dart';
import 'sections/experience/experience_section.dart';
import 'sections/education/education_section.dart';
import 'sections/contact/contact_section.dart';
import 'widgets/common/footer.dart';
import 'widgets/navigation/nav_bar.dart';

void main() {
  GoogleFonts.config.allowRuntimeFetching = true;
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '${PersonalData.name} — ${PersonalData.title}',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      home: const PortfolioHomePage(),
    );
  }
}

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  final _scrollController = ScrollController();

  final _homeKey = GlobalKey();
  final _aboutKey = GlobalKey();
  final _skillsKey = GlobalKey();
  final _projectsKey = GlobalKey();
  final _experienceKey = GlobalKey();
  final _educationKey = GlobalKey();
  final _contactKey = GlobalKey();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollTo(GlobalKey key) {
    final context = key.currentContext;
    if (context == null) return;
    Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final navItems = [
      NavItem(AppStrings.navHome, () => _scrollTo(_homeKey)),
      NavItem(AppStrings.navAbout, () => _scrollTo(_aboutKey)),
      NavItem(AppStrings.navSkills, () => _scrollTo(_skillsKey)),
      NavItem(AppStrings.navProjects, () => _scrollTo(_projectsKey)),
      NavItem(AppStrings.navExperience, () => _scrollTo(_experienceKey)),
      NavItem(AppStrings.navEducation, () => _scrollTo(_educationKey)),
      NavItem(AppStrings.navContact, () => _scrollTo(_contactKey)),
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                KeyedSubtree(key: _homeKey, child: HomeSection(onViewProjects: () => _scrollTo(_projectsKey))),
                KeyedSubtree(key: _aboutKey, child: const AboutSection()),
                KeyedSubtree(key: _skillsKey, child: const SkillsSection()),
                KeyedSubtree(key: _projectsKey, child: const ProjectsSection()),
                KeyedSubtree(key: _experienceKey, child: const ExperienceSection()),
                KeyedSubtree(key: _educationKey, child: const EducationSection()),
                KeyedSubtree(key: _contactKey, child: const ContactSection()),
                const Footer(),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: NavBar(
              scrollController: _scrollController,
              items: navItems,
              onDownloadCv: UrlLauncherUtil.downloadCv,
              onOpenGithub: PersonalData.githubUrl != null ? () => UrlLauncherUtil.openUrl(PersonalData.githubUrl!) : null,
              onOpenLinkedin:
                  PersonalData.linkedinUrl != null ? () => UrlLauncherUtil.openUrl(PersonalData.linkedinUrl!) : null,
            ),
          ),
        ],
      ),
    );
  }
}
