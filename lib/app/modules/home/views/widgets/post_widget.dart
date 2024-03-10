import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:youtube_screens/app/data/models/post_model.dart';
import '../../../../shared/constants/dimens.dart';
import '../../../../shared/widgets/common.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({
    super.key,
    required this.post,
  });
  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading: Image.asset(post.iconChannel),
          title: Text(
            post.nameChannel + "\n",
            style: context.textTheme.bodyLarge,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          contentPadding: EdgeInsets.zero,
          subtitle: Text(post.getTimeAgo(), style: context.textTheme.bodySmall),
          trailing: IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () => Get.bottomSheet(SizedBox()),
          ),
        ),
        gapS(),
        ReadMoreText(
          post.content,
          trimLines: 2,
          trimMode: TrimMode.Line,
          colorClickableText: context.theme.primaryColor,
          trimCollapsedText: 'Show more',
          trimExpandedText: 'Show less',
          style: context.textTheme.bodyMedium,
        ),
        gapS(),
        Image.asset(post.imageUrl),
        gapS(),
        Padding(
          padding: const EdgeInsets.all(Dimensions.small),
          child: Row(
            children: [
              _ActionButton(
                icon: Icon(Icons.thumb_up_outlined),
                number: post.like,
              ),
              gapL(),
              _ActionButton(
                icon: Icon(Icons.thumb_down_outlined),
                number: post.dislike,
              ),
              Spacer(),
              _ActionButton(
                icon: Icon(Icons.mode_comment_outlined),
                number: post.getTotalComments(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({required this.number, required this.icon});
  final int number;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(icon: icon, onPressed: () {}),
        GestureDetector(
          behavior: HitTestBehavior.opaque, // for onTap work on padding
          child: Container(
            margin: const EdgeInsets.only(left: 5),
            child: Text(
              number == 0 ? '' : '$number',
              style: context.textTheme.bodyMedium,
            ),
          ),
          onTap: () {},
        ),
      ],
    );
  }
}
