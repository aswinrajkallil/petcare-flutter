import 'package:flutter/material.dart';

class Petdetails extends StatelessWidget {
  const Petdetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pet Details'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 102, 99, 99)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Image.network("https://png.pngtree.com/png-clipart/20250118/original/pngtree-golden-retriever-dog-pictures-png-image_20183713.png",height: 250,width: double.infinity,),
Padding(
  padding: const EdgeInsets.all(8.0),
  child: Container(
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(24),
      color: const Color.fromARGB(255, 221, 225, 228)
    ),
    child: Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Name: Dog', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
          Text('Age: 2'),
          // Divider()

          Text('breed: Golden Retriever'),
          Text("Gender: Male")
        ],
      ),
      
    ),
  ),
),

        ],
      ),
    );
  }
}