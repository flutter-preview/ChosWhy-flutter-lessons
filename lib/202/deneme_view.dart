import 'package:flutter/material.dart';
import 'package:lessonone/202/model_learn.dart';

class DenemeView extends StatefulWidget {
  const DenemeView({Key? key}) : super(key: key);

  @override
  State<DenemeView> createState() => _DenemeViewState();
}

class _DenemeViewState extends State<DenemeView> {
  final PostModel2 model2 = PostModel2("furkan", "naber", 1, 2);
  PostModel1 model1 = PostModel1();
  PostModel1 model11 = PostModel1();
  final PostModel3 model3 = PostModel3(1, 1, "title", "body");
  final PostModel4 model4 = PostModel4(userId: 1, id: 1, title: "selam", body: "napıyosun");
  final PostModel5 model5 = PostModel5(userId: 1, id: 2, body: "body", title: "title");
  final PostModel6 model6 = PostModel6(userId: 1, id: 2, body: "body", title: "title");
  final PostModel7 model7 = PostModel7(title: "asfsadsafsa");
  final PostModel8 model8 = PostModel8(title: "klnfklsmlfas",id: 1,body: "akmsfmksa",userId: 2);
  final PostModel8 model9 = PostModel8();
  OrnekClassCopyWith ornek = OrnekClassCopyWith(title: "ornek-title",id: 10);

  @override
  void initState() {
    super.initState();
    model1.body = "blablablabla";
    model1.userId = 10;
    model1.id = 1;
    model1.title = "burası title yeri ulan";

    model1 = model11;

    //model3.title = "değişiklik";
    //model4.title = "deneeme";
    model8.updateTitle("title değişiyor");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        setState(() {
          ornek = ornek.copyWith(title: "copyWith ile title değişti");
        });
      }),
      body: Center(child: Text("${ornek.id}")),
    );
  }
}
