

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
import 'package:smartfood/presentation/providers/historial/historial_provider.dart';
import 'package:smartfood/presentation/providers/ingredientes/ingredientes_provider.dart';
import 'package:smartfood/presentation/providers/login/login_provider.dart';
import 'package:smartfood/presentation/providers/recomendaciones/recomendaciones_provider.dart';
import 'package:smartfood/presentation/screens/login/login_screen.dart';
import 'package:smartfood/presentation/screens/signup/preferencias_screen.dart';

final selectedPreferenciaProvider = StateProvider((ref) => '');
final selectedNecesidadProvider = StateProvider((ref) => '');

class PreferenciasModificarScreen extends ConsumerStatefulWidget {
  PreferenciasModificarScreen({super.key});

  @override
  _PreferenciasModificarScreenState createState() => _PreferenciasModificarScreenState();
}

class _PreferenciasModificarScreenState extends ConsumerState<PreferenciasModificarScreen> {

  TextEditingController nombreController = TextEditingController();
  TextEditingController telefonoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController edadController = TextEditingController();
  TextEditingController montoController = TextEditingController();

  String selectedGenero = '';
  int selectedPreferencia = 1;
  int selectedNecesidad = 1;
  List<int> listaIngredientes = [];
  List<int> listaEnfermedades = [];
  List<int> listaIntoleranciasSeleccionadas = [];

  @override
  void initState() {
    super.initState();
    obtenerDatosUsuario();
  }

  Future<void> obtenerDatosUsuario() async {

    final usuario = ref.read(usuarioLogueado);
    nombreController.text = usuario.nombre;
    telefonoController.text = usuario.telefono;
    passwordController.text = usuario.password;
    edadController.text = usuario.edad.toString();
    montoController.text = usuario.costomaximo.toString();
    selectedGenero = usuario.genero;
    

    //! ACTUALIZAET SETSATE EN SELECTED PREFERENCIA Y NECESIDAD
    setState(() {
      selectedPreferencia = usuario.preferencia;
      selectedNecesidad = usuario.necesidad;
    });

  }

  @override
  void dispose() {
    nombreController.dispose();
    telefonoController.dispose();
    passwordController.dispose();
    edadController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final usuario = ref.watch(usuarioLogueado);
    final ingredientes = ref.watch(ingredientesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Modificar preferencias'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
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
                    value: usuario.genero,
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
                    value: usuario.preferencia,
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
                    value: usuario.necesidad,
                    items: listaNecesidades
                        .map((item) => DropdownMenuItem<int>(
                            value: item.necesidadId, child: Text(item.nombre)))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedNecesidad = value!;
                      });
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

                  const SizedBox(height: 15,),

                  Container(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () async {
                        await modificarUsuario(
                          usuario.usuarioId,
                          nombreController.text,
                          int.parse(edadController.text),
                          double.parse(montoController.text),
                          selectedGenero,
                          telefonoController.text,
                          passwordController.text,
                          selectedNecesidad,
                          selectedPreferencia
                        );
                        await crearListaPadecimientos(usuario.usuarioId, listaEnfermedades);

                        await crearListaIntolerancias(usuario.usuarioId, listaIntoleranciasSeleccionadas);

                        await crearListaAlergias(usuario.usuarioId, listaIngredientes);

                        final Usuario user = await ref.read(loginUserProvider.notifier).loginUser(telefonoController.text, passwordController.text);
                        ref.read(usuarioLogueado.notifier).update((state) => user);

                        await ref.read(recomendacionesProvider.notifier).loadRecomendaciones(user.nombre);
                        
                        await ref.read(historialProvider.notifier).loadHistorial(user.usuarioId.toString());                        

                        await AwesomeDialog(
                          dismissOnTouchOutside: false,
                          context: context,
                          animType: AnimType.leftSlide,
                          headerAnimationLoop: false,
                          dialogType: DialogType.success,
                          showCloseIcon: true,
                          title: '¡Has modificado tus datos',
                          desc: 'Datos modificados correctamente.',
                          btnOkOnPress: () async {
                            context.pop();                        
                            },
                          ).show();

                      },
                      child: const Text('Modificar')
                    ),
                  )
            ],
          ),
        ),
      ),

    );
  }
}

Future<void> modificarUsuario(int id, String nombre, int edad, double costo, String genero, String telefono, String pass, int necesidad_id, int preferencia_id) async {

  try {

    final dio = Dio(BaseOptions(
    baseUrl: 'http://192.168.1.10:8000'
    ));

  Map<String, dynamic> requestData = {
    'id': id,
    'nombre': nombre,
    'edad': edad,
    'genero' : genero,
    'costo': costo,
    'telefono': telefono,
    'password': pass,
    'necesidad_id': necesidad_id,
    'preferencia_id': preferencia_id
  };

  await dio.put('/usuarios/actualizarUsuario', data: requestData);
     
  } catch (e) {
    print('Falló modificar usuario');
  }

}