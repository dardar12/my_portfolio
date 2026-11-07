
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


void main() {
  runApp(const PortfolioApp());
}

// Colors

const Color bg = Color(0xFF0B1020);
const Color surface = Color(0xFF151D30);
const Color accent = Color(0xFF9B7BFF);
const Color muted = Color(0xFF9AA6BD);

// App

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Su Nandar Nyein | Developer Portfolio',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: bg,
        colorScheme: ColorScheme.fromSeed(
          seedColor: accent,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const PortfolioHome(),
    );
  }
}

// Url Launcher

Future<void> openUrl(String url) async {
  final uri = Uri.parse(url);

  try {
    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
  } catch (e) {
    debugPrint('Could not open URL: $e');
  }
}

// Model

class Project {
  final String title;
  final String description;
  final String image;
  final String category;
  final List<String> technologies;
  final String github;

  const Project({
    required this.title,
    required this.description,
    required this.image,
    required this.category,
    required this.technologies,
    required this.github,
  });
}

// my repository links

const List<Project> projects = [
  Project(
    title: 'Kmart Web',
    category: 'Web Development',
    description:
        'A responsive e-commerce frontend with a modern '
        'shopping interface and reusable components.',
    image: 'assets/images/kmart.png',
    technologies: ['React', 'TypeScript', 'Tailwind'],
    github: 'https://github.com/dardar12/Kmart',
  ),
  Project(
    title: 'ClimateCast',
    category: 'Weather Application',
    description:
        'A modern weather application featuring Clean Architecture '
        'and reactive state management.',
    image: 'assets/images/climatecast.png',
    technologies: ['Flutter', 'Dart', 'Riverpod'],
    github: 'https://github.com/dardar12/flutter-weather-mvvm',
  ),
  Project(
    title: 'MiniShop',
    category: 'E-Commerce Application',
    description:
        'A shopping application with product browsing, '
        'Provider state management and REST API integration.',
    image: 'assets/images/minishop.png',
    technologies: ['Flutter', 'Provider', 'REST API'],
    github: 'https://github.com/dardar12/minishop-mobile',
  ),
  Project(
    title: "Thel's Kitchen",
    category: 'Recipe Application',
    description:
        'A bilingual recipe application with localization '
        'and interactive voice guidance.',
    image: 'assets/images/thels_kitchen.png',
    technologies: ['Flutter', 'Localization', 'Audio'],
    github: 'https://github.com/dardar12/Thels_kitchen_mobile',
  ),
  Project(
    title: "MeetUp app",
    category: 'Video calling app',
    description:
        'A real-time video meeting application built with Flutter and Agora .',
    image: 'assets/images/thels_kitchen.png',
    technologies: ['Flutter', 'Localization', 'Audio'],
    github: 'https://github.com/dardar12/meetup-app',
  ),
  Project(
    title: "React Calculator",
    category: 'Calculation',
    description:
        'A clean, slate-themed React & TypeScript calculator with Dark/Light mode',
    image: 'assets/images/thels_kitchen.png',
    technologies: ['Flutter', 'Localization', 'Audio'],
    github: 'https://github.com/dardar12/react-Calculator',
  ),
  Project(
    title: "TalkyVerse",
    category: 'Video calling app',
    description:
        'Real-time video calling app',
    image: 'assets/images/thels_kitchen.png',
    technologies: ['Flutter', 'Localization', 'Audio'],
    github: 'https://github.com/dardar12/talky_verse',
  ),
  Project(
    title: "CookingGuide",
    category: 'Cooking guiding app',
    description:
        'Recipe App created with Flutter, Clean Architecture, and State Management using Provider.',
    image: 'assets/images/thels_kitchen.png',
    technologies: ['Flutter', 'Localization', 'Audio'],
    github: 'https://github.com/dardar12/recipe-app',
  ),
];

// Home

