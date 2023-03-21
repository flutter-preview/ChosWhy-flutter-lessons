import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../101/image_learn.dart';

class NoteDemosApp extends StatelessWidget {
  NoteDemosApp({Key? key}) : super(key: key);
  final String _title = "Create your first note";
  final String _subtitle = ("Add a note" * 10).toString();
  final String _createNote = "Create a Note";
  final String _importNote = "Import Note";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(systemOverlayStyle: SystemUiOverlayStyle.dark,),
      body: Padding(
        padding: PaddingItems.horizontalPadding,
        child: Column(
          children: [
            PngImage(name: PngImageItems().appleWithBook),
            _TitleWidget(title: _title),
            Padding(
              padding: PaddingItems.verticalPadding,
              child: _SubTitleWidget(
                subTitle: _subtitle,
              ),
            ),
            const Spacer(),

            ///space columlarda ekranda en alta gitmek için kullanılan bir özelleştirilmiş sunulan bir widgettır!
            ElevatedButton(
                onPressed: () {},
                child: SizedBox(
                    height: ButtonHeights.buttonNormalHeight,
                    child: Center(
                        child: Text(
                      _createNote,
                      style: Theme.of(context).textTheme.headline5,
                    )))),
            TextButton(onPressed: (){}, child: Text(_importNote)),
            SizedBox(height: ButtonHeights.buttonNormalHeight,),
          ],
        ),
      ),
    );
  }
}

///burda ne yaptık textaligni parametre olarak istedik ve default deger olarak center
///atadık artık nullable a gerek kalmadı!
class _SubTitleWidget extends StatelessWidget {
  const _SubTitleWidget({
    super.key,
    this.textAlign = TextAlign.center,
    required this.subTitle,
  });

  final TextAlign textAlign;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Text(
      subTitle,
      style: Theme.of(context).textTheme.subtitle1?.copyWith(
            color: Colors.black38,
            fontWeight: FontWeight.w400,
          ),
      textAlign: textAlign,
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .headline5
          ?.copyWith(color: Colors.black, fontWeight: FontWeight.w600),
    );
  }
}

class PaddingItems {
  static final EdgeInsets horizontalPadding =
      EdgeInsets.symmetric(horizontal: 20);
  static final EdgeInsets verticalPadding = EdgeInsets.symmetric(vertical: 10);
}

class ButtonHeights {
  static const double buttonNormalHeight = 50;
}


//genel olarak ögrendigimiz companentlerle geliştirilebilir bir sayfa bu sekilde yazılır!!!