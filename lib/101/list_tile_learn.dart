import 'package:flutter/material.dart';
import 'package:lessonone/core/random_image.dart';

class ListTileLearn extends StatelessWidget {
  const ListTileLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: _ProjectPadding().projectPadding,
            child: Card(
              child: ProjectListTile(),
            ),
          )
        ],
      ),
    );
  }
}

class ProjectListTile extends StatelessWidget
    with _ProjectPadding, _ProjectHeight {
  ProjectListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: projectPadding,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        onTap: () {},
        title: SizedBox(height: normalHeight, child: RandomImage()),
        subtitle: Text("How do you use your card"),
        leading: Icon(Icons.money),
        trailing: Icon(Icons.chevron_right),

        ///dense özelliği olabildigince alanları sıkıstırır!!
      ),
    );
  }
}

class _ProjectHeight {
  final double normalHeight = 100;
}

class _ProjectPadding {
  final EdgeInsets projectPadding = EdgeInsets.all(8);
}

///her zaman poddingi sayfaya benim vermem gereklidir bu yüzden hep 0 lamamız gerekmektedir!
/// yine bunun da themesı var mı var tabikide onu de ListTileTheme dan ayarlıyabilirsin tüm temasını bu widgetın!
///
///
