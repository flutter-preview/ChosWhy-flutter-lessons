import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lessonone/202/service/post_model.dart';

class ServiceLearn extends StatefulWidget {
  const ServiceLearn({Key? key}) : super(key: key);

  @override
  State<ServiceLearn> createState() => _ServiceLearnState();
}

class _ServiceLearnState extends State<ServiceLearn> {
  List<PostModel>? _items;
  bool _isLoading = false;
  String _alertText = "";
  late final Dio _networkManager;
  final String _baseUrl = "https://jsonplaceholder.typicode.com/";
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  final TextEditingController _userIdController = TextEditingController();

  void _changeLoading() {
    _isLoading = !_isLoading;
  }
  
  Future<void> _addItemToService(PostModel postModel) async {
    _changeLoading();
    final response = await _networkManager.post("$_baseUrl+posts",data: postModel);
    //bu kod dioda servise data göndermede işe yarar
    //bunu ister geriye deger döndürmeli yapabilirsin istersende yapmazsın ama hani başarılı oldugunu göstermek için bişiler yapalım
    if(response.statusCode == HttpStatus.created){ //bu created 201 nolu kod
      _alertText = "Başarılı!";
    }
    _changeLoading(); //bunları vermeyi unutma cünkü servise istek atarken zaman degişkendir bundan dolayı bunlar hep olmalı
    //ve su kodu hep yaz textButtona gidip servisimiz isloading sırasında mı degil mi kontrolu
  }

  Future<void> fetchPostItems() async {
    //fetch = gidip getirmek demek

    _changeLoading();
    /*setState(() {
      _isLoading = true;
    });*/

    final response = await Dio().get(
        "https://jsonplaceholder.typicode.com/posts"); //temel suanda basic seviyede bu sekilde yazsak yeterli
    //burda Dio().get(path) diyor burda işte path yerine benim postmandaki url imi almam gerekiyor onu alıyorum ve ekliyorum
    //şimdi aga burda getin içerisinde bir future yani asenkron bir cevap dönücektir genericleri ilerleyen kısımlarda anlatcaz!
    //o zaman bunu bi degiskene atayıp su sekilde kodluyoruz sonrasında awaiti ekleyip kodu düzeltmeye aldıgımızda degiişik şeyler olcak
    //await ne demek: sen bu kod satırını bekle abi o işlem biteseye kadar ve alt satırlara geçme.bu işlem bittikten sonra devam edebilirsin anlamında

    //print(response);
    //peki bunu nasıl cagırıcaz tabi proje basladıgında initState içeriisnde cagırıcaz
    //okey data gelimş abi
    //dataları gördük bundan sonra ne yapıcaz dataları görmek için
    ///abi ilk olarak response'nin statusCoduna bakmamız gerkeiyor kesinlikle
    if (response.statusCode == HttpStatus.ok) {
      //burdaki httpStatus.ok yani bu response işlemi başarılı mı buna bakıyor
      final _datas = response.data; //dikkat responsun içindeki data dynamic!
      // sonrasunda bu _datas. dedigimde bişey göremem ama sunu yazarsam eger
      if (_datas is List) {
        //işte buraya düşerse kodun okuması o zaman listenin bütün özelliklerini görebilirim
        //_datas.
        //işte bu if sayesinde datanın generic olarak ne oldugunu anlamıs oluyorum
        //bu adımdan sonra sunu yapıcaz
        //burda aslında maplama işlemi yaoıyorum yani yeni bir nesne üretiyoruz yeni bir liste yapıyoruz da denebilir
        //peki nasıl bi liste yapıyoruz biz _itemsin tipinde yeni bir liste yapıyoruz bu da PostModele gidiyor ordan .fromJson diyerek
        //bu "e" yi veriyorum ardından .toList ile de bitiriyoruz bu sekilde _items tipinde yeni bi list olusturmus oluyorum
        //_items = _datas.map((e) => PostModel.fromJson(e)).toList();
        //ardından setstate ile de verileri ekranımızda güncelliyoruz!
        setState(() {
          _items = _datas.map((e) => PostModel.fromJson(e)).toList();
        });
        //bu işlemlerden sonra yeniden calıstırınca "datalra" geliyor ekrana
        ///dikkat httpStatus.ok için uygun import "dart.io"dur
        /// burda bilmemiz gerekn işte initState içerisinden cagırıp da yine yapabilicegimizdir!
        ///
        /// peki şimdi ben sağ üstte knk loading process istiyorum bunu nasıl yaparız su sekilde
        /// bi tane bool degiskne tanımlıyorum bu fonksiyonnu en basına ve en sonuna setState içerisinde bunu true false yapıyorum
        /// sonucta ilerlemez cunku asenkron bir fonskiyon abi

        /*setState(() {
          _isLoading = false;
        });*/
        //bu sekilde koyucam sonra da o widgetı da appbar kısmına ekleyince olucak
        //şimdi bu sekilde okey yapılabilir ama abi bu kod cok yanlıs bi kod? ehehe
        ///sen bunu bi fonksiyona atayıp her girişte degerinin diger degerini atarsın yani _isLoading = !_isLoading
        ///sonra fonksiyonu cagırırsın 2 yerde
        _changeLoading();

        ///alt satıra geri gidiyoruz
      }
    }
  }

