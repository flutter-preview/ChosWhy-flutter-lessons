import 'package:flutter/material.dart';
import 'package:lessonone/202/service/post_model.dart';
import 'package:lessonone/202/service/service_layers/service_post_learn_view.dart';

class DenemeServisi extends StatefulWidget {
  const DenemeServisi({Key? key}) : super(key: key);

  @override
  State<DenemeServisi> createState() => _DenemeServisiState();
}

class _DenemeServisiState extends State<DenemeServisi> {
  late final IPostService postService;
  bool _isLoading = false;
  List<PostModel>? _postItems;

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> fetchPostItems() async {
    _changeLoading();
    _postItems = await postService.fetchPostItemsAdvance();
    _changeLoading();
  }

  @override
  void initState() {
    super.initState();
    postService = PostService();
    fetchPostItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: _postItems?.length ?? 0,
        itemBuilder: (context, index) {
          return _isLoading
              ? const Center(child: CircularProgressIndicator.adaptive())
              : Text("$index.${_postItems?[index].body}" ?? "");
        },
      ),
    );
  }
}
