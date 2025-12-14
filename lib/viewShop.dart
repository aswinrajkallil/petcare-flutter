import 'package:flutter/material.dart';

class Viewshop extends StatelessWidget {
  const Viewshop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pet Details'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 102, 99, 99)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                labelText: 'search',
                border:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: 4,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder:(context, index) {
              return Card(
                child: ListTile(
                  title: Text('akb'),
                  subtitle:Column(
                    children: [
                      Text('ramanattukara'),
                      Text('review')
                    ],
                  ),
                  leading: Image.network('https://media.gettyimages.com/id/493793824/photo/jodhpur-rajasthan-india.jpg?s=612x612&w=gi&k=20&c=FguoA5k9f5qtAZpbSXT0CB3BZWb2DO9rNpuingIgOhE='),
                  
                ),
              );
            },),
          )
        ],
      ),
    );
  }
}