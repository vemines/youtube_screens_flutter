import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_screens/app/shared/widgets/appbar.dart';

import '../../../../gen/assets.gen.dart';
import '../../../shared/constants/dimens.dart';
import '../../../shared/widgets/common.dart';
import '../controllers/rent_movie_controller.dart';

class RentMovieView extends StatelessWidget {
  const RentMovieView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: AppBarTitleWithSearchAndMore(
          title: "",
          onBack: () => Get.back(),
          moreOnPressed: () {},
          searchOnPressed: () {},
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(Dimensions.normal),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _TitleSection(),
            _ContentSection(),
          ],
        ),
      ),
    );
  }
}

class _ContentSection extends GetView<RentMovieController> {
  const _ContentSection();

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    return Flexible(
      child: Obx(
        () => controller.isLoading.value
            ? centerIndicator()
            : Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.sell, size: 90),
                    Text(
                      "You don’t have any purchases",
                      style: textTheme.headlineSmall,
                    ),
                    Text(
                      "Movies and shows you rent or buy will appear here",
                      style: textTheme.bodySmall!.copyWith(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

class _TitleSection extends StatelessWidget {
  const _TitleSection();

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Assets.png.movie.image(width: 50, height: 50),
        gapN(),
        Text(
          "Movies",
          style: textTheme.displaySmall!.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }
}
