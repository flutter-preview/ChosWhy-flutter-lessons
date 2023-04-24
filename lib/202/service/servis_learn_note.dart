
///             Bu kısımda servis nedir bunu görcez
///şimdi bir uygulamamız var ve bu uygulamada form alanı var bu müşteri geldi bu formu doldurdu ve en son
///save e bastı ve kaydetti şimdi bu butona bastıkdan sonra 2 durum var
///1.durum:bu verileri sadece kullanıcı telefon içinde kaydetmek var(offline)
///2.durum:bu verileri database de tutma ve database üzerinden haberleşmeyi saglıcak durum vardır(online)
///işte mobilin web ile ayrıldıgı nokta bu webde offline olmaz hiçbirşey mobilde offline mevcuttur
///işte bizim bu kısımda giricegimizz konu online!!!
///
/// burda su sekilde işliyor durum işte verileri uygulamadan doldurdun ve sonra butana bastın
/// butona bastıktan sonra bu online bir databaseye kaydediliyor bu database bir cihaz da olabilir web sitesi de olabilir buraya kaydediliyor
/// yani mobilde atıyorum kaydettiğiniz verileri web uygulamasında da görebilirsiniz bu sekilde
///
/// bir mobil uygulamanın en önemli kısımları aslında burasıdır ne kadar güçlü olursa temiz güzel yazılırsa o kadar entegre kodlar yazılabilir!
///
/// şimdi uygulamada bir field var data veya ekranımız olabilir bu işlemler nasıl calısır?
/// 1.etap:uygulama acılır ve ekranda bir loading bar gözükür
/// 2.etap:internet işlemleri vs başarılıysa ekranda datalar gözükür
/// 1,5.etap:bu etap aslında 1. ile 2. nin arasında bi etapdır yani loading bar ekranı gözükür ama
/// dataların gelmedigi kısımda not found yani bi error ile karşılaşılır
/// bu kısımlar temel noktalar bunları iyi bilmemiz gerekmektedir!
///
/// şimdi müşteri diyorki bizde bi atıyorum mongo db var buna dogrudan erişebilir misin dediğinide biz aslında erşiebiliriz
/// ama hayır dememiz gerkeiyor cunku hiçbir kontrol vs olmadan direkt oraya erişmemiz demek bizim verilerimizi dogrudan hacklemek demektir
/// işte bu durum buna sebep oluyor!
/// burda senin bana servis veya api vermen lazım dememiz gerkeiyor!(api ne abi=bir nevi servis olarak düşünülebilir!)
///
/// ben direkt databaseye erişmek iştemem sen bana katman ver bunla erişelim teklifini saglıyor servisler!
/// bu kısımları anladıysak eger sıkıntı yok
///
/// işte burdan sonra state managment diye bi kavram geliyor karşımıza ve burda birtakım ekstra degişiklikler yapıyoruz
/// bu değişikliklere göre de lifecycle dedigimiz işlemleri dogru düzgün gerçekleştirmemiz gerekiyor!
///
/// peki arkaplanda nasıl işlemler oluyor! json placeholder diye fake apilerin oldugu yerler var burdan fake apilerle işlemlerimizin dogru olup olmadıgını kontrol ederek
/// kodumuzu yazabiliyoruz!(trick= json viewer chromu kurarsanız bu json placeholderı sekilli şukulllu gösteriyor :) )
/// işte servislerin gelme tarzı bu sekilde olucaktır o açtıgımız json placeholderdaki şey gibi
///
/// servisler nasıl kullanılırı da konusmamız gerekiyor:
/// 1=> direkt olarak link üzeirnden gidiyorsak bu bir "get services" dir
///
/// yani servisler 4  farklışekilde incelenir abi
/// 1=> get requestler
/// 2=> post requestler
/// 3=> delete request
/// 4=> put requestlerimiz
/// mobilde bunlar yeterli olur aslında
/// servis olarak bizim karşımıza bunlar gelicek ve mantıkları kullanıcaz
///
/// şimdi bunlar neler açıklayalım:
/// 1=>get :sadece istek atıp datalar dönsün diye kullanılır. bi ekran var ekrdandaki dataların gözükmesini istiyosanız
///         bunu kullanırsınız. bunu kullanırken url parameter kullanılır.
/// 2=>post: get gibi çalısır geriye bi deger respons döndürür farkı ise sudur : bu içerisine data alır nasıl yani sen servise bir data gönderiyosun
///         formatı önemli degil işte bu datayı servis alır kendine göre anlamdırır gerekirse geriye döndürür falan bu sekilde işler
/// 3=>delete:delete isminden de anlasılacagı üzere geriye data döndürmez sadece datayı silmekte kullanılır
/// 4=>put:bu ise update etmek için kullanılır var olan bir datanın yerine yeni bir data koyarsın olur biter! servise bi body yollarsın ve id olur bu id nin yerine bu body i koyarsın
///
/// yardımcı öğelerden birisi "postman" yükel kur
/// servis isteklerini ve apilerini kontrollu bir şekilde burdan yönetebiliyoruz!
/// peki şimdilik işe yarayan kısmı ne abi bu aslıdna hani tekrar tekrar apilere bakmamızın önüne geçiyor diyebilirz
/// gidiyorsan sen bunu kaydediyosun postmanda finito ordan geriye dönüp baktıgında neymiş la bu diye hop görüyorsun
///
/// nasıl kullanıyosunn postman:
/// önce servisi alıyosun linki bu olcuak dedi müşteri aldın sende
/// sonra postmanda + ile yeni bi get sekmesi olusturucaksın yapısıtırcaksın url isteyen kısma sonra send diceksin
/// aşşagıda datayı gördün başasılı oluyor
/// sorna ctrl+s diceksin sorna kaydetme kısmı olucak sonra bunu ismini değiştirebilirsin sonra da collection olusturucaksın buna bi tane
/// hani json place holder sitesinden aldıgın için bunu verebilirsin collection iste apileri grublandırmaya yarıyor galiba
/// sorna create ediyorsun sonra ustune tıklayıp save diyosun sonra işte bidaha bkatıgında sol yanda görebiliyosun collection ismi ile ve api ismin ile!!!
///
/// biraz daha kullanalım
/// adam diyorki hocam placeholdeerdaki posts u da kullancaz biz diyor burdan quide ye tıklıyoz
/// burdan bir parça aldık ve bunu eklicez postmana
/// öncelikle + ya bastım sonra nereye request atıcakmısım posta atıcaksın diyor o zaman yine ben post yazana entegre edicem
/// ama bu sefer bi farklı ne demiştik body data alır yani burdan url yi girdiğimiz yerin hemen solundaki seçeneği post yapıp alttakini de body yapıyoruz
/// sonra ordan none olanı degil row olanı seçiyoruz
/// sorna yanındaki texti json yapıyoruz
/// sonra o açılan alana json yazabiliyoruz artık! bundan sonra key value olarak dataları oraya yazabilirsin mesela
/// bize ne veriolarsa onu alıp postmana yapıstırmalıyız bu sayede alt yapımız olusucak
/// ve biz json kullanıcaksak onları "" arasına almalıyız
/// bu bir fake servis oldugu için date değişse de kaydetmez! buna dikkat en sonda send ile yolluyosun
/// aşşagıdaki solda status:201 yazısını aldıysan basardın ve data eklendi
/// aşaşgıda data da dönüyo ister kullan ister kullanma ve bana diyorki ben bu datayı ekledim bu data serviste başarılıdır diyo
/// sonra bunla işin bittiyse ctrl s ile kaydediyosun sonra ismini create post yaptı veli abimiz
///
/// bunu put ile de yapabiliriz yapalım
/// put neydi güncelleme yapardı!
/// url i kopyalıyosun sonra yapısıtıryosun ama url de /1 ile de ekliyor burdaki 1 hangi id yi güncellicegimizin id si aslında
/// mesela işte posts itemsdaki id işte bu!!! bu id ye göre güncelleme yapıyor
/// suanda fake ip oldugu için güncellemez buna dikkat ama sonralarda gerçek api üzeirnde calısınca bunlar önemli noktlaar
///
/// not: bu gerçek hayatta daha cok kullanılır firebase kullanılmıyor pek gerçekte galiba!
///
/// işte putu seçiyosun ordan yine body alıyor işte sonra ordan yine none degil raw seçip json sçeip oraya yeni datayı yazıosun
/// sornasında sendden 200 geliosa işlem başarılıdır
///
/// sonrasında patch var onu cok kullanmıyoruz
/// delete e gelelim:
/// şimdi deletede none yaparak da kullanabilirsiniz ya da o datayı alır id li datayı sonra da siler
/// sonra da send ile gönderirsin ama genelde none yaparsın olur biter! digerine gerek yok
/// ve sonra kaydedersin
///
/// burda işte bunu yapıo olmak büyük bir avantaj saglıyor senin kodun için!
/// burda sunu yapabilirsin post kısmına gelip postıd li linki alıp url e yazıdıgında orda value degeri degistigini görüceksin
/// işte burda oraya sen farklı sayılar yazabilirsin atıyorum 12 yazdııgnda postıd=12 olanları getiricek ekrana send butonuna bastıgında
/// bu sayede işte id alırken value olarak geçiriyor sonra da geriye deger döndürüyor mesela!!
/// yani bişey istendiginde buraya entegre edebiliyor olman gerekiyor buda işin temel mantıgı
/// temel olarak servisten cevap olarak 200-300 arası başarılı 400 den sornasında sorun var!
/// 500=senin sunucun cökmüş demek mesela
/// 400 ler işte error kısımlarıdır bu kısımlara da kod yazılmaz sadece mesajı geri döndürmen gerke!
///
///