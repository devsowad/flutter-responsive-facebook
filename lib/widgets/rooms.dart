import 'package:flutter/material.dart';
import 'package:responsive_facebook/config/palette.dart';
import 'package:responsive_facebook/models/models.dart';
import 'package:responsive_facebook/widgets/profile_avatar.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUsers;

  const Rooms({Key? key, required this.onlineUsers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Palette.whiteColor,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
        scrollDirection: Axis.horizontal,
        itemCount: 1 + onlineUsers.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: _CreateRoomButton(),
            );
          }
          final User user = onlineUsers[index - 1];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: ProfileAvatar(imageUrl: user.imageUrl),
          );
        },
      ),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  const _CreateRoomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      // style: TextButton.styleFrom(
      //   primary: Colors.white,
      //   // shape: RoundedRectangleBorder(
      //   //   borderRadius: BorderRadius.circular(30),
      //   // ),
      //    shape: OutlinedBorder(side: BorderSide(color: Colors.black,width: 2)),
      //   backgroundColor: Palette.whiteColor,
      // ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: const BorderSide(color: Palette.facebookLightBlue, width: 3),
          ),
        ),
      ),
      child: Row(
        children: [
          ShaderMask(
            shaderCallback: (rect) =>
                Palette.createRoomGradient.createShader(rect),
            child: const Icon(
              Icons.video_call,
              size: 28,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 4),
          const Text(
            'Create\nRoom',
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
