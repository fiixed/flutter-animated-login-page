import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  AnimationController _iconAnimController;
  Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();
    _iconAnimController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _iconAnimation = CurvedAnimation(
      parent: _iconAnimController,
      curve: Curves.easeOut,
    );

    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      //  appBar: AppBar(
      //    title: Text('Flutter Login Demo'),
      //  ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image(
            image: AssetImage('assets/girl.jpeg'),
            fit: BoxFit.cover,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlutterLogo(
                size: _iconAnimation.value * 100,
              ),
              Form(
                child: Theme(
                  data: ThemeData(
                    brightness: Brightness.dark,
                    primarySwatch: Colors.teal,
                    inputDecorationTheme: InputDecorationTheme(
                      labelStyle: TextStyle(
                        color: Colors.teal,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Enter Email'),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Enter Password'),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 40.0),
                        ),
                        MaterialButton(
                          color: Colors.teal,
                          textColor: Colors.white,
                          child: Text('Login'), 
                          splashColor: Colors.redAccent,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
