import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController? Email = TextEditingController();
  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: Email!.text.trim());
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Send To Your Email ")));
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Your Email isn't defined")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: _title()),
        backgroundColor: Colors.white,
        elevation: 30,
      ),
      drawer: Drawer(
        backgroundColor: Color(0xffe46b10),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: Container(
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Text(
                  "Enter your Email to Reset Password",
                  style: Theme.of(context).textTheme.headline5!,
                ),
                const SizedBox(
                  height: 40,
                ),
                TextField(
                  // TypeInput: "Email",
                  // prefixIcon: const Icon(Icons.email),
                  controller: Email,
                  obscureText: false,
                  decoration: InputDecoration(label: Text("Email")),
                  // obscure: false,
                ),

                //------------------------------------------------------------------------------

                ElevatedButton(
                  onPressed: () {
                    passwordReset();
                  },
                  child: Text("set"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _title() {
  return RichText(
    softWrap: false,
    text: TextSpan(
        onEnter: ((event) {
          print("123");
        }),
        text: 'Lt',
        style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Color(0xffe46b10)),
        children: [
          TextSpan(
            text: 'uc Stu',
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
          TextSpan(
            text: 'dents',
            style: TextStyle(color: Color(0xffe46b10), fontSize: 30),
          ),
        ]),
  );
}
