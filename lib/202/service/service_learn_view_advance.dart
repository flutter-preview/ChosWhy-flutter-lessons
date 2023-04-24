import 'package:flutter/material.dart';
import 'package:lessonone/202/service/comment_view.dart';
import 'package:lessonone/202/service/post_model.dart';
import 'package:lessonone/202/service/service_layers/service_post_learn_view.dart';

class ServiceLearnViewAdvance extends StatefulWidget {
  const ServiceLearnViewAdvance({Key? key}) : super(key: key);

  @override
  State<ServiceLearnViewAdvance> createState() => _ServiceLearnViewAdvanceState();
}

class _ServiceLearnViewAdvanceState extends State<ServiceLearnViewAdvance> {
  List<PostModel>? _items;
  bool _isLoading = false;

  //late final PostService _postService;
  /// TEST ETMEYE MÜSAİT KOD OLMUS OLUYOR
  late final IPostService _postService;

  void _changeLoading() {
    _isLoading = !_isLoading;
  }

  Future<void> fetchPostItems() async {
    _changeLoading();
    _items = await _postService.fetchPostItemsAdvance();
    _changeLoading();
    ///bak knk service kısmında bu changeLoading kısımlarını kaldırdım ve sade bir kod yazdım ve bunları view ekranında ekledim
    ///olması gereken kodlama bu sekilde olmalı ve burda _postService refi ile fetchPostItemsAdvance call ettim ve bunu _items a eşitledim
    ///
  }


  @override
  void initState() {
    super.initState();
    _postService = PostService(); //bunu bu sekilde entegre etmen lazım!!
    fetchPostItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          _isLoading
              ? const CircularProgressIndicator.adaptive()
              : const SizedBox.shrink()
        ],
      ),
      body: _items == null
          ? const Placeholder()
          : ListView.builder(
         itemCount: _items?.length ?? 0,
            itemBuilder: (context, index) {
                 return _PostCard(model: _items?[index]);
          },)
      ,
    );
  }
}

class _PostCard extends StatelessWidget {
  const _PostCard({
    required PostModel? model,
  }) : _model = model;

  final PostModel? _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: (){

          Navigator.of(context).push(MaterialPageRoute(builder: (context) => CommentViewLearn(postId: _model?.id),)); ///bu entegre kısmı comment_view dosyası içindir!

        },
        title: Text(_model?.title ?? ""),
        subtitle: Text(_model?.body ?? ""),
      ),
    );
  }
}

///şimdi daha iyi nasıl service yazılır ona bakalım
///genel olarak mobilde ayrı ayrı service katmanları vardır bunları yönetmemiz gerekir
///bizim her zaman service testlerini yapmamız lazım aama bunları ilerleyen kısımlarda görcez
///yani aslında burda sunu yapıyoruz ayrı ayrı service katmanlarında ayırıyoruz kodları
///işte post classı acıp ve dosyası o işlemleri oraya vs vs o zaman bi service katman dosyası olusturuyum karısmasın
///şimdi postService ye gidek
///
/// şimdi buraya geldik
/// knk burda bi önemli nokta var bu su: Bir view dosyasında aslında işte sunu ata bunu ata gibi kullanımlar pek olmaması gerekiyor sadece referansını belirle geç
/// yukarıda artık postServideden bi referans alıcam ve bunu eklicem bu dosyaya
///
/// fetchPostItems kısmına gel
/// geldim fetchten simdi bu sayfayı bi call edelim görelim
/// bak mesela suadna ekran crash verdi ilerlemiyor cunku bi yerde hata var bunu debug ile çözebilirsin veya direkt olarak
/// service kodlarını try catch kullanarak da yapabilirsin onlara bkalaım
///
/// şimdi de burda biz items in durumu kontrol ederek ekranda gösterilecek olan widgetları kontrol ediyoruz null sa placeholder degilse _PostCard dönsün diyorz
///
/// buraya comment kısmı entegre edilicek