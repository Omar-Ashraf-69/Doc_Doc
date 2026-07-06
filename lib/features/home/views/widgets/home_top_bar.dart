import 'package:doc_doc/core/constants/assets.dart';
import 'package:doc_doc/core/theming/colors.dart';
import 'package:doc_doc/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hi, Omar!", style: TextStyles.font18DarkBlueBold),
            SizedBox(height: 4),
            Text('How are you feeling?', style: TextStyles.font12GrayRegular),
          ],
        ),
        const Spacer(),
        Container(
          decoration: BoxDecoration(
            color: ColorsManager.moreLighterGray,
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(8),
          child: SvgPicture.asset(Assets.svgsNotifications),
        ),
        
      ],
    );
  }
}
