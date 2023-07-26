import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jogo_mobile_app/models/event.dart';

class DetailEventPage extends StatelessWidget {
  final Event event;

  DetailEventPage({required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.green,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: [
            FutureBuilder<void>(
              future: _preloadImage(context),
              builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                  );
                } else if (snapshot.hasError) {
                  return Text('Fallo al cargar la imagen');
                } else {
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            event.image ?? '',
                            fit: BoxFit.cover,
                            width: 1000,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Container(
                          height: 7,
                          decoration: BoxDecoration(
                            color: const Color(0xFFE5E5E5),
                            borderRadius: BorderRadius.circular(3.5),
                          ),
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.name ?? '',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        flex: 6,
                        child: Container(
                          decoration: BoxDecoration(
                          color: const Color(0xFFDDFFD8),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 8,
                          ),
                          child: Center(
                            child: Text(
                              "Fecha: ${_formatDate(event.date)}",
                              style: TextStyle(
                                color: Color(0xFF0F511D),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      event.venue ?? '',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        height: 22 / 15,
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    event.description ?? '',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _preloadImage(context) async {
    if (event.image != null) {
      await precacheImage(NetworkImage(event.image!), context);
    }
  }

  String? _formatDate(String? date) {
    if (date != null) {
      final dateTime = DateTime.parse(date);
      return DateFormat('dd/MM/yyyy').format(dateTime);
    }
    return null;
  }
}
