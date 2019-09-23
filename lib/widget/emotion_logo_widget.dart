import 'package:flutter/cupertino.dart';
import 'package:nps_masspa/utils/text_utils.dart';

class EmotionLogoWidget extends StatefulWidget{
  final String logoUrl;

  EmotionLogoWidget({Key key, this.logoUrl}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return EmotionLogoState();
  }
}

class EmotionLogoState extends State<EmotionLogoWidget> {
  double logoSize = 128.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!TextUtils.isEmpty(widget.logoUrl)) {
      return Image.network(widget.logoUrl, height: logoSize, width: logoSize);
    }
    return Image.asset('assets/ic_logo.png', height: logoSize, width: logoSize);
  }
}