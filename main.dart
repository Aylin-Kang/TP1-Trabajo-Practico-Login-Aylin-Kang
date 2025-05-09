import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LoginPage());
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usuario =
      TextEditingController(); // Permite interactuar con el texto, en este caso con el usuario
  TextEditingController contrasena =
      TextEditingController(); // Permite interactuar con el texto, en este caso con la constraseña

  String usuarioCorrecto = 'aylu@gmail.com'; // Defino el usuario correcto
  String contrasenaCorrecta = '160707'; // Defino la constraseña correcta

  void _login() {
    String user =
        usuario.text; // Declaro una variable que guarda el texto del usuario
    String password =
        contrasena
            .text; // Declaro una variable que guarda el texto de la contraseña

    setState(() {
      if (user == 'aylu@gmail.com' && password == '160707') {
        // Si ingresó correctamente el usuario y contraseña, se muestra este mensaje
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Usuario y contraseña ingresados correctamente'),
          ),
          // Mensaje temporal que aparece abajo de la pantalla, en vez de ser un texto fijo en pantalla, aparece por un rato
        );
      } else if (user != 'aylu@gmail.com' &&
          user != '' &&
          password != '160707' &&
          password != '') {
        // Si no se ingresó correctamente el usuario y contraseña, se muestra este mensaje
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Usuario y contraseña incorrectos')),
        );
      }
      if (user == 'aylu@gmail.com' && password != '160707' && password != '') {
        // Si el usuario es correcto pero la contraseña no, se muestra este mensaje
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Contraseña incorrecta')));
      } else if (user != 'aylu@gmail.com' &&
          user != '' &&
          password == '160707') {
        // Si la contraseña es correcta pero el usuario no, se muestra este mensaje
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Usuario incorrecto')));
      }
      if (user == '' && password == '') {
        // Si los campos de usuario y contraseña están vacíos, se muestra este mensaje
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Debe ingresar usuario y contraseña')),
        );
      }
      if (user == 'aylu@gmail.com' && password == '') {
        // Si se ingresó correctamente el usuario pero no se ingresó la contraseña, se muestra este mensaje
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Debe ingresar la contraseña')));
      } else if (user == '' && password == '160707') {
        // Si se ingresó correctamente la contraseña pero no se ingresó el usuario, se muestra este mensaje
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Debe ingresar el usuario')));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize:
              MainAxisSize
                  .min, // Controla el tamaño de la columna de los widget, es el tamaño mínimo que pueden tener los widgets
          children: [
            const Text(
              'INGRESAR USUARIO Y CONTRASEÑA',
              style: TextStyle(fontSize: 15),
              textAlign: TextAlign.center,
            ), // Texto que aparece al principio
            SizedBox(
              width: 250, // Anchura que va a ocupar el widget del usuario
              child: TextField(
                // Widget que deja al usuario ingresar texto, en este caso el usuario
                controller:
                    usuario, // Para controlar el contenido del widget del usuario con las características que se le asignan
              ),
            ),
            SizedBox(
              width: 250, // Anchura que va a ocupar el widget de la contraseña
              child: TextField(
                // Widget que deja al usuario ingresar texto, en este caso la contraseña
                controller:
                    contrasena, // Para controlar el contenido del widget de la contraseña con las características que se le asignan
                obscureText:
                    true, // Para que la contraseña se vea con puntos negros
              ),
            ),

            const SizedBox(height: 30), // Tamaño del botón
            ElevatedButton(
              onPressed: _login,
              child: const Text('INGRESAR'),
            ), // Botón de ingresar
            const SizedBox(height: 20), // Tamaño del mensaje
          ],
        ),
      ),
    );
  }
}
