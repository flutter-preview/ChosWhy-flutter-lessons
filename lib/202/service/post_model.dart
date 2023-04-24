class PostModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  PostModel({required this.userId, required this.id, required this.title, required this.body});

  PostModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    return data;
  }
}


///bunu buraya yapıstırdıgımızda hata olarak ne veriosa onu yap otomatik olarak onları düzelticeksin ve en
///yalın haliyle bu sekidle kalmalı!
///
/// model olarak ben yukarıdakileri öğrendim ama burda 2 metot var bilmedigim
/// şimdi bize postmandan data map şeklinde geliyor ve bizde bu mapı aslında cast etmemiz gerekiyor modele cevirmemiz gerek
/// işte burdaki "fromjson" metodundan kastımız bu yani servisten verileri buraya almak için kullanırız
/// burda işte id yi buna ata title i buna ata diyor metot!
///
/// tojson metodu ise temel mantıgı direkt olarak işte burdaki dolu olan verileri postmana yolluyor temel basic mantıgı budur
/// hani postmodeldeki create kısmı için bu tojson metodu yaratıyor orda!
/// en önemli noktalardan birisi de bu modele hiçbir zaman kod yazılmaz! senaryo ne olursa olsun buraya kod yazmıcaz!
///  bunlar servisten alır servise verir şeklinde! hani update etmek mi istiyosun git function yaz bu model içerisinde
///  amaa asla bu 2 metoda kod yazma
///  bu modelin içine yazabilirsin ama 2 metoda asla yazmamalısın!
///şimdi geri gidelim view ekranına
