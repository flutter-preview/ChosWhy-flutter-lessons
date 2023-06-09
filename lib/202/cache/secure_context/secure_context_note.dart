


///bir baska cache işlemlerinden birisi de secure context işlemidir peki bu nedir?
///normalde shared-preference gol yedigimiz kısımlar var bunlar neler işte herhangi bir hacking
///işleminde bu degerler cok kolaylıkla manupile edilebiliyor bu yüzden bu kısımda
///shared-preference işlemleri pek tercih edilmiyor ama bunun bir çözümü var o da
///secure-context iyi bir çözümdür kendisi ama mobil için bir çözümdür
///
/// bu flutter-secure-storage shared-pref'e göre daha performanslı calısıyor.
/// web kısmında crash yeniyordu ama düzeldi mi bilmiyoruz ama yine önerilen paketlerden birisi
/// bu pakette en önemli kısımlardan birisi burdaki datalar kriptolu yani şifreli bir şekidle saklanmıs
/// oluyor! bunlar da keychain şeklinde saklanmıs oluyor. ama burda sıkıntı var o da su
/// sen shared-pref de uygulamayı sildiginde o kısımdaki datalar silinip gider ama burda
/// keychainde datalar tutuyorsan ömrü hayatında o datayı tutucak demektir buna dikkat etmek lazım
///
/// geldik şimdi burda da aslında aynı işlemleri yapmamız gerekiyor yine SecireContext'de de aynı işlemleri yapıcaz kontroller
/// kayıtlar manager üretme init etme vs
/// şimdi secure_context_learn dosyasına gidelim