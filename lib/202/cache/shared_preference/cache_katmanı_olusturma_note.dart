

///şimdi mid seviyenin üstüne çıkmadan önce öğrenmemiz gereken başka bir kısım daha var
///bu zamana kadar işte servis kısmında neler yaptık dataları cektik kullandık vs
///datalar kullanıldıgı sürece ekrandan gitmiyorsa bunlar aslında ramde tutuluyormus
///peki biz bu hafıza rem yani memory de bi ileri çıkarmak istediğimizde yazılımda ne kullanıyoruz
///caching kullanıyoruz peki bu n demek?
///şimdi bi app var ve senaryo gereği senin dataları tutman gerekiyor işte mesela kullanıcı veriler
///giriyor böyle kendi hakkında ve sonra save butonuna tıklıyor daha sonra internet olmadıgında
///bu verilerin yine burda tutulmasına caching deniyor!
///
/// yine bunları yaparken birden fazla paket mevcut ama en cok kullanılan bir paketi öğrenicez burda
/// -1.shared preferences
/// burda bu paket uygulama içerisinde android tarafında SharedPreferences içerisine yazıp bu dataları
/// saklamaya yarıyor! ve bu datalar map şeklinde saklanıyor yani key-value ilişkisi içerisinde
///
/// şimdi shared-preferences-cache-learn kısmına gidelim