import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_archi/core/models/post.dart';
import 'package:provider_archi/core/models/user.dart';
import 'package:provider_archi/ui/shared/app_colors.dart';
import 'package:provider_archi/ui/shared/text_styles.dart';
import 'package:provider_archi/ui/widgets/comments.dart';

class PostView extends StatelessWidget {
  final Post post;
  const PostView({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 40),
            Text(post.title, style: headerStyle),
            Text(
              'by ${Provider.of<User>(context).name}',
              style: TextStyle(fontSize: 9.0),
            ),
            SizedBox(height: 10),
            Text(post.body),
            Comments(post.id)
          ],
        ),
      ),
    );
  }
}