class PortfolioHome extends StatefulWidget {
  const PortfolioHome({super.key});

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome> {
  final List<GlobalKey> sectionKeys = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

  final List<String> navItems = [
    'Home',
    'About',
    'Skills',
    'Projects',
    'Contact',
  ];

  void goToSection(int index) {
    final sectionContext = sectionKeys[index].currentContext;

    if (sectionContext != null) {
      Scrollable.ensureVisible(
        sectionContext,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
        alignment: 0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            buildNavbar(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      key: sectionKeys[0],
                      child: HeroSection(
                        onExplore: () => goToSection(3),
                        onContact: () => goToSection(4),
                      ),
                    ),
                    Container(
                      key: sectionKeys[1],
                      child: const AboutSection(),
                    ),
                    Container(
                      key: sectionKeys[2],
                      child: const SkillsSection(),
                    ),
                    Container(
                      key: sectionKeys[3],
                      child: const ProjectsSection(),
                    ),
                    Container(
                      key: sectionKeys[4],
                      child: const ContactSection(),
                    ),
                    const FooterSection(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNavbar() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final mobile = constraints.maxWidth < 650;

        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: mobile ? 18 : 40,
            vertical: 18,
          ),
          decoration: const BoxDecoration(
            color: bg,
            border: Border(
              bottom: BorderSide(
                color: Color(0xFF202B40),
              ),
            ),
          ),
          child: Row(
            children: [
              const Text(
                'Su Nandar Nyein.',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2,
                  color: accent,
                ),
              ),
              const Spacer(),

              if (mobile)
                PopupMenuButton<int>(
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  color: surface,
                  onSelected: goToSection,
                  itemBuilder: (context) {
                    return List.generate(
                      navItems.length,
                      (index) => PopupMenuItem<int>(
                        value: index,
                        child: Text(navItems[index]),
                      ),
                    );
                  },
                )
              else ...[
                Row(
                  children: List.generate(
                    navItems.length,
                    (index) => TextButton(
                      onPressed: () => goToSection(index),
                      child: Text(
                        navItems[index],
                        style: const TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                OutlinedButton(
                  onPressed: () => goToSection(4),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: accent,
                    side: const BorderSide(color: accent),
                  ),
                  child: const Text('Hire Me'),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}

// Hero Section

class HeroSection extends StatelessWidget {
  final VoidCallback onExplore;
  final VoidCallback onContact;

  const HeroSection({
    super.key,
    required this.onExplore,
    required this.onContact,
  });

  Widget profileImage() {
    return Container(
      width: 290,
      height: 330,
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: accent.withValues(alpha: 0.6),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: accent.withValues(alpha: 0.15),
            blurRadius: 40,
            spreadRadius: 5,
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(
        'assets/images/my_image.png',
        fit: BoxFit.cover,
        errorBuilder: (context, error, stack) {
          return const Center(
            child: Icon(
              Icons.person,
              color: accent,
              size: 110,
            ),
          );
        },
      ),
    );
  }

  Widget introduction() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 9,
          ),
          decoration: BoxDecoration(
            color: accent.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Text(
            '● AVAILABLE FOR OPPORTUNITIES',
            style: TextStyle(
              fontSize: 11,
              color: accent,
              letterSpacing: 1,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 25),
        const Text(
          "Hello, I'm\nSu Nandar Nyein.",
          style: TextStyle(
            fontSize: 64,
            height: 1.12,
            fontWeight: FontWeight.w900,
            letterSpacing: -2,
          ),
        ),
        const SizedBox(height: 18),
        const Text(
          ' Mobile Developer',
          style: TextStyle(
            color: accent,
            fontSize: 20,
            height: 1.5,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 18),
        const Text(
          'I build beautiful, functional and user-friendly '
          'digital experiences for mobile and web platforms. '
          'I enjoy turning ideas into real applications.',
          style: TextStyle(
            color: muted,
            fontSize: 15,
            height: 1.8,
          ),
        ),
        const SizedBox(height: 30),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            ElevatedButton.icon(
              onPressed: onExplore,
              icon: const Icon(Icons.arrow_downward),
              label: const Text('Explore My Work'),
              style: ElevatedButton.styleFrom(
                backgroundColor: accent,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(18),
              ),
            ),
            OutlinedButton.icon(
              onPressed: () => openUrl(
                'https://github.com/dardar12',
              ),
              icon: const Icon(Icons.code),
              label: const Text('GitHub'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(18),
              ),
            ),
            OutlinedButton(
              onPressed: onContact,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(18),
              ),
              child: const Text('Contact Me'),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final mobile = constraints.maxWidth < 750;

        return Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1150),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 85,
              ),
              child: mobile
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        introduction(),
                        const SizedBox(height: 45),
                        Center(child: profileImage()),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 3,
                          child: introduction(),
                        ),
                        const SizedBox(width: 65),
                        Expanded(
                          flex: 2,
                          child: Center(child: profileImage()),
                        ),
                      ],
                    ),
            ),
          ),
        );
      },
    );
  }
}

// Section Title

class SectionTitle extends StatelessWidget {
  final String eyebrow;
  final String title;
  final String subtitle;

  const SectionTitle({
    super.key,
    required this.eyebrow,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          eyebrow.toUpperCase(),
          style: const TextStyle(
            color: accent,
            letterSpacing: 3,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: muted,
            fontSize: 15,
            height: 1.7,
          ),
        ),
      ],
    );
  }
}

