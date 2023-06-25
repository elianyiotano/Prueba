import 'package:flutter/material.dart';

class EventsPage extends StatelessWidget {
  // Supongamos que recibes una lista de objetos Event desde el backend
  List<Event> events = [
    Event('https://images.squarespace-cdn.com/content/v1/58597a19e58c62ba7fa48bf9/1548266254177-E9L28UDS7DYTNXY6E3TG/49711511_1899872330125651_6983768156468674560_n.jpg', 'Fecha 1', 'Próximos eventos'),
    Event('https://blog.mailup.es/wp-content/uploads/2018/01/evento-cover.jpg', 'Fecha 2', 'Lugar 2'),
    Event('https://blog.mailup.es/wp-content/uploads/2018/01/evento-cover.jpg', 'Fecha 3', 'Lugar 3'),
    // Agrega más objetos Event según sea necesario
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Row(
          children: [
            Expanded(
              child: Text(
                'Próximos eventos',
                style: TextStyle(
                  color: Colors.black,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          height: 600, 
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: events.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildEventTile(events[index]);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildEventTile(Event event) {
    return Container(
      height: 200, // Ajusta la altura según tus necesidades
      width: double.infinity, // Ocupa todo el ancho disponible
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11.0),
        image: DecorationImage(
          image: NetworkImage(event.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 8.0,
            left: 8.0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 2, 49, 87), // Personaliza el color del badge según tus necesidades
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Text(
                event.date,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 8.0,
            right: 8.0,
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.transparent, // Personaliza el color del contenedor del lugar según tus necesidades
                borderRadius: BorderRadius.circular(11.0),
              ),
              child: Text(
                event.location,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Event {
  final String imageUrl;
  final String date;
  final String location;

  Event(this.imageUrl, this.date, this.location);
}
