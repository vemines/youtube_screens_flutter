import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:get/get.dart';

import '../../../data/models/video_model.dart';
import '../../../data/repositories/video_repository.dart';

class AppSearchController extends GetxController {
  List<String> options = List.generate(
    10,
    (_) => lorem(paragraphs: 1, words: 3),
  );
  RxList<String> searchOptions = <String>[].obs;
  String searchValue = "";
  void search(String searchString) {
    if (searchString == '') {
      searchOptions = <String>[].obs;
    }
    searchOptions.value = options.where((String option) {
      return option.contains(searchString.toLowerCase());
    }).toList();
  }

  RxList<VideoModel> searchResult = <VideoModel>[].obs;
  void searchVideo(String value) {
    searchValue = value;
    searchResult.value = VideoRepository.mock;
    searchOptions = <String>[].obs;
  }
}
