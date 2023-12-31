import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jogo_mobile_app/models/event.dart';
import 'package:jogo_mobile_app/routes.gr.dart';
import 'package:jogo_mobile_app/services/coupons.service.dart';
import 'package:intl/intl.dart';
import 'package:jogo_mobile_app/services/events.service.dart';
import 'package:jogo_mobile_app/widgets/failed_modal.dart';

class EventsPage extends StatefulWidget {
  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  List<Event> events = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getEventList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Row(
          children: [
            Expanded(
              child: Text(
                'Eventos',
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
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
              ),
            )
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                height: 600,
                child: events.length == 0
                    ? const Text(
                        "No hay eventos disponibles",
                        textAlign: TextAlign.center,
                      )
                    : GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                        ),
                        shrinkWrap: true,
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
    return GestureDetector(
      onTap: () {
        _navigateToEventDetail(event);
      },
      child: Container(
        height: 200,
        width: double.infinity,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11.0),
        ),
        child: FutureBuilder<ImageProvider?>(
          future: loadImage(event.image),
          builder:
              (BuildContext context, AsyncSnapshot<ImageProvider?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                ),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Error al cargar la imagen'),
              );
            } else {
              return Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11.0),
                      image: DecorationImage(
                        image: snapshot.data ??
                            AssetImage('assets/placeholder.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Positioned(
                  //   top: 8.0,
                  //   left: 8.0,
                  //   child: Container(
                  //     padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  //     decoration: BoxDecoration(
                  //       color: const Color.fromARGB(255, 2, 49, 87),
                  //       borderRadius: BorderRadius.circular(16.0),
                  //     ),
                  //     child: Text(
                  //       "${_formatDate(event.date)}" ?? '',
                  //       style: const TextStyle(
                  //         color: Colors.white,
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Positioned(
                    bottom: 8.0,
                    right: 8.0,
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(11.0),
                      ),
                      child: const Text(
                        '' ?? '',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  void _navigateToEventDetail(Event event) {
    AutoRouter.of(context).push(DetailEventRoute(event: event));
  }

  Future<ImageProvider?> loadImage(String? imageUrl) async {
    if (imageUrl != null) {
      try {
        Dio dio = Dio();
        Response response = await dio.get(imageUrl,
            options: Options(responseType: ResponseType.bytes));
        return MemoryImage(response.data);
      } catch (e) {
        return null;
      }
    } else {
      return null;
    }
  }

  Future<void> getEventList() async {
    if (true) {
      Response response = await EventService().getList(context);
      dynamic res = response.data;

      if (res is List) {
        events.clear();
        res.forEach((value) {
          events.add(Event.fromJson(value));
        });

        if (mounted) {
          setState(() {
            isLoading = false;
          });
        }
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return FailedModal(
              title: 'Ha ocurrido un error',
              description:
                  "Por favor verifique su conexión a internet y vuelva a iniciar sesión. ",
            );
          },
        );
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  String _formatDate(String? date) {
    if (date != null) {
      final dateTime = DateTime.parse(date);
      return DateFormat('dd/MM/yyyy').format(dateTime);
    }
    return '';
  }
}
