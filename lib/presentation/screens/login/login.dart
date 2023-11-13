

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              
              const SizedBox(height: 15),
        
              Image.asset(
                'assets/logo_res.png',
                scale: 2.2,
              ),
            
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 42
                  ),
                )
              ),
        
              const Divider(),
      
              const SizedBox(height: 25),
      
              const TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                  label: Text('Correo electrónico')
                ),
              ),
      
              const SizedBox(height: 25),
      
              const TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.key_rounded),
                  border: OutlineInputBorder(),
                  label: Text('Contraseña')
                ),
              ),
      
              const SizedBox(height: 25),
      
              Container(
                width: double.infinity,
                child: FilledButton.tonal(
                  onPressed: (){},
                  child: const Text('Login')
                ),
              ),

              const SizedBox(height: 25),

              GestureDetector(
                onTap: () => context.push('/signup'),
                child: const Text(
                  '¿No tienes cuenta? Regístrate',
                  style: TextStyle(
                    color: Colors.grey
                  ),
                ),
              ),

              SizedBox(height: 200),

              const Text(
                '® SmartFood',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              )
              
          
            ],
          ),
        ),
      ),

    );
  }
}