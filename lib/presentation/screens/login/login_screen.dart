

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smartfood/domain/entities/usuario.dart';
import 'package:smartfood/presentation/providers/ingredientes/ingredientes_provider.dart';
import 'package:smartfood/presentation/providers/login/login_provider.dart';

final  usuarioLogueado = StateProvider<Usuario>((ref) => Usuario(usuarioId: 1, nombre: '', edad: 0, genero: 'genero', telefono: 'telefono', password: 'password', necesidad: 1, preferencia: 1, costomaximo: 200));

class LoginScreen extends ConsumerWidget {
  LoginScreen({super.key});

  TextEditingController telefonoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context, ref) {

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                
                const SizedBox(height: 15),
          
                Image.asset(
                  'assets/logo_res.png',
                  scale: 2,
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
              
                TextField(
                  controller: telefonoController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                    label: Text('Número de celular')
                  ),
                ),
              
                const SizedBox(height: 25),
              
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.key_rounded),
                    border: OutlineInputBorder(),
                    label: Text('Contraseña')
                  ),
                ),
              
                const SizedBox(height: 25),
              
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.tonal(
                    onPressed: () async {

                    try {
                      final Usuario user = await ref.read(loginUserProvider.notifier).loginUser(telefonoController.text, passwordController.text);
                      ref.read(usuarioLogueado.notifier).update((state) => user);
                      context.pushReplacement('/splash');
                    } catch (e) {
                      print('Ocurrió un error en el login');
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text("Teléfono y/o contraseña incorrectos."),
                          duration: const Duration(seconds: 1),
                        )
                      );
                    }
                      
                    },
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
        
                const SizedBox(height: 160),
        
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
      ),

    );
  }
}