import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_facebook/config/palette.dart';
import 'package:responsive_facebook/models/models.dart';
import 'package:responsive_facebook/widgets/profile_avatar.dart';
import 'package:responsive_facebook/widgets/rounded_icon_button.dart';

class Stories extends StatelessWidget {
  final User currentUser;
  final List<Story> stories;

  const Stories({
    Key? key,
    required this.currentUser,
    required this.stories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Palette.whiteColor,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 8,
        ),
        itemCount: 1 + stories.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return _StoryCard(
              isCreateStory: true,
              currentUser: currentUser,
            );
          }
          final Story story = stories[index - 1];

          return _StoryCard(story: story);
        },
      ),
    );
  }
}

class _StoryCard extends StatelessWidget {
  final bool isCreateStory;
  final User? currentUser;
  final Story? story;

  const _StoryCard({
    Key? key,
    this.isCreateStory = false,
    this.currentUser,
    this.story,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              imageUrl: isCreateStory ? currentUser!.imageUrl : story!.imageUrl,
              height: double.infinity,
              width: 110,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: double.infinity,
            width: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: Palette.storyGradient,
            ),
          ),
          isCreateStory
              ? Positioned(
                  top: 4,
                  left: 4,
                  child: RoundedIconButton(
                    icon: Icons.add,
                    onPressed: () {},
                    height: 40,
                    iconColor: Palette.facebookBlue,
                  ),
                )
              : Positioned(
                  top: 8,
                  left: 8,
                  child: ProfileAvatar(
                    imageUrl: story!.user.imageUrl,
                    borderWidth: story!.isViewed ? 0 : 3,
                  ),
                ),
          Positioned(
            child: Text(
              isCreateStory ? 'Create a story' : story!.user.name,
              style: const TextStyle(
                color: Colors.white,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            bottom: 8,
            left: 8,
            right: 8,
          ),
        ],
      ),
    );
  }
}
