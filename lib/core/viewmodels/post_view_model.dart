import 'package:flutter/material.dart';
import 'package:provider_archi/core/models/post.dart';
import 'package:provider_archi/core/services/api.dart';

import 'base_view_model.dart';

class PostsViewModel extends BaseViewModel {
  Api _api;

  PostsViewModel({
    @required Api api,
  }) : _api = api;

  List<Post> posts;

  Future getPosts(int userId) async {
    setBusy(true);
    posts = await _api.getPostsForUser(userId);
    setBusy(false);
  }
}
