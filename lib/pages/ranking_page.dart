import 'package:flutter/material.dart';

class RankingPage extends StatelessWidget {
  final List<Usuario> usuarios = [
    Usuario(
      posicion: 1,
      fotoUrl: 'assets/images/Avatar.png',
      nombre: 'Sara Martínez',
      puntos: 500,
      tipoUsuario: 'Gold',
    ),
    Usuario(
      posicion: 2,
      fotoUrl: 'assets/images/avatar.jpeg',
      nombre: 'Alexander Richie',
      puntos: 400,
      tipoUsuario: 'Gold',
    ),
    Usuario(
      posicion: 1,
      fotoUrl: 'assets/images/Avatar.png',
      nombre: 'Sara Martínez',
      puntos: 500,
      tipoUsuario: 'Gold',
    ),
    Usuario(
      posicion: 2,
      fotoUrl: 'assets/images/avatar.jpeg',
      nombre: 'Alexander Richie',
      puntos: 400,
      tipoUsuario: 'Gold',
    ),
    Usuario(
      posicion: 1,
      fotoUrl: 'assets/images/avatar.jpeg',
      nombre: 'Sara Martínez',
      puntos: 500,
      tipoUsuario: 'Gold',
    ),
    Usuario(
      posicion: 2,
      fotoUrl: 'assets/images/Avatar.png',
      nombre: 'Alexander Richie',
      puntos: 400,
      tipoUsuario: 'Gold',
    ),
     Usuario(
      posicion: 1,
      fotoUrl: 'assets/images/avatar.jpeg',
      nombre: 'Sara Martínez',
      puntos: 500,
      tipoUsuario: 'Gold',
    ),
    Usuario(
      posicion: 2,
      fotoUrl: 'assets/images/Avatar.png',
      nombre: 'Alexander Richie',
      puntos: 400,
      tipoUsuario: 'Gold',
    ),
    
    // Agrega más usuarios aquí...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 8, bottom: 8), // Ajusta el margen inferior aquí
            child: Text(
              'Ranking',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: usuarios.length,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) {
                final usuario = usuarios[index];
                return ListTile(
                  leading: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '${usuario.posicion}.',
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(width: 8),
                      CircleAvatar(
                        backgroundImage: AssetImage(usuario.fotoUrl),
                      ),
                    ],
                  ),
                  title: Text(
                    usuario.nombre,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 4),
                      Text(
                        '${usuario.puntos} Pts',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(height: 4),
                      Text(
                        'Tipo',
                        style: TextStyle(
                          fontSize: Theme.of(context).textTheme.subtitle1!.fontSize,
                          color: Color.fromARGB(255, 57, 56, 56),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        usuario.tipoUsuario,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                );
              },
              padding: EdgeInsets.all(16),
              physics: BouncingScrollPhysics(),
            ),
          ),
        ],
      ),
    );
  }
}

class Usuario {
  final int posicion;
  final String fotoUrl;
  final String nombre;
  final int puntos;
  final String tipoUsuario;

  Usuario({
    required this.posicion,
    required this.fotoUrl,
    required this.nombre,
    required this.puntos,
    required this.tipoUsuario,
  });
}
