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
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(isEditing ? Icons.check : Icons.edit),
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
            // Header
            Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: isEditing
                  ? _editField('Name', nameController, Colors.white)
                  : Text(
                      nameController.text,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),

            const SizedBox(height: 20),

            // Fields
            _profileTile(Icons.email, 'Email', emailController),
            _profileTile(Icons.cake, 'Age', ageController),
            _profileTile(Icons.phone, 'Phone', phoneController),
            _profileTile(Icons.person, 'Gender', genderController),

            const SizedBox(height: 20),

            if (isEditing)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isEditing = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    minimumSize: const Size(double.infinity, 48),
                  ),
                  child: const Text('Save Profile'),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _profileTile(
      IconData icon, String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: ListTile(
          leading: Icon(icon),
          title: Text(label),
          subtitle: isEditing
              ? TextField(
                  controller: controller,
                  decoration: const InputDecoration(border: InputBorder.none),
                )
              : Text(controller.text),
        ),
      ),
    );
  }

  Widget _editField(
      String label, TextEditingController controller, Color color) {
    return TextField(
      controller: controller,
      textAlign: TextAlign.center,
      style: TextStyle(color: color, fontSize: 22),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: label,
        hintStyle: TextStyle(color: Colors.white70),
      ),
    );
  }
}
