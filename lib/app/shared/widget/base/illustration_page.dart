import 'package:credible/app/shared/widget/base/button.dart';
import 'package:credible/app/shared/widget/base/page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BaseIllustrationPage extends StatelessWidget {
  final String asset;
  final String? description;
  final String action;

  final VoidCallback? onPressed;

  final Color backgroundColor;

  const BaseIllustrationPage({
    Key? key,
    required this.asset,
    this.description,
    required this.action,
    this.onPressed,
    this.backgroundColor = Colors.transparent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 1.2,
          color: backgroundColor,
          child: SvgPicture.asset(asset),
        ),
        BasePage(
          scrollView: false,
          backgroundColor: Colors.transparent,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              if (description != null && description!.isNotEmpty)
                Text(
                  description!,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              Expanded(child: Container()),
              BaseButton.white(
                onPressed: onPressed,
                child: Text(action),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
