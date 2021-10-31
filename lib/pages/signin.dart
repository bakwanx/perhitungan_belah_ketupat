import 'package:flutter/material.dart';

import '../theme.dart';

class SignIn extends StatefulWidget {

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  String username1 = 'user1';
  String password1 = '123456';
  String username2 = 'user2';
  String password2 = '123456';

  TextEditingController usernameController = TextEditingController(text: '');

  TextEditingController passwordController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {

    void snackBar(String message){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                  message
              )
          )
      );
    }
    
    void handleSign(){
      String username = usernameController.text.toString();
      String password = passwordController.text.toString();

      if(username.isEmpty || password.isEmpty){
        snackBar('Username dan Password tidak boleh kosong');
        return;
      }
      if(password.length < 6){
        snackBar('Password kurang dari 6 character');
        return;
      }
      
      if(username==username1 && password == password1){
        Navigator.pushReplacementNamed(context, '/input-form');
        return;
      }

      if(username==username2 && password == password2){
        Navigator.pushReplacementNamed(context, '/main-ketupat');
        return;
      }
    }

    Widget header(){
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Login",
              style: primaryTextStyle.copyWith(
                  fontSize: 24,
                  fontWeight: semiBold,
                  color: Colors.black
              ),
            ),
            SizedBox(height: 2),
            Text(
                "Sign In to Continue",
                style: subtitleTextStyle
            )
          ],
        ),
      );
    }

    Widget emailInput(){
      return Container(
        margin: EdgeInsets.only(top: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Username",
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
                color: Colors.black
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                  horizontal: 16
              ),
              decoration: BoxDecoration(
                  color: backgroundColor2,
                  borderRadius: BorderRadius.circular(12)
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon_email.png',
                      width: 17,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Expanded(
                        child: TextFormField(
                          controller: usernameController,
                          style: primaryTextStyle,
                          decoration: InputDecoration.collapsed(
                              hintText: 'Your Username',
                              hintStyle: subtitleTextStyle.copyWith(
                                  color: Colors.white
                              ),
                          ),
                        )
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget passwordInput(){
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Password",
              style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                  color: Colors.black
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                  horizontal: 16
              ),
              decoration: BoxDecoration(
                  color: backgroundColor2,
                  borderRadius: BorderRadius.circular(12)
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon_password.png',
                      width: 17,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Expanded(
                        child: TextFormField(
                          style: primaryTextStyle,
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration.collapsed(
                              hintText: 'Your Password',
                              hintStyle: subtitleTextStyle.copyWith(
                                color: Colors.white
                              )
                          ),
                        )
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget signInButton(){
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: TextButton(
          onPressed: (){
            handleSign();
          },
          style: TextButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)
              )
          ),
          child: Text(
            'Sign In',
            style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium
            ),
          ),
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Container(
            margin: EdgeInsets.only(
              top: 60,
              right: 30,
              left: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header(),
                emailInput(),
                passwordInput(),
                signInButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