// About

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: surface.withValues(alpha: 0.55),
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 75,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 850),
          child: Column(
            children: [
              const SectionTitle(
                eyebrow: 'Get to know me',
                title: 'About Me',
                subtitle: 'A little introduction about myself',
              ),
              const SizedBox(height: 35),
              const Text(
                'I am a passionate Mobile Application Developer '
                'specializing in Flutter and Dart. I enjoy creating '
                'cross-platform applications with clean architecture, '
                'reusable components and intuitive user interfaces.\n\n'
                'I also explore frontend web development using React, '
                'TypeScript and Tailwind CSS. I am always excited to '
                'learn new technologies and build meaningful projects.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: muted,
                  height: 2,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Skills

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  static const List<Map<String, dynamic>> skills = [
    {'name': 'Flutter', 'icon': Icons.phone_android},
    {'name': 'Dart', 'icon': Icons.code},
    {'name': 'Firebase', 'icon': Icons.local_fire_department},
    {'name': 'Riverpod', 'icon': Icons.account_tree},
    {'name': 'Provider', 'icon': Icons.settings_suggest},
    {'name': 'REST API', 'icon': Icons.api},
    {'name': 'React', 'icon': Icons.web},
    {'name': 'TypeScript', 'icon': Icons.javascript},
    {'name': 'Tailwind CSS', 'icon': Icons.palette},
    {'name': 'Git & GitHub', 'icon': Icons.terminal},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 75,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 950),
          child: Column(
            children: [
              const SectionTitle(
                eyebrow: 'What I work with',
                title: 'Technical Skills',
                subtitle: 'Technologies and tools I use',
              ),
              const SizedBox(height: 35),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 14,
                runSpacing: 14,
                children: skills.map((skill) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      color: surface,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: const Color(0xFF29334B),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          skill['icon'] as IconData,
                          color: accent,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          skill['name'] as String,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Projects

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: surface.withValues(alpha: 0.55),
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 75,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1150),
          child: Column(
            children: [
              const SectionTitle(
                eyebrow: 'My recent work',
                title: 'Featured Projects',
                subtitle:
                    'A collection of applications and websites '
                    'I have developed.',
              ),
              const SizedBox(height: 40),
              LayoutBuilder(
                builder: (context, constraints) {
                  final columns =
                      constraints.maxWidth > 850 ? 2 : 1;

                  return GridView.builder(
                    shrinkWrap: true,
                    physics:
                        const NeverScrollableScrollPhysics(),
                    itemCount: projects.length,
                    gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: columns,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 24,
                      mainAxisExtent: 410,
                    ),
                    itemBuilder: (context, index) {
                      return ProjectCard(
                        project: projects[index],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Pj card

class ProjectCard extends StatefulWidget {
  final Project project;

  const ProjectCard({
    super.key,
    required this.project,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    final project = widget.project;

    return MouseRegion(
      onEnter: (_) => setState(() => hovering = true),
      onExit: (_) => setState(() => hovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        transform: Matrix4.translationValues(
          0,
          hovering ? -6 : 0,
          0,
        ),
        decoration: BoxDecoration(
          color: surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: hovering
                ? accent
                : const Color(0xFF29334B),
          ),
          boxShadow: hovering
              ? [
                  BoxShadow(
                    color: accent.withValues(alpha: 0.12),
                    blurRadius: 20,
                  ),
                ]
              : [],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    project.image,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stack) {
                      return Container(
                        color: const Color(0xFF202C46),
                        child: Center(
                          child: Icon(
                            project.category.contains('Web')
                                ? Icons.web
                                : Icons.phone_android,
                            color: accent,
                            size: 65,
                          ),
                        ),
                      );
                    },
                  ),
                  Positioned(
                    top: 12,
                    left: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 7,
                      ),
                      decoration: BoxDecoration(
                        color: bg.withValues(alpha: 0.9),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        project.category,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      project.title,
                      style: const TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      project.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: muted,
                        height: 1.5,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 7,
                      runSpacing: 7,
                      children: project.technologies.map((tech) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 9,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: accent.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            tech,
                            style: const TextStyle(
                              color: accent,
                              fontSize: 10,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const Spacer(),
                    OutlinedButton.icon(
                      onPressed: () => openUrl(project.github),
                      icon: const Icon(
                        Icons.code,
                        size: 18,
                      ),
                      label: const Text('View on GitHub'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: const BorderSide(color: accent),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Contact

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 85,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 750),
          child: Column(
            children: [
              const SectionTitle(
                eyebrow: "Let's connect",
                title: 'Get In Touch',
                subtitle:
                    'Have a project or an opportunity? '
                    "I'd love to hear from you.",
              ),
              const SizedBox(height: 35),
              contactTile(
                Icons.email_outlined,
                'Email',
                'dardarnyein3@gmail.com',
                'mailto:dardarnyein3@gmail.com',
              ),
              const SizedBox(height: 14),
              contactTile(
                Icons.code,
                'GitHub',
                'github.com/dardar12',
                'https://github.com/dardar12',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget contactTile(
    IconData icon,
    String title,
    String value,
    String url,
  ) {
    return InkWell(
      onTap: () => openUrl(url),
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: surface,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: const Color(0xFF29334B),
          ),
        ),
        child: Row(
          children: [
            Icon(icon, color: accent, size: 28),
            const SizedBox(width: 18),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    value,
                    style: const TextStyle(color: muted),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_outward,
              color: accent,
            ),
          ],
        ),
      ),
    );
  }
}

// footer

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color(0xFF29334B),
          ),
        ),
      ),
      child: const Column(
        children: [
          Text(
            'Su Nandar Nyein.',
            style: TextStyle(
              color: accent,
              fontWeight: FontWeight.w900,
              letterSpacing: 2,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Designed & Built with Flutter 💜',
            style: TextStyle(
              color: muted,
              fontSize: 12,
            ),
          ),
          SizedBox(height: 5),
          Text(
            '© 2026 Su Nandar Nyein. All rights reserved.',
            style: TextStyle(
              color: muted,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}
