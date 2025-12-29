import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      // 🔹 APP BAR (MATCH YOUR APP)
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
          'Register',
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

            buildTextField('Name'),
            const SizedBox(height: 14),

            buildTextField('Email'),
            const SizedBox(height: 14),

            buildTextField('Phone', isNumber: true),
            const SizedBox(height: 14),

            buildTextField('Age', isNumber: true),
            const SizedBox(height: 18),

            // 🔘 GENDER (COMPACT RADIO)
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

            const SizedBox(height: 18),

            buildTextField('Password', obscure: true),
            const SizedBox(height: 14),

            buildTextField('Confirm Password', obscure: true),
            const SizedBox(height: 26),

            // ✅ REGISTER BUTTON
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
                onPressed: () {},
                child: const Text(
                  'Register',
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

  // 🔘 COMPACT RADIO BUTTON
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
            scale: 0.85,
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
          Text(value, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  // 🔹 REUSABLE TEXT FIELD
  Widget buildTextField(
    String label, {
    bool isNumber = false,
    bool obscure = false,
  }) {
    return TextFormField(
      keyboardType:
          isNumber ? TextInputType.number : TextInputType.text,
      obscureText: obscure,
      decoration: inputDecoration(label),
    );
  }

  // 🔹 COMMON INPUT DECORATION (MATCH APP)
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
