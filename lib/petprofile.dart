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
  String selectedWeightUnit = "kg";
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
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new,
              color: Color.fromARGB(250, 218, 98, 17)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Add Pet",
          style: TextStyle(
            color: Color.fromARGB(250, 218, 98, 17),
            fontSize: 22,
            fontWeight: FontWeight.bold,
            fontFamily: 'Pacifico',
          ),
        ),
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
            const SizedBox(height: 20),

            // 🔘 GENDER (SMALL RADIO)
            Text(
              "Gender",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade700,
              ),
            ),
            const SizedBox(height: 6),

            Row(
              children: [
                compactRadio("Male"),
                const SizedBox(width: 20),
                compactRadio("Female"),
              ],
            ),

            const SizedBox(height: 20),

            buildTextField("Age", isNumber: true),
            const SizedBox(height: 16),

            // ⚖️ WEIGHT WITH UNIT
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: inputDecoration("Weight"),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 233, 233, 233),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: DropdownButton<String>(
                    value: selectedWeightUnit,
                    underline: const SizedBox(),
                    items: const [
                      DropdownMenuItem(value: "kg", child: Text("kg")),
                      DropdownMenuItem(value: "g", child: Text("g")),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedWeightUnit = value!;
                      });
                    },
                  ),
                ),
              ],
            ),

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

  // 🔘 COMPACT RADIO WIDGET
  Widget compactRadio(String value) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedGender = value;
        });
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Transform.scale(
            scale: 0.85, // 👈 reduce radio size
            child: Radio<String>(
              value: value,
              groupValue: selectedGender,
              activeColor: const Color.fromARGB(250, 218, 98, 17),
              onChanged: (val) {
                setState(() {
                  selectedGender = val;
                });
              },
            ),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 14),
          ),
        ],
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

  // 🔹 COMMON INPUT DECORATION
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
