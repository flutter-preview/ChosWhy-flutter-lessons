///galiba geçici json verileri elde etmek için json place yazıp ilk siteye girip aşşagıda
///post yazan linke tıklıyosun ve karsına geçici veri geliyor! burası servistir!
///musteri dicekki sen bana bunları modelle diycek peki modelleme nedir?

///sınıfın ismi neymiş postmuş okey postModel olsun
///şimdi ben bu servise baktıgımda ne görüyorum userId,id,title,body o zaman bunları almam gerekiyor
///ama sunu da görüyorum bana ne döndürüyor sayfanın genel parantezi array(list) buna dikkat
class PostModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  ///initialze ne demek; yukarıdaki degerler dolacak mı nasıl dolacak degerleri neler olacak
  ///senin baan bunları vermen gerkeiyor diyor dart bu yuzden bunlara final koyuyoruz ve 3 farklı yöntemle bunlara deger
  ///aldırıyoruz!
}

class PostModel2 {
  int userId;
  int id;
  String title;
  String body;

  PostModel2(this.title, this.body, this.id, this.userId);
}

class PostModel3 {
  final int userId;
  final int id;
  final String title;
  final String body;

  PostModel3(this.userId, this.id, this.title, this.body);
}

class PostModel4 {
  final int userId;
  final int id;
  final String title;
  final String body;

  PostModel4({required this.userId, required this.id, required this.title, required this.body});
}

class PostModel5 {
  late final int _userId;
  late final int _id;

  int get userId => _userId;
  late final String _title;
  late final String _body;

  set userId(int value) {
    _userId = value;
  }
  set id(int value) {
    _id = value;
  }

  set title(String value) {
    _title = value;
  }

  set body(String value) {
    _body = value;
  }



  PostModel5(
      {required int userId,
      required int id,
      required String body,
      required String title})
      : _body = body,
        _title = title,
        _userId = userId,
        _id = id;

  int get id => _id;

  String get title => _title;

  String get body => _body;
}

class PostModel6 {
  late final int _userId;
  late final int _id;
  late final String _title;
  late final String _body;

  PostModel6(
      {required int userId,
      required int id,
      required String body,
      required String title}) {
    _title = title;
    _id = id;
    _userId = userId;
    _body = body;
  }
}

class PostModel7 {
  late final int _userId;

  int get userId => _userId;
  late final int _id;
  late final String _title;
  late final String _body;

  PostModel7(
      {int userId = 0, int id = 0, String body = "", String title = ""}) {
    _title = title;
    _id = id;
    _userId = userId;
    _body = body;
  }

  int get id => _id;

  String get title => _title;

  String get body => _body;
}

class PostModel8 {
  final int? userId;
  final int? id;
  String? title;
  String? body;

  void updateTitle(String value){
    if(value != null && value.isNotEmpty){
      title = value;
    }
  }

  void updateBody(String? data){
    ///model_learn_view line68 ->
    ///burda check etmek diyoruz yani kontrol etmek datanın olup olmadıgını!
    ///en dogru check etme yöntemi null ve isnotempty in beraber kullanılmasıdır! sadece teki kullanılıması dogru degildir!
    if(data != null && data.isNotEmpty){
      body = data;
    }
    //data!.length; bu kullanım kesinlikle dogru bi kullanım degildir burda kodu forclamıs oluyoruz
    //data?.length; burda ise null olabiliri işaret ediyoruz bu datanın ona göre length işlemini yap diyoruz

  }

  PostModel8({this.title,this.body,this.id,this.userId});

  ///copyWith metodu olusturmak
  PostModel8 copyWith({int? userId, int? id, String? title, String? body}) {
    return PostModel8(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }
}

class OrnekClassCopyWith{
  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  OrnekClassCopyWith({this.userId, this.id, this.title, this.body});

  OrnekClassCopyWith copyWith({int? userId,int? id,String? title,String? body}){
    return OrnekClassCopyWith(
      userId: userId ?? this.userId,
      body: body ?? this.body,
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }
}


///birinci yöntemde sadece tipi ve ismini verip null olabilir diyoruz ve kurtuluyoruz
///ikinci yöntem ise constructer ile bunlar gelicek diyoruz!
///üçüncü yöntemde ise sadece constructer ile bu datalar gelebilir ve initialize edilebilir öbür türlü bu datalar gelemez
///dördüncü yöntem ise named parametre alarak cagrılma!
///beşinci yöntem ise siz datayı alıyosunuz ama bu datanın bulundugu değişkeni müşteriye vermiyosunuz metotlarla verebilirsiniz ama o asıl data değişkenini vermiyosunuz!
///altıncı yöntemde ise late kavramı geliyor:sonradan atanıcak anlamı verir ama sadece constructer zamanı deger atayabilirsin öbür zmanada hata verir
///yedinci yöntem ise default deger atıyosunuz buda baska bir yöntem işte
///sekizinci yöntem daha cok servislerden data alırkenki kullandıgımız bir model yöntemidir! null gelebilir yaparak required kelimesinden de kurtulmus oluyoruz!
