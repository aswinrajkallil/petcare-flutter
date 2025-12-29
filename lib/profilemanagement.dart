
import 'package:flutter/material.dart';

class ProfileManagement extends StatefulWidget {
  const ProfileManagement({super.key});

  @override
  State<ProfileManagement> createState() => _ProfileManagementState();
}

class _ProfileManagementState extends State<ProfileManagement> {
  bool isEditing = false;

  final nameController = TextEditingController(text: 'Sourav');
  final emailController = TextEditingController(text: 'sourav123@gmail.com');
  final ageController = TextEditingController(text: '20');
  final phoneController = TextEditingController(text: '9878675656');
  final genderController = TextEditingController(text: 'Male');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      // 🔹 APP BAR
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Color.fromARGB(250, 218, 98, 17),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Color.fromARGB(250, 218, 98, 17),
            fontSize: 22,
            fontWeight: FontWeight.bold,
            fontFamily: 'Pacifico',
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              isEditing ? Icons.check : Icons.edit,
              color: const Color.fromARGB(250, 218, 98, 17),
            ),
            onPressed: () {
              setState(() {
                isEditing = !isEditing;
              });
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            // 👤 PROFILE HEADER
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [

                  const CircleAvatar(
                    radius: 40,
                    backgroundColor: Color.fromARGB(40, 218, 98, 17),
                    child: Icon(
                      Icons.person,
                      size: 40,
                      color: Color.fromARGB(250, 218, 98, 17),
                    ),
                  ),

                  const SizedBox(height: 12),

                  isEditing
                      ? _editHeaderField(nameController)
                      : Text(
                          nameController.text,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ],
              ),
            ),

            // 📋 PROFILE DETAILS
            _profileTile(Icons.email, 'Email', emailController),
            _profileTile(Icons.cake, 'Age', ageController),
            _profileTile(Icons.phone, 'Phone', phoneController),
            _profileTile(Icons.person_outline, 'Gender', genderController),

            const SizedBox(height: 20),

            if (isEditing)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color.fromARGB(250, 218, 98, 17),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        isEditing = false;
                      });
                    },
                    child: const Text(
                      'Save Profile',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // 🔹 PROFILE TILE
  Widget _profileTile(
      IconData icon, String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ListTile(
          leading: Icon(icon,
              color: const Color.fromARGB(250, 218, 98, 17)),
          title: Text(label),
          subtitle: isEditing
              ? TextField(
                  controller: controller,
                  decoration:
                      const InputDecoration(border: InputBorder.none),
                )
              : Text(controller.text),
        ),
      ),
    );
  }

  // 🔹 EDIT NAME FIELD
  Widget _editHeaderField(TextEditingController controller) {
    return TextField(
      controller: controller,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      decoration: const InputDecoration(
        border: InputBorder.none,
        hintText: 'Name',
      ),
    );
  }
}
