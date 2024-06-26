// ignore_for_file: use_build_context_synchronously

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smartfood/domain/entities/enfermedad.dart';
import 'package:smartfood/domain/entities/genero.dart';
import 'package:smartfood/domain/entities/intolerancia.dart';
import 'package:smartfood/domain/entities/necesidad.dart';
import 'package:smartfood/domain/entities/preferencia.dart';
import 'package:smartfood/domain/entities/usuario.dart';
import 'package:smartfood/presentation/providers/ingredientes/ingredientes_provider.dart';
import 'package:smartfood/presentation/providers/login/login_provider.dart';
import 'package:smartfood/presentation/screens/login/login_screen.dart';
import 'package:smartfood/presentation/screens/signup/signup_screen.dart';

class PreferenciasScreen extends ConsumerStatefulWidget {

  final String nombre;
  final String telefono;
  final String password;
  final int idUsuario;

  const PreferenciasScreen({
    super.key,
    required this.nombre,
    required this.telefono,
    required this.password,
    required this.idUsuario
  });

  @override
  _PreferenciasScreenState createState() => _PreferenciasScreenState();
}

class _PreferenciasScreenState extends ConsumerState<PreferenciasScreen> {

  String selectedGenero = '';
  int selectedPadecimiento = 1;
  int selectedIntolerancia = 1;
  int selectedPreferencia = 1;
  int selectedNecesidad = 1;
  List<int> listaAlergias = [];
  List<int> listaIngredientes = [];
  List<int> listaEnfermedades = [];
  List<int> listaIntoleranciasSeleccionadas = [];
  TextEditingController edadController = TextEditingController();
  TextEditingController montoController = TextEditingController();
  TextEditingController nombreController = TextEditingController();

  @override
  void initState() {
    super.initState();
    ref.read(ingredientesProvider.notifier).loadIngredientes();
  }

