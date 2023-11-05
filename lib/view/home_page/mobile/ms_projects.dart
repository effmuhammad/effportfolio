import 'package:flutter/material.dart';

import '../statics/data_values.dart';
import '../statics/key_holders.dart';
import '../theme/app_theme.dart';
import '../widgets/frame_title.dart';
import 'package:card_swiper/card_swiper.dart';

class MSProjects extends StatelessWidget {
  const MSProjects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      "assets/icons/yt_contentcreator.png",
      "assets/icons/ytlogo.png",
      "assets/icons/softeng.png",
      "assets/icons/telegram.png",
    ];
    return Container(
      key: KeyHolders.volunteeringKey,
      color: AppThemeData.backgroundGrey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FrameTitle(
              title: DataValues.projectTitle,
              description: DataValues.projectDescription,
            ),
            const SizedBox(height: 20.0),
            // framework button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () => print('flutter'),
                    child: const Text('Flutter')),
                ElevatedButton(
                    onPressed: () => print('flutter'),
                    child: const Text('Flutter')),
                ElevatedButton(
                    onPressed: () => print('flutter'),
                    child: const Text('Flutter')),
                ElevatedButton(
                    onPressed: () => print('flutter'),
                    child: const Text('Flutter')),
              ],
            ),
            SizedBox(
              height: 250,
              width: double.infinity,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset(
                    images[index],
                  );
                },
                viewportFraction: 0.6,
                scale: 0.5,
                itemCount: 4,
                pagination: const SwiperPagination(),
                control: const SwiperControl(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
