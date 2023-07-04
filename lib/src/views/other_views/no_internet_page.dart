 import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather/src/utils/helpers.dart';


import '../../components/button.dart';
import '../../utils/theme.dart';

class NoInternetPage extends StatelessWidget {
  final Widget widget;

  const NoInternetPage({Key key, this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            Column(
              children: [
                SvgPicture.asset('assets/no_internet.svg'),
                SizedBox(
                  height: 80,
                ),
                Text(
                  'No Internet Connection!',
                  style: TextStyle(
                    fontSize: 28.0,
                    color: kDarkBlue,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Could not Connect to internet!',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: kDarkBlue,
                    fontWeight: FontWeight.w700,
                    height: 0.8,
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Text(
                  'Check Your Connection & Try Again!',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: kDarkBlue,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: widget != null
                  ? Button(
                      title: 'Try Again',
                      onPressed: () {
                        N.pushReplacement(context, widget);
                      },
                    )
                  : SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
