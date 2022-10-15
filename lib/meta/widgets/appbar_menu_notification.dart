import 'package:flutter/material.dart';

class AppBarMenuNotification extends StatelessWidget {
  const AppBarMenuNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 90,
      backgroundColor: Colors.white,
      leading: Padding(
        padding: const EdgeInsets.only(left: 20,top: 20,bottom: 39),
        child: Image.asset('assets/images/menuIcon.png',),
      ),
      elevation: 0,
      title: Image.asset('assets/images/groupLogo.png',width: 158,height: 80.02,fit: BoxFit.fill,),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(left: 20,top: 20,bottom: 39,right: 20),
          child: Container(
            height: 39,
            width: 39,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black)
            ),
            child: Image.asset('assets/images/notificationIcon.png'),),
        )
      ],
    );
  }
}
