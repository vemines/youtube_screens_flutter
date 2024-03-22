import 'package:flutter/material.dart';
import 'package:youtube_screens/app/shared/constants/dimens.dart';
import 'package:youtube_screens/app/shared/widgets/common.dart';

class AppBarTitleWithSearchAndMore extends StatelessWidget {
  const AppBarTitleWithSearchAndMore({
    super.key,
    this.firstActionIconButton,
    required this.title,
    required this.onBack,
    required this.searchOnPressed,
    required this.moreOnPressed,
  });
  final String title;
  final Function() onBack;
  final Function() searchOnPressed;
  final Function() moreOnPressed;
  final Widget? firstActionIconButton;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: onBack,
        icon: Icon(Icons.arrow_back),
      ),
      title: title.isEmpty ? SizedBox() : Text(title),
      actions: [
        firstActionIconButton != null
            ? Padding(
                padding: const EdgeInsets.only(right: Dimensions.normal),
                child: firstActionIconButton,
              )
            : SizedBox(),
        IconButton(
          onPressed: searchOnPressed,
          icon: Icon(Icons.search),
        ),
        gapN(),
        IconButton(
          onPressed: moreOnPressed,
          icon: Icon(Icons.more_vert),
        ),
      ],
    );
  }
}

class AppBarTitleLeadingBack extends StatelessWidget {
  const AppBarTitleLeadingBack({
    super.key,
    required this.title,
    required this.onBack,
  });
  final String title;
  final Function() onBack;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: onBack,
        icon: Icon(Icons.arrow_back),
      ),
      title: Text(title),
    );
  }
}

class AppBarTitleActionBack extends StatelessWidget {
  const AppBarTitleActionBack({
    super.key,
    required this.title,
    required this.onBack,
  });
  final String title;
  final Function() onBack;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(title),
      actions: [
        IconButton(
          onPressed: onBack,
          icon: Icon(Icons.close_outlined),
        ),
      ],
    );
  }
}
