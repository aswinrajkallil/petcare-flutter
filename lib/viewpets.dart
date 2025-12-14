import 'package:flutter/material.dart';

class viewpets extends StatefulWidget {
  const viewpets({super.key});

  @override
  State<viewpets> createState() => _viewpetsState();
}

class _viewpetsState extends State<viewpets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('View Pets'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(0,0,0,0)
      ),
      body: GridView.builder(
        itemCount: 4,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 10,
          crossAxisCount: 2), itemBuilder: (context, index) {
        return Card(
            color: const Color.fromARGB(255, 213, 221, 224),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Image.network("https://png.pngtree.com/png-clipart/20250118/original/pngtree-golden-retriever-dog-pictures-png-image_20183713.png",height: 150,width: double.infinity,),
                Text('dog', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                Text('Breed', style: TextStyle(color: Colors.grey),)
                        
              ],),
            ),
          );
      },)
      
  
    );
  }
}