import 'package:flutter/material.dart';

class Doctordetails extends StatelessWidget {
  const Doctordetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doctor Details'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 6, 105, 205),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              leading: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuHiVcMPRAYoWo4kWrrQwRunOiVLBRNBVujA&s',
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
              title: const Text('Alex'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(height: 4),
                  Text('Qualification: BBSc & AH'),
                  Text('Experience: 4'),
                ],
              ),
            
            ),
          );
        },
      ),
    );
  }
}
