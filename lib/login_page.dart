import 'package:simple_chat_app/models/auth_service.dart';
import 'package:simple_chat_app/widgets/login_text_field.dart';
import 'package:simple_chat_app/utils/spaces.dart';
import 'package:simple_chat_app/utils/textfield_styles.dart';
import 'package:flutter/material.dart';
import 'package:simple_chat_app/chat_page.dart';
import 'package:social_media_buttons/social_media_button.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  Future<void> _loginuser(BuildContext context) async {
    if (_formkey.currentState != null && _formkey.currentState!.validate()) {
      print(usernamecontroller.text);
      print(passwordcontroller.text);
      print("logged in successfully");
      await context.read<AuthService>().loginUser(usernamecontroller.text);
      Navigator.pushReplacementNamed(context, '/chat',
          arguments: '${usernamecontroller.text}');
    } else {
      print("Failed to login");
    }
  }

  Widget _buildHeader(context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Signup Now!️",
          style: ThemeTextStyle.loginstyle,
          textAlign: TextAlign.center,
        ),
        verticalSpacing(5),
        Text(
          "Welcome Back! \n We love you ❤️",
          style: ThemeTextStyle.loginstyle
              .copyWith(fontSize: 20, fontWeight: FontWeight.w300),
          textAlign: TextAlign.center,
        ),
        Image.network('https://www.kindpng.com/picc/m/62-622207_super-man-png-transparent-superman-png-png-download.png',
          height: 300,
        ),
        // Image.asset('assets/dash2022_4k.png',height: 150,),
        verticalSpacing(15),
      ],
    );
  }

  Widget _buildForm(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Form(
          key: _formkey,
          child: Column(
            children: [
              LoginTextField(
                controller: usernamecontroller,
                hintText: "Enter your user name",
              ),
              verticalSpacing(15),
              LoginTextField(
                needAsteriks: true,
                hintText: "Password",
                controller: passwordcontroller,
              ),
            ],
          ),
        ),
        verticalSpacing(10),
        ElevatedButton(
            onPressed: () async {
              await _loginuser(context);
            },
            child: Text("Login Now")),
      ],
    );
  }

  Widget _buildFooter(context) {
    return Column(
      children: [
        TextButton(
            onPressed: () async {
              if (!await launch('https://mjunaid.carrd.co/')) {
                throw "Failed to load";
              }
              ;
              print('Link Clicked');
            },
            child: Text("https://mjunaid.carrd.co/")),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SocialMediaButton.github(
              size: 25,
              url: 'https://github.com/Dev-Muhammad-Junaid',
            ),
            SocialMediaButton.twitter(
              size: 25,
              url: 'https://twitter.com/Jaydee2831',
              color: Colors.lightBlueAccent,
            ),
            SocialMediaButton.linkedin(
              size: 25,
              url: 'https://www.linkedin.com/in/mjunaid971/',
              color: Colors.blueAccent,
            )
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              if (constraints.maxWidth > 1000) {
                //web layout width
                return Expanded(
                  child: Row(
                    children: [
                      Spacer(flex: 1,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Spacer(flex:1,),
                          _buildHeader(context),
                          Spacer(flex: 1,),
                          _buildFooter(context),
                        ],
                      ),
                      Expanded(child: _buildForm(context)),
                      Spacer(flex: 1,),
                    ],
                  ),
                );

              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildHeader(context),
                  _buildForm(context),
                  _buildFooter(context),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
