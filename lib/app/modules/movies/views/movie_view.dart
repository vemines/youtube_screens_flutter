import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../shared/constants/dimens.dart';
import '../../../shared/widgets/common.dart';
import '../../../../gen/assets.gen.dart';

import '../../../shared/extensions/widget_extension.dart';
import '../controllers/movie_controller.dart';

class MovieView extends StatefulWidget {
  const MovieView({super.key});

  @override
  State<MovieView> createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView> {
  final MovieController controller = Get.find<MovieController>();
  @override
  void initState() {
    super.initState();
    controller.loadMovies();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () => Get.back(),
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () => Get.back(),
            icon: Icon(Icons.more_vert),
          ),
        ].separateCenter(),
      ),
      body: Padding(
        padding: EdgeInsets.all(Dimensions.normal),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Assets.png.movie.image(width: 50, height: 50),
                gapN(),
                Text("Movies",
                    style: textTheme.displaySmall!.copyWith(
                      fontWeight: FontWeight.w900,
                    )),
              ],
            ),
            Flexible(
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
            ),
          ],
        ),
      ),
    );
  }
}
