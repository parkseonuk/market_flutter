import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class IntroPage extends StatelessWidget {
  //페이지 컨트롤러

  IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        Size size = MediaQuery.of(context).size;

        final imgOne = size.width - 32;
        final imgTwo = imgOne * 0.1;
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '자동화 시스템 구축',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(
                  width: imgOne,
                  height: imgOne,
                  child: Stack(
                    children: [
                      ExtendedImage.asset(
                        'assets/images/logo/logo02_blue.png',
                      ),
                      Positioned(
                        left: imgTwo,
                        right: imgTwo,
                        top: imgOne * 0.45,
                        bottom: imgOne * 0.45,
                        child: ExtendedImage.asset(
                          'assets/images/arrows/arrow_red.png',
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  '- 제작에서 배송까지 OK!! -',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '명함, 봉투, 스티커, 포스타, 전단, 홀더,\n'
                  '리플렛, 마스타인쇄, 디지털인쇄,\n'
                  '실사출력 등등 인쇄에 관련된업무',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextButton(
                      onPressed: () async {
                        context.read<PageController>().animateToPage(1,
                            duration: Duration(milliseconds: 700),
                            curve: Curves.easeInOut);
                      },
                      child: Text(
                        '로그인하고 시작하기',
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
