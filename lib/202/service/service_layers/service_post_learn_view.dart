import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:lessonone/202/service/comment_model.dart';
import '../post_model.dart';

abstract class IPostService{
  Future<bool> addItemToService(PostModel postModel);
  Future<bool> putItemToService(PostModel postModel, int id);
  Future<bool> deleteItemToService(int id);
  Future<List<PostModel>?> fetchPostItemsAdvance();
  Future<List<CommentModel>?> fetchRelatedCommentsWithPostId(int postId);
}

class PostService implements IPostService{
  final Dio _networkManager; //_networkManager yazımı bu 2 kod satırı
  PostService() : _networkManager = Dio(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/"));

  @override
  Future<bool> addItemToService(PostModel postModel) async {
    try{
      final response = await _networkManager.post(_PostServicePath.posts.name,data: postModel);
      return response.statusCode == HttpStatus.created; //true false deger döndürmek için
    }
    on DioError catch(error){
      //print(error.message);
      _ShowDebug.showDioError(error,this);
    }
    return false;
  }

  ///knk burda yine post.name ile gidicez ama bi farkla gidicez oda id olucak hangisini upddatelicez bunu bilmiyoruz
  ///bu yuzden id alıyoruz path kısmı:"${_PostServicePath.posts.name}/$id"
  @override
  Future<bool> putItemToService(PostModel postModel, int id) async {
    try{
      final response = await _networkManager.put("${_PostServicePath.posts.name}/$id",data: postModel); //bunun url pathini bu sekilde yazmıs oluyoruz
      return response.statusCode == HttpStatus.ok; ///put olucagı için created degil knk ok yani 200 dönüyo
    }
    on DioError catch(error){
      _ShowDebug.showDioError(error,this);
    }
    return false;
  }

  ///delete daha kolay knk dogrudan postun id sine gidiyoruz data almamıza gerek yok ve o datayı siliyoruz
  @override
  Future<bool> deleteItemToService(int id) async {
    try{
      final response = await _networkManager.put("${_PostServicePath.posts.name}/$id"); //bunun url pathini bu sekilde yazmıs oluyoruz
      return response.statusCode == HttpStatus.ok; ///put olucagı için created degil knk ok yani 200 dönüyo
    }
    on DioError catch(error){
      _ShowDebug.showDioError(error,this);
    }
    return false;
  }

  @override
  Future<List<PostModel>?> fetchPostItemsAdvance() async {
    try{
      final response = await _networkManager.get(_PostServicePath.posts.name);

      if (response.statusCode == HttpStatus.ok) {
        final datas = response.data;

        if (datas is List) {
          return datas.map((e) => PostModel.fromJson(e)).toList(); //bu işlem başarılı ise bunu döndür
        }
      }
    }
    on DioError catch(error){
      //print(error); //print kullanmayı pek tercih edilmemeli ama suanda bi sıkıntı yok
      _ShowDebug.showDioError(error,this);
    }
    return null;
  }

  ///burda fetch ile aynı ama farklı olan kısımları var onu da hemen yapalı
  ///ilk olarak posts degil comment eklicez _PostServicePath.comment.name
  ///birde ekstra olarak orda farklı bişi daha var o da queryParametter dedigimiz bişi var onu ekliyoruz
  ///özel seçici demek yani su kısım : "?postId=15" bunu işte queryParameter saglıyor
  ///queryi ayarladıktan sonra geriye ne döndürücek CommentModel.fromjson ı olucak ve şimdi oldu
  /// ve yine fetch kısmını ilk yaptıgımızdaki enum gibi bunun queryId KISMINI DA bu sekilde yapabiliriz
  @override
  Future<List<CommentModel>?> fetchRelatedCommentsWithPostId(int postId) async {
    try{
      final response = await _networkManager.get(_PostServicePath.comments.name,
        //queryParameters: {"postId":postId} //bunun kullanımı bir map şeklinde key'e göre value alıyor şimdilik bu sekilde olsa yeterli kullanımı
        //ama su sekilde yazıcaz
        queryParameters: {_PostQueryPath.postId.name : postId}
      );

      if (response.statusCode == HttpStatus.ok) {
        final datas = response.data;

        if (datas is List) {
          return datas.map((e) => CommentModel.fromJson(e)).toList();
        }
      }
    }
    on DioError catch(error){
      _ShowDebug.showDioError(error,this);
    }
    return null;
  }

}
enum _PostServicePath{
  posts,comments,
}
enum _PostQueryPath{postId}

class _ShowDebug{
  static void showDioError<T>(DioError error, T type){
    if (kDebugMode) {
      print(error.message);
      print(type);
      print("----");
    }
  }
}

///knk burda artık işte bu kısımları ayırıyorum class neyle alakalı olucaksa onları alıyorum buraya
///mesela _addItemToService metodunu buraya alıcam
///sornasında fetchItemAdvanceyi alıcaz
///işte bunları bu sekilde aldık ama her zaman service testlerimizi yazmamız da gereklidir! bunun nasıl yazılıcagını ilerleyen kısımlarda ögrencez abi
///ama yine de bunu kendimize aşılamamız gerkeiyor 303 de görücez ama burdaki amac biraz hazırlık yapmak
///
/// şimdi su hataları fixleyelim
/// service kısmında changeLoading diye metot olmaz abi buna dikkat!
/// sonrasında service kısmında _alertText ile ilgili bir degişkenle eşitleme olmaz buna da dikkat onu da sildik
/// service kısmında setstate olmamaı knk cunku sen service kısmında ekran güncelleme yapmıyosun! onlar serviceden gelen verilere göre ekranı programcı ekran dosyalarında yapar!
///
/// şimdi bize burda bi _networkManager lazım onu hemen su sekilde ayarlarız: işte gidersin basic seviyede classın içinde tanımlarsın!
/// ve bu sekilde _networkManagerı yazmıs olduk
///
/// peki biz bu metotlarda cıkarmalar yaptık diger sayfaya göre bunun calısma mantıgı nasıl olmalı abi cok karmasık ya off der gibi bi hal var evet
/// o da su sekilde: önce dişarıdan erişilme olucagı için private yapmamlıyız metot isimlerini
/// sornasında statusCodun durumuna göre eklendi eklenmedi kısmını kontrol etmemiz gerekiyor bu yuzden burda bool deger döndürülmesi gerek
///bir diğer nokta alttaki fetch için. şimdi burda liste döndürdüğümüz için list dönmesi gerke ama postModel tipinde ama servisten data gelmeyebilir buna dikkat işte bu kritik nokta bu yuzden nullable
///
/// 202 seviyesi için bunları yapailiyor olmamız gerekiyor
///
/// bi 2.nookta suna dikkat etmemiz gerek:yine mesela burda kullanılan eklentiler var "posts" vs bnları enum içerisinde yazmamız saglıklı olucaktır!
/// bunu yaparak tertemiz kod yazmıs olduk abi
/// suanda 202 seviyesinde bunlar mesela sürekli kendini tekrar eden kısımlar var bunlar suanda bu sekilde olsun sıkıntı yok ilerleyen kısımlarda halledicez
///
/// burdan geri advance dosyasına git
///
/// burda işte service kodlarında try catch i kullanmamız gerekiyor!
/// catch kısmına giricek ama ben burdayken app çökmücek hata aldıgımda calısmaya devam edicek yine!
/// şimdi diger ekrana gidip listView kısmını halledelim advance'de
///
/// knk burda aslında try catch konusu altında catch in basında "on" anahtar kelimesi ile sen aslında errorun tipini belirliyosun aslında error bir object tiptir onu belirliyebiliyosun
/// ornek vericek olursak on DioError catch(error) gibii ve sen en son print(error.message) dersen dio errordaki mesajı almıs oluyosun!
///
/// print kullanıyoruz genelde ama bu print kalıyor ama bu print bu sekilde kalmamsı gerekiyor kdebug modu içinde kullanabilirsin ama bunu heryere yazmamam diyosun buna bi tane
/// class yapıyosun knk ve bi tane metodu olsun diyosun ona koyuyosun
/// bunu bu sekilde kullanmakta fayda var aga
///
///
/// knk yine UPDATE PUT VE DELETE için de aynı sekilde bunu yapabilirsin ne yapıcaksın işte addItemToService gibi bi metot ile çözebilirsin
/// fetch gibi yapmıyosun bunlarda hemen onun metotlarını da yazalım uı tasarımına gerek yok simdilik
///
///
/// yani anlasılıcagı üzere bunu bu sekilde kullanmak bizim için yeterlidir 202 kısımda
/// ya da aklımıza sey getirmeliyiz biz bunu Interface yapabilir miyiz diyoruz yani:
/// -metotları kapatıyım diyoruz ve sadece ınterface üzerinden insanlar bunlara erişsin
/// -bu sayede insanlar kafasına göre metotları kullanamamıs olurlar
/// -neler yapıcaklarına dair bi öncülük etmiş oluruz bunlara göre işlerini yapsın diyip interface yapabiliriz
///interface yaparsak da bizim kod gelişimimizi advance seviyeye dogru itecektir!
///bu interface kısmını yaptıktan sonra biz serviceUı dosyamıza gittigimizde ordaki _postService referansını direkt olarak PostService classından degil
///interface class olan IPostService classından türetmemiz gerekiyor
/// VE EN BÜYÜK AVANTAJI İSE BU INTERFACE SAYESİNDE TEST ETMEYE MÜSAİT KOD OLMUS OLUYOR!!!
/// view ekranında bunu da ayarladıktan sorna geri geldik
///
/// şimdi bir sonraki kısım ise şu postmanda da görüldüğü üzere "get specific post" var onu yapıcaz
/// postmandan baktıgımda burda ekstra olarak email var yine daha önce yaptıgımız gibi googledan json to dart ile hemen classını olusturalım model classını
/// ürettikten sonra gitip burda dosya olusturdun haleettik geri geldik bunu interface kısmına metodunu ekliyelim ekledik sonra metodunu yazalım
///
/// metodu yazdık geldik hadi gel bide view ekranında görelim bunu view dosyasına gidiyoruz
/// Service_learn_view_advance kısmına entegre edicem bunu
///
/// şimdi son trick verelim artık generic diye bişey var şimdilik sadece bu faydasını bilelim
/// biz bunu Su sekilde kullanırsak tüm metotların catch kısmındaki _ShowDebug.showDioError(error); kodu
/// su skeilde kullanmamız gerek _ShowDebug.showDioError<T>(error);
/// bunun anlamı bu bizden bi adet T type alıcak aslında bunun kaynagı T type alıcak yani bu classtaki metot _ShowDebug
/// bu classtaki metot parametre olarak da T tipinde type adında bi parametre alsın "T type"
/// ama bunun ekstra da metottaki print kısmına type parametresindeki değişkeni de basmamız gerekiyor!
/// sonrasında ben bu meotdun kullanıldıgı heryere bu parametre için this kullanırsam bana hatanın nerde oldugunu göstericektir!
/// cıktı örnek olarka:"instance of PostService" şeklinde olabilir!!
///
/// bitti service kısmı!!!
