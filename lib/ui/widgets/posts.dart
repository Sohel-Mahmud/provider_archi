import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_archi/core/constants/app_contstants.dart';
import 'package:provider_archi/core/models/user.dart';
import 'package:provider_archi/core/viewmodels/post_view_model.dart';
import 'package:provider_archi/ui/views/base_widget.dart';
import 'package:provider_archi/ui/widgets/postlist_item.dart';

class Posts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<PostsViewModel>(
      model: PostsViewModel(api: Provider.of(context)),
      onModelReady: (model) => model.getPosts(Provider.of<User>(context).id),
      builder: (context, model, child) => model.busy
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: model.posts.length,
              itemBuilder: (context, index) => PostListItem(
                post: model.posts[index],
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RoutePaths.Post,
                    arguments: model.posts[index],
                  );
                },
              ),
            ),
    );
  }
}