  ///bu fonksiyondan devam knk bu 2.metot
  ///şimdi ben her bir request için bir dio olusturmam dogru bi hareket degil network requestlerim
  ///1 tane instance'den olusturmam gerekiyor ve bunların bi kere türemesi lazım
  ///yani bu sayfa acılıyorken benim bi tane dio instancem olucak!
  ///bu instanceyi ben assagıda yüzde yüz kullanıcagım için late eklicem
  ///şimdi bu instanceyi initState içerisinde atarken dio nun option parametresi var onu BaseOption atıyabiliyosunuz ve onunda baseUrl propertysi var ona da url
  ///kısmını veriyosunuz
  ///ve buraya işte birçok farklı endpoint verilmez url için standart 1 tane url verilir
  ///ve baseUrl ide final sekilde yukarıda degisken tipinde tutarsın
  ///ve artık bu advanceye gittigimde Dio() degil _networkManager i veriyoruz
  ///şimdi ise en alta gidelim
  Future<void> fetchPostItemsAdvance() async {
    _changeLoading();
    //final response = await Dio().get("https://jsonplaceholder.typicode.com/posts");
    final response =
        await _networkManager.get("$_baseUrl/posts"); //bu skeilde kullanıyoruz

    if (response.statusCode == HttpStatus.ok) {
      final _datas = response.data;

      if (_datas is List) {
        setState(() {
          _items = _datas.map((e) => PostModel.fromJson(e)).toList();
        });
        _changeLoading();
      }
    }
  }

  @override
  void initState() {
    super.initState();
    fetchPostItems();

    ///unutma init state içerisinde await diyemeyiz bu bir constructer bi nevi bu calısır vee biter ama dikkat et bu initState 1 kez calısır hayatı boyunca!
    _networkManager =
        Dio(BaseOptions(baseUrl: _baseUrl)); //bunu bu sekilde veriosundur
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
      body: Column(
        children: [
          TextField(
            keyboardType: TextInputType.text,
            controller: _titleController,
            decoration: InputDecoration(labelText: "Title"),
            textInputAction: TextInputAction.next, //alttaki fielda tıklamadan geçmesini saglıcak kısım
          ),
          TextField(
            textInputAction: TextInputAction.next,
            controller: _bodyController,
            decoration: InputDecoration(labelText: "Body"),
          ),
          TextField(
            controller: _userIdController,
            keyboardType: TextInputType.number,
            autofillHints: [AutofillHints.creditCardNumber], ///krefi kartu numaraları girme şeysi
            decoration: InputDecoration(labelText: "UserId"),
          ),
          //textInputtype ını number yaptım
          TextButton(onPressed: _isLoading ? null : () { //bu kodda isloadingdeyse hiçbişey yapma degilse bu kodu yap tabi bunun farklı yöntemleri de var ama en pratik yöntem budur bu olmazsa olmazdır bu arada!!!
            if(_titleController.text.isNotEmpty && _bodyController.text.isNotEmpty && _userIdController.text.isNotEmpty){
              final PostModel model = PostModel(body: _bodyController.text,title: _titleController.text,userId: int.tryParse(_userIdController.text), id: null);
              _addItemToService(model); //vee yukarıdaki sorguyu yaptıktan sonra da bu metodu ekliyoruz buraya
            }
          }, child: Text("Send")),
        ],
      ),
      /*
        ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10),
        itemCount: _items?.length ?? 0, //length null ise burda sınırsız gösteriyor bu yuzden bunu ekle ?? 0 yapman gerek
        itemBuilder: (context, index) {
        return _PostCard(model: _items?[index],);
      },),
         */
    );
  }
}

///knk burda liste tanımlayıp bu listeyi bu sekilde almıs buna gerek yok su sekilde yap
///biz liste degil post model yollasak buraya daha iyi
///bunu list yerine bu skeilde kullandıgımızda late atmamıza da gerek kalmıyor model tiplerinde vardı
class _PostCard extends StatelessWidget {
  const _PostCard({
    super.key,
    required PostModel? model,
  }) : _model = model;

