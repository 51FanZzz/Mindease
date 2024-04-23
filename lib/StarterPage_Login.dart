import 'package:flutter/material.dart';

import 'package:ocd_app/main.dart';
import 'package:ocd_app/starter_page__selection.dart';


class StarterPage_Login extends StatelessWidget {
  const StarterPage_Login({Key? key}) : super(key: key);

  //1.login address&password
  //2. direct to symptom selection interface

  final String profileImgUrl = 'https://robohash.org/?set=set4'; // TODO: allow user to replace their picture
  final double profileImgRadius = 50;

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
              CircleAvatar(
                radius: profileImgRadius,
                backgroundImage: NetworkImage(profileImgUrl), // can be replaced
              ),

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
                    border: UnderlineInputBorder(),
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
