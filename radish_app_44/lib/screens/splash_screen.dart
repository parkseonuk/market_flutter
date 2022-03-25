import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

//스플래쉬스크린 클래스 생성(인스턴스)
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ExtendedImage.asset('assets/images/logo/logo01_blue.png', width: 300,),
            CircularProgressIndicator(  // 로딩바
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
