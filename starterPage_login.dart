
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:ocd_app/main.dart';
import 'package:ocd_app/starter_page__selection.dart';

const double profileImgRadius = 50;

class starterPage_login extends StatelessWidget {
  const starterPage_login({Key? key}) : super(key: key);

  //1.login address&password
  //2. direct to symptom selection interface
  @override
  Widget build(BuildContext context) {

    double topBottomPaddingBox = MediaQuery.of(context).size.height * .2;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[
              SizedBox(height: topBottomPaddingBox,),
              RandomProfilePic(),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'User Name/Email Address',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder()
                    ,
                    labelText: 'Password',
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const StarterPage_Selection()),
                      );
                    },
                    child: Text('LOGIN', style: buttonStyle),
                  ),
                ],
              ),
              SizedBox(height: topBottomPaddingBox),
            ],
          ),
        ),
      ),
    );
  }
}

class RandomProfilePic extends StatefulWidget{
  @override
  _RandomProfilePicState createState()=> _RandomProfilePicState();
}

class _RandomProfilePicState extends State<RandomProfilePic>{
  late String profilePic;

  @override
  void initState(){
    super.initState();
   profilePic = _getRandomProfilePic();
  }

   // A list of existing pictures imported here
   String _getRandomProfilePic(){
    List<String> profilePics = [
      'assets/images/profilePic1.png',
      'assets/images/profilePic2.png',
      'assets/images/profilePic3.png'
    ];
    // once during initialization, pick 1 random pic
    profilePics.shuffle();
    return profilePics.first;
   }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: profileImgRadius,
      backgroundImage: AssetImage(profilePic),
    ); 
  }
}