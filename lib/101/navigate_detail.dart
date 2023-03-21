import 'package:flutter/material.dart';

class NavigateDetailLearnDart extends StatefulWidget {
  const NavigateDetailLearnDart({Key? key, this.isOkay = false})
      : super(key: key);
  final bool isOkay;

  @override
  State<NavigateDetailLearnDart> createState() =>
      _NavigateDetailLearnDartState();
}

class _NavigateDetailLearnDartState extends State<NavigateDetailLearnDart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton.icon(
            onPressed: () {
              Navigator.of(context).pop(!widget.isOkay);

              ///bak burda da harbiden pop ustune geldigimde resul ama T tipinde yani gerenic bir value döndürebilirsin diyor
              ///ve sonra bunu debug yaptıgımda bu sayfadan cıktıgımda ben response'ye atadıgım için geri dönen sonucu responsun degerini true olarak görebilirim
              ///
            },
            icon: Icon(Icons.check,color: widget.isOkay ? Colors.red : Colors.green,),
            label: widget.isOkay ? const Text("Reddet") : const Text("Onayla")),
      ),
    );
  }
}
