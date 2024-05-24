import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

import 'package:ocd_app/main.dart';
import 'package:ocd_app/starter_page__selection.dart';

final double profileImgRadius = 50;

class starterPage_login extends StatelessWidget {
  const starterPage_login({Key? key}) : super(key: key);

  //1.login address&password
  //2. direct to symptom selection interface

 
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Back to last page'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: normalSizedGap,),
              randomProfilePic(),

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
            ],
          ),
        ),
      ),
    );
  }
}

class randomProfilePic extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Faker faker = Faker();
    String profilePicUrl = faker.image.image();

    return CircleAvatar(
      radius: profileImgRadius,
      backgroundImage: NetworkImage(profilePicUrl),
    );
  }
  
}