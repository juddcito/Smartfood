import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:smartfood/presentation/screens/signup/preferencias_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {

    TextEditingController nombreController = TextEditingController();
    TextEditingController telefonoController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  
                Center(
                  child: Image.asset(
                    'assets/logo_res.png',
                    scale: 2,
                  ),
                ),

                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Signup',
                    style: TextStyle(fontSize: 42),
                  )
                ),

                const Divider(),

                const SizedBox(height: 25),


                TextField(
                  controller: nombreController,
                  decoration: const InputDecoration(
                    hintText: '',
                    labelText: 'Nombre completo',
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 25),
                

                TextField(
                  controller: telefonoController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Número de celular',
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 25),
               
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Contraseña',
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 155),

                Align(
                  alignment: Alignment.bottomRight,
                  child: FilledButton.tonal(
                    style: FilledButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(20)
                    ),
                    onPressed: () async {
                      final int id = await obtenerUltimoId();
                      Navigator.of(context).push(MaterialPageRoute(
                      builder:(context) => PreferenciasScreen(
                        nombre: nombreController.text,
                        telefono: telefonoController.text,
                        password: passwordController.text,
                        idUsuario: id
                      )));
                    }, 
                    child: const Icon(Icons.arrow_forward_ios)
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

Future<int> obtenerUltimoId() async {

  final dio = Dio(BaseOptions(
    baseUrl: 'http://192.168.1.10:8000'
  ));

  final response = await dio.get('/usuarios/obtenerUltimoId');

  final id = response.data;

  return id;

}



