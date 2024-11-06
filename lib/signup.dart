import 'package:flutter/material.dart';
import 'package:flutter_application_4/database/database.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  // Créez des TextEditingController pour chaque champ de saisie
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        backgroundColor: const Color.fromARGB(255, 39, 145, 139),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Image.asset(
                  'assets/login.jpg',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Create Account!',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 39, 145, 139),
                ),
              ),
              const Text(
                'Please fill in the details to sign up!',
                style: TextStyle(fontSize: 20),
              ),
              // Champ pour le nom d'utilisateur
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15),
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    hintText: 'Full Name',
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
              ),
              // Champ pour l'email
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15),
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    hintText: 'Email',
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
              ),
              // Champ pour le mot de passe
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    hintText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
              ),
              // Champ pour confirmer le mot de passe
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15),
                child: TextField(
                  controller: confirmPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    hintText: 'Confirm Password',
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
              ),
              // Bouton d'inscription
              GestureDetector(
                onTap: () async {
                  // Logique d'inscription
                  String name = nameController.text;
                  String email = emailController.text;
                  String password = passwordController.text;
                  String confirmPassword = confirmPasswordController.text;

                  if (name.isEmpty || email.isEmpty || password.isEmpty) {
                    print('Veuillez remplir tous les champs.');
                    return;
                  }

                  if (password != confirmPassword) {
                    print('Les mots de passe ne correspondent pas.');
                    return;
                  }

                  // Créez un nouvel utilisateur et insérez-le dans la base de données
                  final newUser = User(id: DateTime.now().millisecondsSinceEpoch, name: name, email: email, password: password);
                  await DatabaseHelper.instance.addUser(newUser);
                  const snackBar = SnackBar(
                  content: Text('Inscription réussie '),
                );


                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      

                  print('Inscription réussie pour $name');
                },
                child: Container(
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.teal,
                        Colors.teal.shade100,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(5, 5),
                        blurRadius: 10,
                      )
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
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
