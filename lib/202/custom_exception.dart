

class FileDownloadException implements Exception{

  @override
  String toString() {
    return "File download has failed";
  }
}

///burda en cok kulanılan metotlardan birisi toString metoduur!
///burda karşımıza ne cıkıyor override kelimesi!
///burda işlem yapıcaksan burda return kelimesini sunu yazarsan eger "file download has failed" o zaman bu metodu
///her kulanısında bu mesaj karsına cıkıcak! tabi bu classdan referens ettiğin nesne ile kullanırsan
///,
///işte bunu yaparak kendine göre artık exceptionunu özelleştirmiş oldun aslında!
///bunu daha sonra oopLearn.dart dosyasına gidip orda değişiklik yapıcaz! yaptıktan sonra view ekranına gidelim oopView
///