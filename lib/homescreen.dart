import 'package:flutter/material.dart';
import 'package:petcareapp/community.dart';
import 'package:petcareapp/doctordetails.dart';
import 'package:petcareapp/groomers.dart';
import 'package:petcareapp/petparks.dart';
import 'package:petcareapp/petprofile.dart';
import 'package:petcareapp/profilemanagement.dart';
import 'package:petcareapp/trainers.dart';
import 'package:petcareapp/viewpets.dart';
import 'package:petcareapp/viewshop.dart';

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
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        leading: const Padding(
          padding: EdgeInsets.only(left: 12),
          child: Icon(
            Icons.pets,
            color: Color.fromARGB(250, 218, 98, 17),
            size: 28,
          ),
        ),
        title: const Text(
          "Pet Care",
          style: TextStyle(
            color: Color.fromARGB(250, 218, 98, 17),
            fontSize: 22,
            fontWeight: FontWeight.bold,
            fontFamily: 'Pacifico',
          ),
        ),
      ),

      // 🔹 BODY
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // 🔔 NOTIFICATION
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 224, 178),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.notifications,
                        color: Color.fromARGB(255, 140, 66, 17)),
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

            // 🐾 YOUR PETS
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                "Your Pets",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  petCircleCard(
                    image:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZ4hoI22VjUYMZ9E1U_nquV-AzIoUTcjBb-A&s",
                    name: "Bruno",
                  ),
                  petCircleCard(
                    image:
                        "https://images.unsplash.com/photo-1548199973-03cce0bbc87b",
                    name: "Luna",
                  ),
                  addPetCircleCard(context),
                ],
              ),
            ),

            // 🧩 PET SERVICES
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Text(
                "Pet Services",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            SizedBox(
              height: 280,
              child: GridView(
                padding: const EdgeInsets.only(left: 16),
                scrollDirection: Axis.horizontal,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 14,
                  crossAxisSpacing: 14,
                  childAspectRatio: 0.75,
                ),
                children: [
                  serviceCard("Doctors", Icons.medical_services,
                      "https://i.ibb.co/r2S8kSc4/Whats-App-Image-2025-12-29-at-12-59-13-PM.jpg",() => Navigator.push(context,MaterialPageRoute(builder:(context) => Doctordetails(),)),),
                  serviceCard("Pet Shops", Icons.store,
                      "https://images.unsplash.com/photo-1583337130417-3346a1be7dee",() => Navigator.push(context, MaterialPageRoute(builder:(context) => Viewshop(),)),),
                  serviceCard("Groomers", Icons.cut,
                      "https://s.yimg.com/ny/api/res/1.2/6wkC4QCk82ccjxE9hnlk3g--/YXBwaWQ9aGlnaGxhbmRlcjt3PTEyNDI7aD04MjU7Y2Y9d2VicA--/https://media.zenfs.com/en/the_spruce_pets_articles_780/eb4a8afe61b0d9339362016e03085057",() => Navigator.push(context, MaterialPageRoute(builder:(context) => Viewgroomers(),)),),
                  serviceCard("Trainers", Icons.fitness_center,
                      "https://i.ibb.co/zHHZ3HCM/Gemini-Generated-Image-yg3msiyg3msiyg3m.png",() => Navigator.push(context, MaterialPageRoute(builder:(context) => Viewtrainers(),)),),
                  serviceCard("Vets", Icons.local_hospital,
                      "https://images.unsplash.com/photo-1628009368231-7bb7cfcb0def",() => Navigator.push(context, MaterialPageRoute(builder:(context) => Doctordetails(),)),),
                  serviceCard("Pet Parks", Icons.park,
                      "https://www.shutterstock.com/image-photo/english-bulldog-puppy-ball-pit-260nw-560492860.jpg",() => Navigator.push(context, MaterialPageRoute(builder:(context) => Viewpetparks(),)),),
                ],
              ),
            ),

            const SizedBox(height: 100),
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
              MaterialPageRoute(builder: (_) => const VideoPostPage()),
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ProfileManagement()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "Community"),
          BottomNavigationBarItem(
              icon: Icon(Icons.grid_view), label: "Features"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  // 🐶 ROUND PET CARD
  static Widget petCircleCard({
    required String image,
    required String name,
  }) {
    return Container(
      width: 90,
      margin: const EdgeInsets.only(right: 14),
      child: Column(
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipOval(
              child: Image.network(image, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // ➕ ADD PET
  static Widget addPetCircleCard(BuildContext context) {
    return Container(
      width: 90,
      margin: const EdgeInsets.only(right: 14),
      child: Column(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(40),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const Petprofile()),
              );
            },
            child: Container(
              height: 70,
              width: 70,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 255, 230, 213),
              ),
              child: const Icon(
                Icons.add,
                size: 30,
                color: Color.fromARGB(250, 218, 98, 17),
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Text("Add Pet", style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  // 🧩 SERVICE CARD (FIXED FOR GRIDVIEW)
  Widget serviceCard(String title, IconData icon, String image, VoidCallback onTap) {
    return GestureDetector(onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.12),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(22),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(image, fit: BoxFit.cover),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.55),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(icon, color: Colors.white, size: 20),
                      const SizedBox(height: 4),
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
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
