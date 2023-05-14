
import 'dart:io';
import 'package:url_launcher/url_launcher.dart';
import 'package:lessonone/202/custom_exception.dart';

abstract class IFileDownload{
  bool? downloadItem({FileItem? fileItem});

  void toShare(String path) async{
    await launchUrl(Uri(path: path));
  }
}

class FileDownload implements IFileDownload {
  @override
  bool? downloadItem({FileItem? fileItem}){
    if(fileItem == null) throw FileDownloadException();//Exception();//null ise exception fırlatıcaz!
    print("işlemi yapıosun");
    return null;
  }

  @override
  void toShare(String path) {
    // TODO: implement toShare
  }
}

class FileItem{
  final String name;
  final File file;

  FileItem(this.name, this.file);

}

class SmsDownload extends IFileDownload with ShareMixin{
  @override
  bool? downloadItem({FileItem? fileItem}) {
    // TODO: implement downloadItem
    throw UnimplementedError();
  }
  //burda oldugu gibi extends in kullanımı!
}

mixin ShareMixin on IFileDownload{
  void tShare(){}
}

///şimdi burda noramlde işte classları yazmayı falan konustuk burda olay artık biraz farklı
///test edilebilir cod yazmayı ilerledikce görcez ama bilmemiz gerekn nokta var o da su:
///uı olmayan eklentileri sen proje uı kısmından ayrı kodlaman gerkeiyor bunu biliyoruz
///ama bunları kodlarken bazı senaryolarda sadece birileri kullansın istedigimizde işler biraz değişiyor nasıl yani işte bu sekilde
///
/// şimdi burda senaryomuz geregi biz bir adet dosyaIndırme olusturuyorsak birde dosya itemi adında bi class olusturruz genelde
/// cünkü item nasıl turde olucak vs bunlar fileDownload clasından farklı şeyler!
/// burda sunu istiyoruz biz fileDownload yapıcak insanlar saddece fileItemdan türüyen insanlar olmalarını istiyoruz
/// yani ne demek istiyoruz (bi tane de view ekranını yapalım) olusturduk işte bu ekrana geldiginde o kısım aktifleşicek
/// ama senaryom geregince sunu istiyorum ben: ya diyorumki okey işte kullanıcılar var ve bu kullanıcıların fileDownloadda
/// oldugunu gösteren bi değişken olur atıyorum o default olarak falsedir işte ben bu view ekranına gelirsem eger o true olur
/// ve bu insan fileItema atıyorum işte bilgileri aktarılır eger bu bilgler aktarılırsa ben bu dosyayı indirebilirim yani
/// fileDownloadı kullanabilirim gibi bir sürec
///
/// okey süreci anladık peki ben bunun nasıl yapıcam yani fileItem tipindeki insanlar nasıl FileDownloadı kullanabilicek sadece bu inasnlar ama
/// işte burda generic karşımıza geliyor onun detayı yine ilerleyen zamanlarda ama burda sunu bilse yeter
/// bunu <T> ŞEKLİNDE de kullanabiliriz veya property olarak FileItem tipinde fileItem alsın ama null olabilir vermeyebilir de
/// dememiz gerekiyor! bu skeilde kullanımları mevcut
///
/// işte burda bu itemin null olup olmadııgına bakıyosun ve null ise exception fırlattırıyorsun eger null degilse de işlemler!
/// peki burda exception içi boş ne yapıcaz? burda artık custom exception kodlamayı görücez!
///
/// okey exception classını olusturdun ama ben bunun olmasını nasıl saglıcam o zaman extends ifadesi var bunu kullanıcaz!
/// kalıtım yapmayı denedigimizde yani extend etmeyi denedigimizde izin vermedi bize flutter o yüzden bizde implament edicez yani var olanı biz
/// şekillendiricez peki extends etseydik ne olurdu o zaman o classın var olan üyelerini kullanabilir veya o üyelerinden ayrı üyeler de
/// yazabilirdik kullanıcagımız classa!
///
/// implament edince işte ana özelliklerini aldım kendime göre kullanıcam!
/// bi custom_exception classına gidelim!
/// geri geldik burdan devam.
///
/// daha sonrasında burda sen bu exceptionu değiştirirsen
///
/// burda istersen geriye bool döndüren bir metod olarak cevirebiliriz ama null olması onemli
/// ve sen en son return null ı da eklemeyi unutma ha normalde flutter da tüm metotlar nullable ise yazmasan da olur default olarak
/// geriye null dönüyor ama sen yine de yaz!
///
/// bak en sonunda deneme yaptıgında exception gözüküyor ve bunu biz kodladık!!!!
///
/// şimdi sen ekranında bi hata oldu exception attı uygulama exception atınca uygulama kitlendi bu da kullanıcıya kötü yansır
/// ve aslında exception atmayı dogru bulmaz yazılımcılar amaa! uygulama gelişim aşamasında ise o zaman exception kullanabilirisn
/// sorunları daha hızlı göreiblmek için!
///
/// şimdi yavas yavas ilerlediğimiz için test edilebilir kodlar yazmaya dogru da gitmemiz gerekiyor
/// yukarıda yazdıgımız fileDowmload classı aslında cok test edilebilir bir class degildir!
/// biz kodlarımızı test edilebilir bir şekilde kodlamak için aslında herşeyi abstract classlarda belirliyoruz olabilicek senaryolara göre
/// ondan implamente ediyoruz classı sonra metotları dolduruyoruz bu daha iyi bi kodlama örnegidir!
/// hadi abstract class yazalım buna
/// sonra metodu ekledikten sonra ana katmanı hazırlamıs oluyoruz!!
///
/// biz yine abstract classın içine bir metot yazabiliriz ama bunu implemente edicegimiz zaman baska bi classta abstract classın
/// içindeki o metot içeriğine birşey olmuyor onu ben bastan baska bi classda yazıyorum!!
/// burda abstract classa bu sekilde metot eklersek aslında su olmus oluyor soyut bi classa somut özellik eklemiş oluyoruz
/// bu aslında pholymorphism yani çok bicimlilik yani bir classı başka classlar implemente ederse hepsi aynı metotları kendisine
/// göre donatıcak
///
/// extends etmek de üst sınıfın tüm özelliklerini alıcam kullanıcam içi doldurulmamıs metotları ben doldurucam ama dolu olanları
/// kullanabilirim şeklinde olucak ve değişkenler varsa abstract class da onları da yine kullanabilirsin
///
///
///       Mixin
///mixinler yine utilityde kullanılıyor yaparken
///sonrasında bir classa güç kaznadırmak için kullanılabiliyor atıyorum metotumuz var ve bu metotu baska clasa entegre edebiliyorsun
///sonrasında belirli başlı durumlar için kullanılabiliyor "on" anahtar kelimesi ile ben mixin su durumda bunu kullansın dedirtebiliyorum
///yukarıdaki mixinde mesela on IFileDownload dediğimde IFıleDownloadtan kalıtım alanlar kullanabilir yani extends edenler
///digerleri kulanamaz ve implement edenler kullanamaz buna dikkat sınırlıyoruz "on" anahtar kelimesi ile
///bunu kullanmamızdaki fayda insanlar kafasına göre bu mixinleri classlarına entegre edemiyor olusu!!!
///
///