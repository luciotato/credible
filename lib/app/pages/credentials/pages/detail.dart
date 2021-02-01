import 'package:credible/app/pages/credentials/models/credential.dart';
import 'package:credible/app/pages/credentials/widget/document.dart';
import 'package:credible/app/shared/palette.dart';
import 'package:credible/app/shared/widget/back_leading_button.dart';
import 'package:credible/app/shared/widget/base/button.dart';
import 'package:credible/app/shared/widget/base/page.dart';
import 'package:credible/app/shared/widget/navigation_bar.dart';
import 'package:credible/localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CredentialsDetail extends StatefulWidget {
  final CredentialModel item;

  const CredentialsDetail({
    Key key,
    @required this.item,
  }) : super(key: key);

  @override
  _CredentialsDetailState createState() => _CredentialsDetailState();
}

class _CredentialsDetailState extends State<CredentialsDetail> {
  bool showShareMenu = false;

  @override
  Widget build(BuildContext context) {
    // TODO: Add proper localization
    final localizations = AppLocalizations.of(context);

    return BasePage(
      title: widget.item.issuer,
      titleTag: 'credential/${widget.item.id}/issuer',
      titleLeading: BackLeadingButton(),
      navigation: CustomNavBar(index: 0),
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: DocumentWidget(
                item: widget.item,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Tooltip(
                message: localizations.credentialDetailShare,
                child: BaseButton.transparent(
                  borderColor: Palette.blue,
                  onPressed: () {
                    Modular.to.pushNamed(
                      '/qr-code/display',
                      arguments: widget.item.id,
                    );
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SvgPicture.asset(
                        'assets/icon/qr-code.svg',
                        width: 24.0,
                        height: 24.0,
                        color: Palette.blue,
                      ),
                      const SizedBox(width: 16.0),
                      Text(
                        localizations.credentialDetailShare,
                        style: Theme.of(context)
                            .textTheme
                            .button
                            .apply(color: Palette.blue),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 64.0),
            FlatButton(
              padding: const EdgeInsets.symmetric(
                horizontal: 32.0,
                vertical: 16.0,
              ),
              onPressed: () {},
              child: Text(
                localizations.credentialDetailDelete,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .apply(color: Palette.greenGrey),
              ),
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
