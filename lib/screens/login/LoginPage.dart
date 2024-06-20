import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart'; // Import the Google Sign-In package
import 'package:onlineshopping/provider/ProductProvider.dart';
import 'package:onlineshopping/screens/HomeScreen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _authService = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  late ProductProvider productProvider;

  User? _user;
  String? _displayName;
  String? _email;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      productProvider = Provider.of<ProductProvider>(context, listen: false);
    });
    _authService.authStateChanges().listen((event) {
      setState(() {
        _user = event;
      });
    });
  }

  Future<void> _saveUserData(String displayName, String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', displayName);
    await prefs.setString('email', email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Google Sign-In')),
      body: _googleSignButton(),
    );
  }

  Widget _googleSignButton() {
    return Center(
      child: SizedBox(
        height: 50,
        child: ElevatedButton(
          onPressed: _signInWithGoogle,
          child: const Text("SignIn"),
        ),
      ),
    );
  }

  Widget _userInfo() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Hello, ${_displayName}!'),
          Text('Email: $_email'),
          ElevatedButton(
            onPressed: () async {
              await _authService.signOut();
              setState(() {
                _user = null;
              });
            },
            child: const Text('Sign Out'),
          ),
        ],
      ),
    );
  }

  Future<void> _signInWithGoogle() async {
      try {
        final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
        if (googleUser == null) {
          // User canceled the sign-in
          return;
        }
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        await _authService.signInWithCredential(credential);

        final String? userName = googleUser.displayName;
        final String? email = googleUser.email;
        productProvider.setUserName(userName!);

        // Set the first time flag to false
        await setFirstTimeFalse();
        // Save user data
        await _saveUserData(userName, email!);

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } catch (e) {
        // Handle specific platform exceptions
        if (e is PlatformException) {
          print("PlatformException occurred: ${e.message}");
          // Handle specific error codes if needed
          if (e.code == 'sign_in_failed') {
            // Specific handling for sign-in failed error
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Sign-In Failed"),
                content: const Text("Failed to sign in with Google."),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("OK"),
                  ),
                ],
              ),
            );
          } else {
            // Handle other PlatformExceptions
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Error"),
                content: Text("An error occurred during sign-in: ${e.message}"),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("OK"),
                  ),
                ],
              ),
            );
          }
        } else {
          // Handle other types of exceptions
          print("Exception occurred: $e");
        }
      }
  }

  Future<void> setFirstTimeFalse() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('first_time', false);
  }
}
