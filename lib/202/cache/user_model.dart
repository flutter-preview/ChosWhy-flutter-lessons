
class User {
  String? name;
  String? description;
  String? url;

  User({this.name, this.description, this.url});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['url'] = url;
    return data;
  }
}




/*
class User{
  final String name;
  final String description;
  final String url;

  User({required this.name, required this.description, required this.url});
}
*/
///burda işte jsonEncode edemiyorum diyor bize hata veriyor onu jsonEncode edebilmem için json halinin olması gerek diyor
///o zaman servis atarken json halini yapabiliyorduk hatırlatırım onun benzeri işlemi yapıcaz burda!
/// ama burda json tipinde veriler giriyoduk hatırlatırım o zmaan json olusturalım orda verelim alalım classı
///
/*
{
    "name": "furkan",
    "description": "fasfsad",
    "url": "a"
}
 bu tarz bi yazım olmalı!
 */
///daha sonra olusturudgumuzu değiştiriyoruz
/// yani burda aslında encode da yaratıcagım json motedunu yarattım ve de decode da kullanıcagım json metodunu yarattım!
/// hatalar varsa onları bi düzeltelim ufak şeyler!
/// şimdi user_cache_manager dosyasına gidip ordaki saveItems hata veriyordu ya burda bunu düzelticem artık jsonEncode decode
/// metotlarım var onları kullanıcaz