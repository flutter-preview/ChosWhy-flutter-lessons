import 'package:flutter/material.dart';
import 'package:lessonone/202/service/service_layers/service_post_learn_view.dart';
import 'comment_model.dart';

class CommentViewLearn extends StatefulWidget {
  const CommentViewLearn({Key? key, this.postId}) : super(key: key);
  final int? postId;

  @override
  State<CommentViewLearn> createState() => _CommentViewLearnState();
}

class _CommentViewLearnState extends State<CommentViewLearn> {
  late final IPostService postService;
  bool _isLoading = false;
  List<CommentModel>? _commentItem;

  void _changeLoading(){
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> fetchItemsWithId(int postId) async {
    _changeLoading();
    _commentItem = await postService.fetchRelatedCommentsWithPostId(postId);
    _changeLoading();
  }

  @override
  void initState() {
    super.initState();
    postService = PostService();
    fetchItemsWithId(widget.postId ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: _commentItem?.length ?? 0,
        itemBuilder: (context, index) {
        return Card(
          child: Text(_commentItem?[index].email ?? ""),
        );
      },),
    );
  }
}


///buraya geldik şimdi ben bi istek mi atıcam o zaman sınıfımı biliyorum zaten init vs entegrelerini reflerin entegrelerini yaptık
///şimdi biz id yi parametre olarak alıyoruz peki bu id nerden geliyor tıklanmıs carddan geliyor knk o zaman ona göre bu sayfaya gelicek adam postId sini yollasın abi
///fetchItemsWithId bu metotta yine napıyoruz changeLoadingleri call ediyoruz
///ardından bizim burda bi adet listemiz olucak
///bunu bu sekilde güzelce entegre etmiş olduk
///sonra proje baslarken bunu initState içeirisnde metodu veriyoruz
///
/// en sonunda entegre ve örnek bi kullanım da mevcut olmus oldu
/// peki bunu nasıl kullanıcaz diger bir widgetta atıyorum detail navigasyonu varsa meselaa o kısma navigate ile bu kısma geldirebiliriz!
/// bu kısmı da entegre edelim o zaman