import 'package:rock_vin/auth/auth.dart';
import 'package:rock_vin/screens/login_screen/components/user_login/user_regi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();

// FocusNode for controll focus and transfer focus between TextInput Field
final FocusNode _emailFocusNode = FocusNode();
final FocusNode _passwordFocusNode = FocusNode();

//Assign TextEditingControllers text to variable
String get _email => _emailController.text;
String get _password => _passwordController.text;

final _formKey = GlobalKey<FormState>();

class _LoginPageState extends State<LoginPage> {
  void _submit() async {
    try {
      //connect Class Auth from app/servises/auth.dart using provider create in main.dart
      final auth = Provider.of<AuthBase>(context, listen: false);

      // send email and password to signInWithEmailAndPassword in auth.dart for login
      await auth.signInWithEmailAndPassword(_email, _password);
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const Scaffold(
                  body: Text("Home"),
                )),
      );
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFFE9A178),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 50.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 0.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 300,
                        width: 300,
                        child: Image.asset("assets/images/logo.png"),
                      ),
                      Column(
                        children: [
                          emailInput(),
                          const SizedBox(
                            height: 20.0,
                          ),
                          passwordInput(),
                          const SizedBox(
                            height: 50.0,
                          ),
                          SizedBox(
                            height: 50.0,
                            width: 320.0,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFE9A178),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                    Radius.circular(50.0),
                                  ))),
                              onPressed: _submit,
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white),
                              ),
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) {
                                    return const UserRegister();
                                  },
                                ));
                              },
                              child: const Text(
                                "No account ? Register",
                                style: TextStyle(color: Color(0xFFF6E1C3)),
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox passwordInput() {
    return SizedBox(
      width: 320.0,
      height: 55.0,
      child: TextField(
        controller: _passwordController,
        decoration: const InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 216, 0, 58),
              width: 2.0,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 216, 122, 0),
              width: 2.0,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
          hintText: 'Password',
          labelText: 'Enter your Password',
          // errorText: "widget.invalidEmailErrorText",
          hintStyle: TextStyle(fontSize: 15, color: Colors.white),
          labelStyle: TextStyle(fontSize: 15, color: Colors.white),
        ),
        autocorrect: false,
        obscureText: true,
        onChanged: (email) => _updateState(),
      ),
    );
  }

  SizedBox emailInput() {
    return SizedBox(
      width: 320.0,
      height: 55.0,
      child: TextField(
        controller: _emailController,
        focusNode: _emailFocusNode,
        decoration: const InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 216, 0, 58),
              width: 2.0,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 216, 122, 0),
              width: 2.0,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
          hintText: 'Enter your Email',
          labelText: 'Email',
          hintStyle: TextStyle(fontSize: 15, color: Colors.white),
          labelStyle: TextStyle(fontSize: 15, color: Colors.white),
        ),
        onChanged: (password) => _updateState(),
      ),
    );
  }

  _updateState() {
    setState(() {});
  }
}
