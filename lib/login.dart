import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login page'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 192, 143, 128),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: .center,
            spacing: 10,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'usename',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(8)),
                  backgroundColor: Colors.blue,foregroundColor: const Color.fromARGB(255, 255, 255, 255)),
                onPressed: () {}, child: Text('login')),
            ],
          ),
        ),
      ),
    );
  }
}
