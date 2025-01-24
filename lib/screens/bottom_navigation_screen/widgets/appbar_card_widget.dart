import 'package:flutter/material.dart';
import 'package:login_app/components/button_component.dart';
import 'package:login_app/providers/user_provider.dart';
import 'package:login_app/utils/constants.dart';
import 'package:login_app/theme_data/fonts.dart';
import 'package:login_app/theme_data/palette.dart';
import 'package:provider/provider.dart';

class AppbarCardWidget extends StatelessWidget {
  const AppbarCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 175,
      child: Card(
        elevation: 5,
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
            ),
            Positioned(
                top: 15,
                left: 20,
                child: Column(
                  children: [
                    Text(
                      'My Earnings',
                      style: CustomFontStyle.regularText.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      '\$${context.read<UserProvider>().user?.data?.earnings}',
                      style: CustomFontStyle.boldText.copyWith(
                          fontSize: 40,
                          height: 1,
                          fontWeight: FontWeight.w700,
                          color: Palette.primary),
                    )
                  ],
                )),
            Positioned(
              right: 12,
              top: 10,
              bottom: 10,
              child: AspectRatio(
                  aspectRatio: 0.95, child: Image.asset(AssetImages.treasure)),
            ),
            Positioned(
              left: -8,
              bottom: 0,
              child: CustomPaint(
                painter: _CustomCurve(),
                child: SizedBox(width: 190, height: 80),
              ),
            ),
            Positioned(
              left: 20,
              bottom: 20,
              child: ButtonComponent(
                borderRadius: 5,
                maxWidth: 60,
                height: 25,
                text: 'Details',
                fontSize: 10,
                fontWeight: FontWeight.w500,
                backgroundColor: Colors.grey.shade300,
                fontColor: Palette.purple,
                onPressed: () {
                  //
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomCurve extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();

    // Path number 1

    paint.color = Color(0xffEC3F2E);
    path = Path();
    path.lineTo(size.width * 0.47, size.height * 0.16);
    path.cubicTo(size.width * 0.32, -0.03, size.width * 0.03,
        size.height * 0.06, size.width * 0.03, size.height * 0.06);
    path.cubicTo(size.width * 0.03, size.height * 0.06, size.width * 0.03,
        size.height * 1.04, size.width * 0.03, size.height * 1.04);
    path.cubicTo(size.width * 0.03, size.height * 1.04, size.width * 1.03,
        size.height * 1.04, size.width * 1.03, size.height * 1.04);
    path.cubicTo(size.width * 1.03, size.height * 1.04, size.width * 0.82,
        size.height * 0.87, size.width * 0.71, size.height * 0.69);
    path.cubicTo(size.width * 0.6, size.height * 0.52, size.width * 0.58,
        size.height * 0.3, size.width * 0.47, size.height * 0.16);
    path.cubicTo(size.width * 0.47, size.height * 0.16, size.width * 0.47,
        size.height * 0.16, size.width * 0.47, size.height * 0.16);
    canvas.drawPath(path, paint);

    // Path number 2

    paint.color = Palette.primary;
    path = Path();
    path.lineTo(size.width * 1.02, size.height * 1.03);
    path.cubicTo(size.width * 1.02, size.height * 1.03, size.width * 1.02,
        size.height * 1.03, size.width * 1.02, size.height * 1.03);
    path.cubicTo(size.width * 1.02, size.height * 1.03, size.width * 0.03,
        size.height * 1.03, size.width * 0.03, size.height * 1.03);
    path.cubicTo(size.width * 0.03, size.height * 1.03, size.width * 0.03,
        size.height * 0.06, size.width * 0.03, size.height * 0.06);
    path.cubicTo(size.width * 0.03, size.height * 0.06, size.width * 0.03,
        size.height * 0.06, size.width * 0.03, size.height * 0.06);
    path.cubicTo(size.width * 0.03, size.height * 0.06, size.width * 0.03,
        size.height * 0.06, size.width * 0.04, size.height * 0.06);
    path.cubicTo(size.width * 0.05, size.height * 0.06, size.width * 0.06,
        size.height * 0.05, size.width * 0.07, size.height * 0.05);
    path.cubicTo(size.width * 0.1, size.height * 0.04, size.width * 0.15,
        size.height * 0.04, size.width * 0.19, size.height * 0.04);
    path.cubicTo(size.width * 0.28, size.height * 0.04, size.width * 0.4,
        size.height * 0.07, size.width * 0.47, size.height * 0.16);
    path.cubicTo(size.width * 0.53, size.height * 0.23, size.width * 0.56,
        size.height * 0.32, size.width * 0.59, size.height * 0.42);
    path.cubicTo(size.width * 0.59, size.height * 0.42, size.width * 0.6,
        size.height * 0.43, size.width * 0.6, size.height * 0.44);
    path.cubicTo(size.width * 0.63, size.height * 0.52, size.width * 0.66,
        size.height * 0.61, size.width * 0.7, size.height * 0.69);
    path.cubicTo(size.width * 0.76, size.height * 0.78, size.width * 0.84,
        size.height * 0.87, size.width * 0.91, size.height * 0.93);
    path.cubicTo(size.width * 0.94, size.height * 0.97, size.width * 0.97,
        size.height, size.width, size.height);
    path.cubicTo(size.width, size.height * 1.02, size.width, size.height * 1.03,
        size.width * 1.02, size.height * 1.03);
    path.cubicTo(size.width * 1.02, size.height * 1.03, size.width * 1.02,
        size.height * 1.03, size.width * 1.02, size.height * 1.03);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
