import 'package:flutter/material.dart';

class OnbordingBody {

final String image;
final String title;
final String body;

  OnbordingBody({
    required this.image,
    required this.title,
    required this.body
  });

}

class OnBordingScreen extends StatelessWidget {


  List<OnbordingBody> bording =[
    OnbordingBody(
        image : "assets/images/shop.JPG",
        title : "Title 1",
        body  : "Body 1"
    ),
    OnbordingBody(
        image : "assets/images/shop.JPG",
        title : "Title 2",
        body  : "Body 2"
    ),
    OnbordingBody(
        image : "assets/images/shop.JPG",
        title : "Title 3",
        body  : "Body 3"
    ),

  ];

  OnBordingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          height: 500,
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: page_controller,
                  physics:BouncingScrollPhysics() ,
                  itemBuilder: (context, index) => onbordingModel(bording[index]),
                  itemCount:bording.length ,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget onbordingModel (OnbordingBody model) => Column(
     children: [
       Image.asset(model.image),
/*
       const SizedBox(
         width:40.0 ,),
*/
       Text(
           model.title,
           style:const TextStyle(
             fontWeight: FontWeight.w600,
             fontSize: 20.0,
           ) ),
       const SizedBox(
         width: 20.0,
       ),
       Text(
           model.body,
           style:const TextStyle(
             fontWeight: FontWeight.w600,
             fontSize: 20.0,
           ) ),

     ],
  );

}
