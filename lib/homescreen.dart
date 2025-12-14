import 'package:flutter/material.dart';
import 'package:petcareapp/community.dart';
import 'package:petcareapp/petprofile.dart';
import 'package:petcareapp/profilemanagement.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      // 🔹 APP BAR
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(250, 218, 98, 17),
        centerTitle: true,
        title: const Text(
          "Pet Care",
          style: TextStyle(color: Colors.white),
        ),
      ),

      // 🔹 BODY
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // 🔔 NOTIFICATION CARD
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 224, 178),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: const [
                    Icon(
                      Icons.notifications,
                      color: Color.fromARGB(255, 140, 66, 17),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        "Upcoming vaccination for Bruno on 18 Sept",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
              ),
            ),

            // 🐾 SECTION TITLE
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                "Your Pets",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // 🐶 HORIZONTAL PET LIST
            SizedBox(
              height: 125,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [

                  petSquareCard(
                    image:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZ4hoI22VjUYMZ9E1U_nquV-AzIoUTcjBb-A&s",
                    name: "Bruno",
                  ),

                  petSquareCard(
                    image:
                        "https://images.unsplash.com/photo-1548199973-03cce0bbc87b",
                    name: "Luna",
                  ),

                  // ➕ ADD PET CARD
                  addPetSquareCard(context: context),
                ],
              ),
            ),

            const SizedBox(height: 120),
          ],
        ),
      ),

      // 🔻 BOTTOM NAV BAR
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        selectedItemColor: const Color.fromARGB(255, 140, 66, 17),
        unselectedItemColor: Colors.grey.shade500,
        onTap: (index) {
          setState(() => currentIndex = index);

          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => VideoPostPage()),
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileManagement()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: "Community",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: "Features",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }

  // 🐶 PET SQUARE CARD (PROPER SIZE)
  Widget petSquareCard({
    required String image,
    required String name,
  }) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(18),
            ),
            child: Image.network(
              image,
              height: 80,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ➕ ADD PET SQUARE CARD
  Widget addPetSquareCard({required BuildContext context}) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Petprofile()),
        );
      },
      child: Container(
        width: 120,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 239, 208, 187),
          borderRadius: BorderRadius.circular(18),
        ),
        child: const Center(
          child: Icon(
            Icons.add,
            color: Color.fromARGB(250, 218, 98, 17),
            size: 36,
          ),
        ),
      ),
    );
  }
}
