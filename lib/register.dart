import 'package:flutter/material.dart';

class Register extends StatelessWidget {
   Register({super.key});

   String? selectedgender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('Register'),
        centerTitle:true,
        backgroundColor:Color.fromARGB(0, 239, 22, 22)
      ),
    body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:Center(
          child:Column(
            mainAxisAlignment: .center,
            spacing:10,
            children:[
              TextFormField(
                decoration:InputDecoration(
                  labelText:'Name',
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              TextFormField(
                decoration:InputDecoration(
                  labelText:'Email',
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
               TextFormField(
                decoration:InputDecoration(
                  labelText:'Phone',
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              TextFormField(
                decoration:InputDecoration(
                  labelText:'Age',
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              // TextFormField(
              //   decoration:InputDecoration(
              //     labelText:'Gender',
              //     border:OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(12),
              //     ),
              //   ),
              // ),
              DropdownButtonFormField(
                decoration:InputDecoration(
                  labelText:'Gender',
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                items: ['Male', 'Female'].map((e) => DropdownMenuItem(child: Text(e), value: e,)).toList(), onChanged: (value){
                selectedgender=value;
              }),
              TextFormField(
                decoration:InputDecoration(
                  labelText:'Password',
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              TextFormField(
                decoration:InputDecoration(
                  labelText:'Confirm password',
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(8)),
                  backgroundColor: Colors.blue,foregroundColor: const Color.fromARGB(255, 255, 255, 255)),
                onPressed: () {}, child: Text('Register')),
            








            ],
          ),
        ),
        ),
    );
  }
}