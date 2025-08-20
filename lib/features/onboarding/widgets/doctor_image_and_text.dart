import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';

class DoctorImageAndText extends StatelessWidget {
  const DoctorImageAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Opacity(
            opacity: 0.1,
            child: SvgPicture.asset('assets/svgs/docdoc_logo_background.svg'),
          ),
        ),

        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.white.withOpacity(0.0)],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: const [0.14, 0.4],
            ),
          ),
          child: Image.asset('assets/images/onboarding_doctor.png'),
        ),

        Positioned(
          bottom: 30,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Best Doctor Appointment App',
              textAlign: TextAlign.center,
              style: TextStyles.font23BlueBold.copyWith(height: 1.2),
            ),
          ),
        ),
      ],
    );
  }
}
