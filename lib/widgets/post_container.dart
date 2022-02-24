import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../config/palette.dart';
import '../models/models.dart';
import 'profile_avatar.dart';
import 'responsive.dart';
import 'rounded_icon_button.dart';

class PostContainer extends StatelessWidget {
  final Post post;

  const PostContainer({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);

    return Card(
      margin: EdgeInsets.symmetric(
        vertical: 5,
        horizontal: isDesktop ? 5 : 0,
      ),
      elevation: isDesktop ? 1 : 0,
      shape: isDesktop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
          : null,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        color: Palette.whiteColor,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _PostHeader(post: post),
                  const SizedBox(height: 4),
                  SelectableText(post.caption),
                  post.imageUrl != null
                      ? const SizedBox.shrink()
                      : const SizedBox(height: 6),
                ],
              ),
            ),
            post.imageUrl != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: CachedNetworkImage(imageUrl: post.imageUrl!),
                  )
                : const SizedBox.shrink(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: _PostStats(post: post),
            ),
          ],
        ),
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;

  const _PostHeader({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(imageUrl: post.user.imageUrl),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectableText(
                post.user.name,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  SelectableText(
                    '${post.timeAgo} · ',
                    style: const TextStyle(
                      color: Palette.darkGreyColor,
                      fontSize: 12,
                    ),
                  ),
                  const Icon(
                    Icons.public,
                    color: Palette.darkGreyColor,
                    size: 12,
                  ),
                ],
              ),
            ],
          ),
        ),
        RoundedIconButton(
          icon: Icons.more_horiz,
          onPressed: () {},
          height: 40,
          width: 40,
          iconSize: 25,
        ),
      ],
    );
  }
}

class _PostStats extends StatelessWidget {
  final Post post;

  const _PostStats({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Palette.facebookBlue,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.thumb_up,
                size: 10,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 4),
            SelectableText(
              post.likes.toString(),
              style: const TextStyle(color: Palette.darkGreyColor),
            ),
            const Spacer(),
            SelectableText(
              '${post.comments} Comments',
              style: const TextStyle(color: Palette.darkGreyColor),
            ),
            const SizedBox(width: 8),
            SelectableText(
              '${post.shares} Shares',
              style: const TextStyle(color: Palette.darkGreyColor),
            ),
          ],
        ),
        const Divider(),
        Row(
          children: [
            _PostButton(
              icon: const Icon(
                MdiIcons.thumbUpOutline,
                color: Palette.darkGreyColor,
                size: 20,
              ),
              label: 'Like',
              onPressed: () {},
            ),
            _PostButton(
              icon: const Icon(
                MdiIcons.commentOutline,
                color: Palette.darkGreyColor,
                size: 20,
              ),
              label: 'Comment',
              onPressed: () {},
            ),
            _PostButton(
              icon: const Icon(
                MdiIcons.shareOutline,
                color: Palette.darkGreyColor,
                size: 25,
              ),
              label: 'Share',
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}

class _PostButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final void Function() onPressed;

  const _PostButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: onPressed,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            height: 25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                const SizedBox(width: 4),
                Text(label),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
