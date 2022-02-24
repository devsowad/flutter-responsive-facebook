import 'package:flutter/material.dart';
import '../models/models.dart';
import 'widgets.dart';

class UserCard extends StatelessWidget {
  final User user;

  const UserCard({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ProfileAvatar(imageUrl: user.imageUrl),
        const SizedBox(width: 6),
        Flexible(
          child: SelectableText(
            user.name,
            maxLines: 1,
            style: const TextStyle(
              fontSize: 16,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}
