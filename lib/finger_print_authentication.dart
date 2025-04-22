import 'package:finger_print_login/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class FingerprintAuth extends StatefulWidget {
  const FingerprintAuth({Key? key}) : super(key: key);

  @override
  _FingerprintAuthState createState() => _FingerprintAuthState();
}

class _FingerprintAuthState extends State<FingerprintAuth> {
  final auth = LocalAuthentication();
  bool _isAuthenticated = false;

  Future<void> _authenticate() async {
    bool canCheckBiometric = await auth.canCheckBiometrics;
    try {
      if (canCheckBiometric) {
        final bool didAuthenticate = await auth.authenticate(
            localizedReason: 'Please Press the Finger Print',
            options: const AuthenticationOptions(biometricOnly: true));
        setState(() {
          _isAuthenticated = didAuthenticate;
          _isAuthenticated ?  Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          ) : const Text('Error');
        });
      }

    } on PlatformException catch (e) {
      print(e);
    }
    if (!_isAuthenticated) {
    } else if (_isAuthenticated) {}
  }


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigoAccent,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('asset/images/fingerprint.png', color: Colors.black),
            const Center(
              child: Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 50.0),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 15.0),
                    child: const Text(
                      "Authenticate using your fingerprint instead of your password",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, height: 1.5),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 15.0),
                    width: double.infinity,
                    child: FloatingActionButton(
                      backgroundColor: Colors.greenAccent,
                      onPressed: _authenticate,
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 14.0),
                        child: Text(
                          "Authenticate",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