  final PostModel? _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        title: Text(_model?.title ?? ""),
        subtitle: Text(_model?.body ?? ""),
      ),
    );
  }
}

///servislerde önemli nokta dataların parse edilmesi ve app da gösterilmesidir!
///işte temel mantık servis entegrasyonlarını bağlamalarını yapmak
///şimdi bir problem var servis okey ama istegini nasıl atıcaz bunda flutter yardım ediyor ama paket kullanıcaz biz bu durumda
///http paketi! ve dio paketi var, dio paketi daha büyük ve kompleks işlemleri yapabiliyor!
///
/// şimdi ise postmanı bağlamak için dio yu kullanıcaz aga
/// işte daha öncesinde calıstıgımız model olusturmalar ile de entegre edicez aslında!
///
/// şimdii müşteri benden önce datalarını görmemi ister bu yuzden postmanda posts itemsa gidip orada
/// send butonuna basarak görüyorum dataları
/// şimdi biizm burdaki verileri üretmemiz gerek yani modellememiz gerekiyor
/// bunu postmanda bu veriler mapdir ordan da o sekilde alabiliriz ama bunun için daha kullanısllı bi ifade var
/// bu da "json to dart"dır bunu google ye yazıp oraya gidiyoruz
/// model olarak bir nesneyi verebilirsin ekrandakine
/// alt tarafa da modelin adını yazıyoruz bu model adı bizim classımız olucak aslında sonra generate
/// dedigimizde bu site bize kendisi otomatik olarak classı olusturucaktır! sonra onu copy dedigimizde gelip
/// sonra post_model.dart dosyanıza yapıstırıyosunuz
///
/// geri geldik viewe
///
///şimdi bana servisten data gelicek listviewda gösteriyoruz bunu cünkü sıralı liste halinde gelicek
///şimdi birinci kural su sadece bu sayfa kullanıcaksa private yapman lazım bu listeyi ve şöyle bişi var
///bu liste basta datası olmayabilir yani null olabilir nullable atıyorum
///
/// ardından ben bir tane request istek atıcam datalarımı çekicem abi okey
/// burda fetch metoduna git
///
/// burdan devam
/// ee şimdi gelen dataları görelim
/// ListTile texte gidip sunları yazdık://items içerisindeki indexdeki title i al boş ise null göster dedik
/// widgetı ayarladık datalarla aga ee en son da işte düzgün temiz kodlama ayarlarına geldi onları ayarlıyoruz
///
/// ilk etapda widget olarak cıkardık sorna da düzenlemelerini yapıyoruz
/// widget düzenlemesini yaptık ve bu ayarları her zaman yapmalıyız temizlemeleri falan
///
/// şimdi bunları başlangıc etapında bu sekilde yapmamız okey ama şimdi ilerleyen kısımlarına bakalım
/// 2.Fetch metoduna gidelim
///
/// metottan geri geldik
/// şimdi abi biz burda listview degil form validasyonu yapıcaz aslında
/// şimdi servise data göndermek için textfield kullanıcaz abi
/// createPost daki anahtar kelimelere göre ekleme yapıyoruz
/// 3 adet ekledik cünkü creatte 3 adet eleman var
/// ve en son button ekledik ama textField kullanırken controller kullanalım
///
/// şimdi kullanıcı burdaki formu doldurduktan sonra send butonuna basıp verileri yollaması gerek
/// ama bu verileri göndermeden önce verilerin kontrollerini burda yapıyor olmamız gerekiyor bu önemli
/// int.tryParse(_userIdController.text) bu kod sayesinde burdaki veriyi inte cevirebildik yani int.tryParse ile bir veriyi inte çevirebilirsin
/// koşul bitti içini de doldurduk ama sen diyosunki ben bu veriyi servisime yollamak istiyorum o zaman bi tane metot olusturuyosun o metodu burda çagırıyosun abi
/// addItemToService metoduna yazıom
///
/// şimdi addItem metoundan sonra buaraya geldik aslında dio paketi bizim olusturdugumuz json metotlarını kullanıyor!
/// bu metotlar arkaplanda kullnaılıyor hadi data eklemeyi deniyelim
///
/// aslında burda işte temel mantıgı anlamıs olduk bir nevi!
/// bunları adım adım sırala bir tekrar yapıcagın zaman!!!
///
/// şimdi aslında bu 202 görünümlü bi kod ama bunu daha iyi yazabiliriz buna bakalım simdi!