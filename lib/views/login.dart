import 'package:flutter/material.dart';
import 'package:kuis_mobile_124240081/models/data.dart';
import 'package:kuis_mobile_124240081/views/root.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoggedIn = false;

    void login (){
      String username = usernameController.text;
      String password = passwordController.text;

      if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text("Username dan Password Anda tidak boleh kosong!"),
        ),
      );
      return;
    }

  if (username == account.username && password == account.password) {
        setState(() {
          isLoggedIn = true;
        });

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Root()),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text("Login Berhasil"),
        ),
      );

    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text("Login Gagal. Username atau Password Salah"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 233, 242),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://play-lh.googleusercontent.com/bB_cyOTbQfFmV4IaeqTIFJVc1Wm4UdQwQai8GjthG4uaXrTHNZTKsMtg9_9058GeZGLgoJzIasYYdFkSvdyQ',
                height: 150,
                  fit: BoxFit.contain,
              ),
              SizedBox(height: 10),
              Text(
                "Selamat Datang di Uniqlo",
              ),
              Text(
                "Selamat Berbelanja (semoga nilaiku bagus)"
              ),
              SizedBox(height: 30),
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  hintText: "username",
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "password",
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 40,
                width: 180,
                child: ElevatedButton(
                  onPressed: login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 95, 123, 238),
                  ),
                  child:Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
