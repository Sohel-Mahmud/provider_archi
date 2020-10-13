import 'package:flutter/material.dart';
import 'package:provider_archi/core/models/comment.dart';
import 'package:provider_archi/core/services/api.dart';

import 'base_view_model.dart';

class CommentsViewModel extends BaseViewModel {
  Api _api;
  CommentsViewModel({@required Api api}) : _api = api;

  List<Comment> comments;

  Future fetchComments(int postId) async {
    setBusy(true);
    comments = await _api.getCommentsForPost(postId);
    setBusy(false);
  }

/*   @override
  void dispose() {
    print('I have been disposed!!');
    super.dispose();
  } */
}