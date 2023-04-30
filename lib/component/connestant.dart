import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/webview/webview.dart';

Widget BuildArticleItem (article,context) =>InkWell(
  onTap: (){
 Navigator.of(context).push(MaterialPageRoute(builder: (context) => WebViewScreen(article['url']),));
  },
  child:
  Padding(

    padding: const EdgeInsets.all(20.0),

    child: Row(

      children: [

        Container(

          width: 120.0,

          height: 120.0,

          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(10.0),

            image:  DecorationImage(

              image: NetworkImage('${article["urlToImage"]}'),

              fit: BoxFit.cover,

            ),

          ),

        ),

        SizedBox(

          width: 15.0,

        ),

        Expanded(

            child: Container(

              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,

                children:  [

                  Text('${article["title"]}',

                    style: TextStyle(

                        color: Colors.black,

                        fontSize: 20.0,

                        fontWeight: FontWeight.w600

                    ),

                    maxLines: 3,

                    overflow: TextOverflow.ellipsis ,

                  ),

                  Text('${article["publishedAt"]}',

                      style: TextStyle(color: Colors.grey)),

                ],

              ),



            )

        )

      ],

    ),

  ),
);

void BackTo(context, dynamic) =>
    Navigator.pop(context, MaterialPageRoute(builder: (context) => dynamic));

void GoTo(context, dynamic) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => dynamic));


