import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../component/connestant.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';


class WebViewScreen extends StatelessWidget {
/*
  const WebView({Key? key}) : super(key: key);
*/

  final  url ;
  const WebViewScreen(this.url, {super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebView(initialUrl:url ),
    );
  }
}
