import 'package:flutter/material.dart';

class SplashViewLogo extends StatelessWidget {
  const SplashViewLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.centerStart,
      children: [
        Image.asset('assets/images/logo.png'),
        const Padding(
          padding: EdgeInsets.only(left: 55, top: 25),
          child: Text(
            'TREAMFLIX',
            style: TextStyle(
              color: Color(0xffEB3223),
              fontSize: 24,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ],
    );
  }
}
