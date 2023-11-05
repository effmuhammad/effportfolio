import 'package:flutter/material.dart';

import 'theme/responsive_screen_provider.dart';
import 'theme/app_theme.dart';
import 'widgets/nav_bar.dart';
import 'desktop/ds_header.dart';
import 'desktop/ds_about_me.dart';
import 'desktop/ds_education.dart';
import 'desktop/ds_experience.dart';
import 'desktop/ds_volunteering.dart';
import 'desktop/ds_technotes.dart';
import 'desktop/ds_contact.dart';
import 'desktop/ds_footer.dart';
import 'mobile/ms_header.dart';
import 'mobile/ms_about_me.dart';
import 'mobile/ms_education.dart';
import 'mobile/ms_experience.dart';
import 'mobile/ms_projects.dart';
import 'mobile/ms_technotes.dart';
import 'mobile/ms_contact.dart';
import 'mobile/ms_footer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showBackToTopButton = false;
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(
        () {
          setState(
            () {
              if (_scrollController.offset >= 300) {
                _showBackToTopButton = true;
              } else {
                _showBackToTopButton = false;
              }
            },
          );
        },
      );

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    _scrollController.animateTo(0,
        duration: const Duration(milliseconds: 1000), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    Widget desktopUI() {
      return ListView(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        children: const [
          DSHeader(),
          DSAboutMe(),
          DSEducation(),
          DSExperience(),
          DSVolunteering(),
          DSTechNotes(),
          DSContact(),
          DSFooter(),
        ],
      );
    }

    Widget mobileUI() {
      return ListView(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        children: const [
          MSHeader(),
          MSProjects(),
          MSAboutMe(),
          MSEducation(),
          MSExperience(),
          MSTechNotes(),
          MSContact(),
          MSFooter(),
        ],
      );
    }

    return Scaffold(
      appBar: ResponsiveScreenProvider.isDesktopScreen(context)
          ? null
          : AppBar(elevation: 0.0),
      drawer: ResponsiveScreenProvider.isDesktopScreen(context)
          ? null
          : NavBar().mobileNavBar(),
      body: SingleChildScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        child: Container(
          color: AppThemeData.backgroundGrey,
          child: ResponsiveScreenProvider.isDesktopScreen(context)
              ? desktopUI()
              : mobileUI(),
        ),
      ),
      floatingActionButton: _showBackToTopButton == false
          ? null
          : FloatingActionButton(
              onPressed: _scrollToTop,
              tooltip: 'Go to top',
              backgroundColor: AppThemeData.buttonPrimary,
              foregroundColor: AppThemeData.iconSecondary,
              child: const Icon(
                Icons.arrow_upward_rounded,
              ),
            ),
    );
  }
}
