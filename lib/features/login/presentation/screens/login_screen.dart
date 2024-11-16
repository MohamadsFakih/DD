import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: const Image(
                image: AssetImage(
                  "assets/images/pl_portrait.jpg",
                ),
                fit: BoxFit.fill,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Digital Defender\nSpreading the truth about palestine",
                  style: textTheme.headlineLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 32,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Column(
                        children: [
                          Text(
                            "Enter your email to track progress. No password required 👇",
                            style: textTheme.labelLarge
                                ?.copyWith(color: Colors.black),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          _buildTextField(textTheme),
                          const SizedBox(
                            height: 16,
                          ),
                          _buildButton(colorScheme, textTheme),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: _buildDivider(),
                              ),
                              Text(
                                "Or",
                                style: textTheme.labelLarge
                                    ?.copyWith(color: Colors.black),
                              ),
                              Expanded(
                                child: _buildDivider(),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          SizedBox(
                            width: 260,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Colors.white, // White background
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  side: const BorderSide(
                                      color: Colors.black), // Black border
                                ),
                              ),
                              child: Text(
                                "ACCESS ANONYMOUSLY",
                                style: textTheme.labelLarge?.copyWith(
                                    color: Colors.black), // Black text
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  SizedBox _buildButton(ColorScheme colorScheme, TextTheme textTheme) {
    return SizedBox(
      width: 160,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          "GET STARTED",
          style: textTheme.labelLarge?.copyWith(color: colorScheme.onSurface),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Divider(
        thickness: 2,
        color: Colors.black,
      ),
    );
  }

  Container _buildTextField(TextTheme textTheme) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey), // Set border color
        borderRadius: BorderRadius.circular(8.0), // Rounded corners if needed
      ),
      padding: EdgeInsets.zero, // Remove external padding if not needed
      child: TextField(
        controller: _emailController,
        style: textTheme.labelMedium?.copyWith(color: Colors.black),
        decoration: const InputDecoration(
          prefixIcon: Icon(
            Icons.email,
            size: 24,
          ),
          hintText: "Email",
          border: InputBorder.none, // Remove underline
          contentPadding:
              EdgeInsets.symmetric(vertical: 15.0), // Align text and icon
          isDense: true, // Reduce space inside the TextField
        ),
      ),
    );
  }
}
