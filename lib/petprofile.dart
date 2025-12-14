import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Petprofile extends StatefulWidget {
  const Petprofile({super.key});

  @override
  State<Petprofile> createState() => _PetprofileState();
}

class _PetprofileState extends State<Petprofile> {
  String? selectedGender;
  File? profileImage;

  final ImagePicker picker = ImagePicker();

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      // 🔹 APP BAR
      appBar: AppBar(
        title: const Text("Add Pet"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(250, 218, 98, 17),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            // 🐶 PET IMAGE
            Center(
              child: GestureDetector(
                onTap: pickImage,
                child: CircleAvatar(
                  radius: 65,
                  backgroundColor: Colors.grey.shade300,
                  backgroundImage:
                      profileImage != null ? FileImage(profileImage!) : null,
                  child: profileImage == null
                      ? const Icon(
                          Icons.add_a_photo,
                          size: 36,
                          color: Colors.black54,
                        )
                      : null,
                ),
              ),
            ),

            const SizedBox(height: 30),

            // 📝 FORM FIELDS
            buildTextField("Pet Name"),
            const SizedBox(height: 16),

            buildTextField("Pet Type"),
            const SizedBox(height: 16),

            buildTextField("Breed"),
            const SizedBox(height: 16),

            DropdownButtonFormField<String>(
              value: selectedGender,
              decoration: inputDecoration("Gender"),
              items: const [
                DropdownMenuItem(value: "Male", child: Text("Male")),
                DropdownMenuItem(value: "Female", child: Text("Female")),
              ],
              onChanged: (value) {
                setState(() {
                  selectedGender = value;
                });
              },
            ),

            const SizedBox(height: 16),

            buildTextField("Age", isNumber: true),
            const SizedBox(height: 16),

            buildTextField("Weight", isNumber: true),
            const SizedBox(height: 30),

            // ✅ ADD BUTTON
            SizedBox(
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color.fromARGB(250, 218, 98, 17),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  // Save pet logic here
                },
                child: const Text(
                  "Add Pet",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 REUSABLE TEXT FIELD
  Widget buildTextField(String label, {bool isNumber = false}) {
    return TextFormField(
      keyboardType:
          isNumber ? TextInputType.number : TextInputType.text,
      decoration: inputDecoration(label),
    );
  }

  // 🔹 COMMON INPUT DECORATION (BACKGROUND COLOR ADDED)
  InputDecoration inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      filled: true,
      fillColor: const Color.fromARGB(255, 233, 233, 233),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Color.fromARGB(250, 218, 98, 17),
          width: 1.5,
        ),
      ),
    );
  }
}
