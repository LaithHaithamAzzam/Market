import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:market/Service/ListofIcon.dart';
import 'package:market/main.dart';


class Userprofile extends StatelessWidget {
  const Userprofile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0 , left: 15.0),
          child: Column(
            children:[
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Get.theme.primaryColor,
                    backgroundImage: NetworkImage("${prefs!.get("photo")}"),
                    maxRadius: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${prefs!.get("name")}", style: TextStyle(fontSize: 17),),
                        Text("${prefs!.get("email")}", style: TextStyle(fontSize: 12),)
                      ],
                    ),
                  ),

                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 40.0 , right: 18.0),
                child: ListView.builder(itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => onclick[index](),
                    child: Container(
                      color: Colors.white,
                      width: Get.width - 20,
                      height: 75,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Row(
                          children: [
                            Container(
                              alignment: Alignment.center ,
                              margin: EdgeInsets.only(right: 15.0),
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Color(0xffEDFBF4),
                              ),
                              child: SvgPicture.asset("${iconlist[index]}"),
                            ),
                            Text("${TitleIcons[index]}",style: TextStyle(fontSize: 18),),
                          ],
                        ),
                          Icon(Icons.arrow_forward_ios_rounded , color: Colors.black,size: 16.0,)
                        ],
                      ),
                    ),
                  );
                },
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: TitleIcons.length,
                  shrinkWrap: true,
                ),
              )
            ]
          ),
        ),
      ),
    );
  }
}
