import 'package:flutter/material.dart';
import 'package:lessonone/202/cache/shared_preference/shared_manager.dart';
import 'package:lessonone/202/cache/user_cache/user_cache_manager.dart';

import '../user_model.dart';
import 'shared_preferences_cache_learn.dart';

class SharedListCache extends StatefulWidget {
  const SharedListCache({Key? key}) : super(key: key);

  @override
  State<SharedListCache> createState() => _SharedListCacheState();
}

class _SharedListCacheState extends ChangeLoadingStateFull<SharedListCache> {
  late final UserCacheManager _userCacheManager;
  late List<User> _users = [];

  @override
  void initState() {
    super.initState();
    /*
    final SharedManager sharedManager = SharedManager();
    sharedManager.init().whenComplete(() => (){  ///init tamamlandıgında olusucak kod bu
      _userCacheManager = UserCacheManager(sharedManager);
    });
    */
    initAlizeAndSave();
  }

  Future<void> initAlizeAndSave() async {
    changeLoading();
    final SharedManager sharedManager = SharedManager();
    await sharedManager.init();
    _userCacheManager = UserCacheManager(sharedManager);
    _users = _userCacheManager.getItems() ?? [];
    changeLoading();
    setState(() {}); ///setstate kullanıdm cunku initAlize işlemi gerçekleştikten sonra mevcut durumu güncellemem gerekli ki
    ///init oldugunu bilsin app!
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: isLoading ? CircularProgressIndicator(color: Theme.of(context).scaffoldBackgroundColor,) : null,
        actions: isLoading ? null : [
          IconButton(onPressed: () async{
            changeLoading();
             await _userCacheManager.saveItems(_users);
            changeLoading();
          }, icon: const Icon(Icons.download_for_offline_outlined)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.remove_circle_outline_outlined)),
        ],
      ),
      body: _UserListView(users: _users),
    );
  }
}

class _UserListView extends StatelessWidget {
  const _UserListView({
    required List<User> users,
  }) : _users = users;

  final List<User> _users;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _users.length,
      itemBuilder: (context, index) => Card(
        child: ListTile(
          title: Text(_users[index].name ?? ""),
          subtitle: Text(_users[index].description ?? ""),
          trailing: Text(_users[index].url ?? "",style: Theme.of(context).textTheme.titleMedium?.copyWith(
            decoration: TextDecoration.underline,
          ),),
        ),
      ),
    );
  }
}



///şimdi buraya geldiğimizde burda shared_pref_learn.dart kısmından _UserListVİew widgetını buraya alıyoruz
///burda listviewda users kullandıgım için buraya aldım bunu!
///ve bu sayfayı mainde cağırıyoruz test ediyoruz
///okey bi sıkıntı gözükmüyor okey şimdi burda işlemler vs yapıcaz!
/// neler yapıcaz bu sefer users yani classlı save ve delete kısımlarını yapıcaz!
///
/// şimdi burda manager kısımlarınız yazarken init içerisinde "_userCacheManager = UserCacheManager(SharedManager());" şekilde
/// yazma! crash alırsın
///
/// iconButtonların için doldurmadan önce ayarlamaları yaptık!
/// burda diyoruz ki hocam isloading kısımlarını bi entegre edelim o zaman extend olarak onu verip state kısmına da SharedListCache
/// yi vericez
///
/// ayarlamaları yaptıktan sonra save iconuna basıyoz yani download kısmına buna tıkladıgımda hata alıyorum
/// hata da encode işlemini bu sekilde dogrudan yapamam diyor!
/// birkaç farklı yöntem var ama en güzelini görücez ve ayrıca su user ı model olarak bir cıkartalım ya
/// düzeltmeleri yaptıktan sonra user_model.dart dosyasına gidelim bi
///
/// geldik ve burda bi initalize işlemi yapak
/// initState içerisinde su sekilde yazıyoruz
/*
   final SharedManager sharedManager = SharedManager();
    sharedManager.init().whenComplete(() => (){  ///init tamamlandıgında olusucak kod bu
      _userCacheManager = UserCacheManager(sharedManager);
    });
*/
///bu skeilde bir init işlemi yaptık ama bu kodu daha iyi bir şekilde kodlayabiliriz o da yine isLoading kısımlarıyla birleşmiş bir hali
///olaiblir!
///
/// şöyle bi senaryo da yapabiliriz işte bu action null olabilen bir dizi bu isLoading true ise null olsun false ise okeylensin
/// gibii yine bu sekilde bi ayarlama yaptıgımızda safe olması acısından güzel oluyor!
///
/// user_cache_manager a gidelim!