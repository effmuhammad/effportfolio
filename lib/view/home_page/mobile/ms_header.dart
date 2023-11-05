import 'package:effportfolio/view/home_page/widgets/button_view_mycv.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../statics/data_values.dart';
import '../theme/app_theme.dart';
import '../widgets/social_profiles.dart';

class MSHeader extends StatelessWidget {
  const MSHeader({Key? key}) : super(key: key);

  List<Widget> headerData() {
    return [
      Image.asset(
        'assets/images/logo.png',
        height: 250.0,
        width: 250.0,
      ),
      const SizedBox(height: 40.0),
      Column(
        children: [
          AnimatedTextKit(
            totalRepeatCount: 1,
            animatedTexts: [
              TypewriterAnimatedText(
                DataValues.headerGreetings,
                textStyle: AppThemeData.darkTheme.textTheme.headlineSmall,
                speed: const Duration(milliseconds: 250),
              ),
            ],
          ),
          SelectableText(
            DataValues.headerName,
            style: AppThemeData.darkTheme.textTheme.displayMedium,
            textAlign: TextAlign.center,
          ),
          SelectableText(
            DataValues.headerTitle,
            style: AppThemeData.darkTheme.textTheme.titleLarge,
          ),
          const SizedBox(height: 20.0),
          const SizedBox(
            height: 50,
            child: ButtonViewMyCV(pdfUrl: 'assets/docs/myCV.pdf'),
          ),
          const SizedBox(height: 30.0),
          const SocialProfiles(),
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppThemeData.backgroundBlack,
      child: Padding(
          padding: const EdgeInsets.only(bottom: 40.0),
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: headerData(),
              ),
              const SizedBox(height: 40.0),
            ],
          )),
    );
  }
}
