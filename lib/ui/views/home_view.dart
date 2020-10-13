import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_archi/core/models/user.dart';
import 'package:provider_archi/ui/shared/app_colors.dart';
import 'package:provider_archi/ui/shared/text_styles.dart';
import 'package:provider_archi/ui/widgets/posts.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //var UIHelper;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'Welcome ${Provider.of<User>(context).name}',
              style: headerStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text('Here are all your posts', style: subHeaderStyle),
          ),
          SizedBox(height: 10,),
          Expanded(child: Posts()),
        ],
      ),
    );
  }
}