  @override
  Widget build(BuildContext context) {   
    
    final ingredientes = ref.watch(ingredientesProvider);

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
                    'Preferencias y padecimientos',
                    style: TextStyle(fontSize: 42),
                  )
                ),

                const Divider(),

                const SizedBox(height: 25),
                
                DropdownButtonFormField(
                  decoration: InputDecoration(
                    labelText: 'Género',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.black54)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.black54)
                    )
                  ),
                  isExpanded: true,
                  items: listaGeneros
                      .map((item) => DropdownMenuItem<String>(
                          value: item.id, child: Text(item.nombre)))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedGenero = value!;
                      print(selectedGenero);
                    });
                  },
                ),

                const SizedBox(height: 25),

                TextField(
                  controller: edadController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: '',
                    labelText: 'Edad',
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 25),

                DropdownButtonFormField(
                  decoration: InputDecoration(
                      labelText: 'Preferencia de sabor',
                      enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black54),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.black54)
                    )
                  ),
                  isExpanded: true,
                  items: listaPreferencias
                      .map((item) => DropdownMenuItem<int>(
                          value: item.preferenciaId, child: Text(item.nombre)))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedPreferencia = value!;
                    });
                  },
                ),

                const SizedBox(height: 25),

                DropdownButtonFormField(
                  decoration: InputDecoration(
                    labelText: 'Necesidad específica',
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black54),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.black54)
                    )
                  ),
                  isExpanded: true,
                  items: listaNecesidades
                      .map((item) => DropdownMenuItem<int>(
                          value: item.necesidadId, child: Text(item.nombre)))
                      .toList(),
                  onChanged: (value) {
                    selectedNecesidad = value!;
                    print('Necesidad $selectedNecesidad');
                  },
                ),

                const SizedBox(height: 25),

                TextField(
                  controller: montoController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.monetization_on_rounded),
                    hintText: '',
                    labelText: 'Monto máximo a pagar',
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 25),

                const Text('Padecimientos'),

                // Checkboxes de los padecimientos
                ...listaPadecimientos.map((pad) {
                  return CheckboxListTile(
                    title: Text(pad.nombre),
                    value: listaEnfermedades.contains(pad.padecimientoId),
                    onChanged:(value) {
                      setState(() {
                        if (value != null) {
                          if (value) {
                            listaEnfermedades.add(pad.padecimientoId);
                          } else {
                            listaEnfermedades.remove(pad.padecimientoId);
                          }
                        }
                      });
                    },
                  );
                }),

                const SizedBox(height: 25),

                const Text('Intolerancias alimentarias'),

                ...listaIntolerancias.map((tole) {
                  return CheckboxListTile(
                    title: Text(tole.nombre),
                    value: listaIntoleranciasSeleccionadas.contains(tole.intoleranciaId),
                    onChanged:(value) {
                      setState(() {
                        if (value != null) {
                          if (value) {
                            listaIntoleranciasSeleccionadas.add(tole.intoleranciaId);
                          } else {
                            listaIntoleranciasSeleccionadas.remove(tole.intoleranciaId);
                          }
                        }
                      });
                    },
                  );
                }),

                const SizedBox(height: 25),

                const Text('Alergias alimentarias'),

                // Checkboxes de las alergias
                ...ingredientes.map((ing) {
                  return CheckboxListTile(
                    title: Text(ing.nombre),
                    value: listaIngredientes.contains(ing.id),
                    onChanged:(value) {
                      setState(() {
                        if (value != null) {
                          if (value) {
                            listaIngredientes.add(ing.id);
                            print(listaIngredientes);
                          } else {
                            listaIngredientes.remove(ing.id);
                            print(listaIngredientes);
                          }
                        }
                      });
                    },
                  );
                }),

                const SizedBox(height: 25),

                Align(
                  alignment: Alignment.bottomRight,
                  child: FilledButton.tonal(
                    style: FilledButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(20)
                    ),
                    onPressed: () async {

                      await crearUsuario(
                        widget.nombre,
                        int.parse(edadController.text),
                        double.parse(montoController.text),
                        selectedGenero,
                        widget.telefono,
                        widget.password,
                        selectedNecesidad,
                        selectedPreferencia
                      );

                      final int id = await obtenerUltimoId();

                      await crearListaPadecimientos(id-1, listaEnfermedades);

                      await crearListaIntolerancias(id-1, listaIntoleranciasSeleccionadas);

                      await crearListaAlergias(id-1, listaIngredientes);

                      await AwesomeDialog(
                      dismissOnTouchOutside: false,
                      context: context,
                      animType: AnimType.leftSlide,
                      headerAnimationLoop: false,
                      dialogType: DialogType.success,
                      showCloseIcon: true,
                      title: '¡Bienvenido a SmartFood',
                      desc: 'Te has registrado correctamente.',
                      btnOkOnPress: () async {
                        context.pop();
                        },
                      ).show();

                      context.push('/login');
                    },
                    child: const Icon(Icons.check)
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

Future<void> crearUsuario(String nombre, int edad, double costo, String genero, String telefono, String pass, int necesidad_id, int preferencia_id) async {

  try {

    final dio = Dio(BaseOptions(
    baseUrl: 'http://192.168.1.10:8000',
    ));

  Map<String, dynamic> requestData = {
    'nombre': nombre,
    'edad': edad,
    'genero' : genero,
    'costo': costo,
    'telefono': telefono,
    'password': pass,
    'necesidad_id': necesidad_id,
    'preferencia_id': preferencia_id
  };

  await dio.post('/usuarios/crearUsuario', data: requestData);
     
  } catch (e) {
    print('Falló crear usuario');
  }

}

Future<void> crearListaPadecimientos(int idUsuario, List<int> listaPadecimientos) async {

  try {

    final dio = Dio(BaseOptions(
    baseUrl: 'http://192.168.1.10:8000/'
    ));

    final List<Map<String, dynamic>> payload = listaPadecimientos.map((padecimiento) {
    return {"idUsuario": idUsuario, "idEnfermedad": padecimiento};
    }).toList();

    await dio.post('enfermedades/crearListaEnfermedades', data: payload);
     
  } catch (e) {
    print('Falló crear lista de padecimientos');
  }

}

Future<void> crearListaIntolerancias(int idUsuario, List<int> listaIntolerancias) async {

  try {

    Map<String, dynamic> requestData = {
      'id': idUsuario
  };

    final dio = Dio(BaseOptions(
    baseUrl: 'http://192.168.1.10:8000/',
    ));

    final List<Map<String, dynamic>> payload = listaIntolerancias.map((intolerancia) {
    return {"idUsuario": idUsuario, "idIntolerancia": intolerancia};
    }).toList();

    await dio.post('intolerancias/crearListaIntolerancias', data: payload);
     
  } catch (e) {
    print('Falló crear lista de intolerancias');
  }

}

Future<void> crearListaAlergias(int idUsuario, List<int> listaAlergias) async {

  try {

    final dio = Dio(BaseOptions(
    baseUrl: 'http://192.168.1.10:8000/'
    ));

    final List<Map<String, dynamic>> payload = listaAlergias.map((alergia) {
    return {"idUsuario": idUsuario, "idIngrediente": alergia};
    }).toList();

    await dio.post('enfermedades/crearListaAlergias', data: payload);
     
  } catch (e) {
    print('Falló crear lista de alergias');
  }

}


