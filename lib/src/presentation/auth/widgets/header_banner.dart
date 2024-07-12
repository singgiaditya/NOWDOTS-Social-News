import 'package:flutter/cupertino.dart';

class HeaderBanner extends StatelessWidget {
  final String imgUrl;
  const HeaderBanner({super.key, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(imgUrl), fit: BoxFit.fill)),
    );
  }
}
