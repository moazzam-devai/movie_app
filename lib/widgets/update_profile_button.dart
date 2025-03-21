import 'package:flutter/material.dart';
import 'package:movie/widgets/neon_card_widget.dart';

class UpdateProfileButton extends StatelessWidget {
  const UpdateProfileButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.center,
      child: NeonCard(
        intensity: 0,
        glowSpread: 0,
        child: SizedBox(
          width: 300,
          height: 50,
          child: Center(
            child: GradientText(
              text: 'Update Profile',
              fontSize: 18,
              gradientColors: [
                Colors.white,
                Colors.white,
                Colors.white,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
