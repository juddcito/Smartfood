import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:go_router/go_router.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  static const name = 'chat-screen';

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final SpeechToText _speechToText = SpeechToText();
  final FlutterTts _flutterTts = FlutterTts();
  bool _speechEnabled = false;
  String _command = '';
  TextEditingController messageController = TextEditingController();
  final List<Bubble> conversation = [
    const Bubble(
        message:
            '¡Hola! Mi nombre es Bumble-bot y soy la asistente virtual de SmartFood. ¿En qué puedo ayudarte?',
        isSender: false),
    const Bubble(
        message: '¿Puedes mostrarme mis recomendaciones?', isSender: false),
    const Bubble(
        message: '¿Cómo son generadas mis recomendaciones?', isSender: false),
    const Bubble(
        message: '¿Cuántas sucursales SmartFood hay en mi ciudad?',
        isSender: false),
    const Bubble(
        message: '¿Cómo cambio mis preferencias y padecimientos?',
        isSender: false),
  ];

  final List<String> responses = [
    'Claro, te llevaré a la pantalla de recomendaciones.',
    'Tus recomendaciones de platillos, bebidas y postres están basadas en diversas métricas, que incluyen: tus alergias a ciertos ingredientes, tus padecimientos médicos y si tienes alguna práctica dietética específica. Recuerda que una vez registrados tus datos, estos también pueden modificarse en un futuro.',
    'Recuerda que en Los Mochis, Sinaloa, existen 3 sucursales SmartFood. ¡No te preocupes! Al mandar tu pedido desde la app, este será recibido en la sucursal más cercana a ti.',
    'Recuerda que para modificar tus preferencias y padecimientos tienes que iniciar sesión en tu aplicación SmartFood, abrir las opciones del menú lateral y seleccionar la opción "Preferencias".',
    '¡Hola! ¿Cuál es tu pregunta?',
    'Claro, te mostraré tu historial de pedidos.',
    'No puedo proporcionar una respuesta a tu solicitud.'
  ];

  @override
  void initState() {
    super.initState();
    initSpeech();
  }

  @override
  void dispose() {
    _speechToText.cancel();
    _flutterTts.stop();
    super.dispose();
  }

  void _speakMessage(String message) async {
    await _flutterTts.speak(message);
  }

  void initSpeech() async {
    await _flutterTts.setLanguage("es-MX");
    await _flutterTts.setVoice({'name': 'Sabina', 'locale': 'es-MX'});
    await _flutterTts.setPitch(1.0);

    _speakMessage(conversation[0].message);

    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  void analizeCommand(String command) async {

    command = command.toLowerCase();

    if (((command.contains('generadas') ||
            command.contains('generan') ||
            command.contains('generas')) &&
        command.contains('recomendacion'))) {
      _speakMessage(responses[1]);
      setState(() {
        conversation.add(Bubble(message: responses[1], isSender: false));
      });
    } else if (command.contains('recomendacion') ||
        command.contains('recomienda') ||
        command.contains('recomendación')) {
      _speakMessage(responses[0]);
      context.push('/recomendaciones-ver-todas');
      setState(() {
        conversation.add(Bubble(message: responses[0], isSender: false));
      });
    } else if (command.contains('sucursal') ||
        command.contains('restaurantes')) {
      _speakMessage(responses[2]);
      setState(() {
        conversation.add(Bubble(message: responses[2], isSender: false));
      });
    } else if (command.contains('preferencias') ||
        command.contains('padecimientos')) {
      _speakMessage(responses[3]);
      setState(() {
        conversation.add(Bubble(message: responses[3], isSender: false));
      });
    } else if (command.contains('hola') ||
        command.contains('onda') ||
        command.contains('buenas') ||
        command.contains('tal') || command.contains('estás')) {
      _speakMessage(responses[4]);
      setState(() {
        conversation.add(Bubble(message: responses[4], isSender: false));
      });
    } else if (command.contains('pedidos')){
      _speakMessage(responses[5]);
      context.push('/historial-pedidos');
      setState(() {
        conversation.add(Bubble(message: responses[5], isSender: false));
      });
    } else {
      _speakMessage(responses[6]);
      setState(() {
        conversation.add(Bubble(message: responses[6], isSender: false));
      });
    }
  }

  void _onSpeechResult(SpeechRecognitionResult result) async {
    setState(() {
      _command = "${result.recognizedWords}";
      messageController.text = _command;
    });

    if (_speechToText.isNotListening) {
      setState(() {
        conversation.add(Bubble(message: _command, isSender: true));
        messageController.text = '';
      });

      if (messageController.text == '') {
        analizeCommand(_command);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    
    final color = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Icon(Icons.smart_toy, color: Colors.white, size: 32),
            ),
            SizedBox(width: 10),
            Text('Bumble-Bot')
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 15),
          Expanded(
            child: ListView.builder(
              itemCount: conversation.length,
              itemBuilder: (context, index) {
                final bubble = conversation[index];
                return bubble;
              },
            ),
          ),
          Container(
            color: Colors.grey.shade200,
            child: TextField(
              controller: messageController,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(12),
                  hintText: _speechToText.isListening
                      ? 'Escuchando tu mensaje...'
                      : 'Escribe tu mensaje...',
                  prefixIcon: _speechToText.isListening
                      ? Spin(
                          infinite: true,
                          child: Icon(Icons.record_voice_over,
                              color: Colors.blue.shade300),
                        )
                      : null,
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: _speechToText.isListening
                              ? _stopListening
                              : _startListening,
                          icon: Icon(Icons.mic,
                              color: _speechToText.isListening
                                  ? Colors.red
                                  : Colors.grey.shade700)),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              conversation.add(Bubble(
                                  message: messageController.text,
                                  isSender: true));
                              analizeCommand(messageController.text);
                              messageController.text = '';
                            });
                          },
                          icon: Icon(Icons.send, color: Colors.grey.shade700)),
                    ],
                  )),
              onSubmitted: (value) {},
            ),
          )
        ],
      ),
    );
  }
}

class Bubble extends StatelessWidget {
  final String message;
  final bool isSender;

  const Bubble({super.key, required this.message, required this.isSender});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: BubbleNormal(
        text: message,
        isSender: isSender,
        color: isSender ? Colors.grey.shade200 : Colors.green.shade100,
      ),
    );
  }
}
