import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jogo_mobile_app/models/message.dart';
import 'package:jogo_mobile_app/services/message.service.dart';
import 'package:intl/intl.dart';
import 'package:jogo_mobile_app/widgets/failed_modal.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<Message> messagesToday = [];
  List<Message> messagesBefore = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getMessage(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
              ),
            )
          : ListView(
              padding: EdgeInsets.all(15.0),
              children: [
                Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Text('Mensajes',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                          height: 30.0 / 22.0,
                        ))),
                SectionHeader(title: 'Hoy'),
                SizedBox(height: 5.0),
                if (messagesToday.length == 0) ...[
                  Text(
                    "No hay mensajes",
                    textAlign: TextAlign.center,
                  )
                ],
                ..._buildNotificationTodayCards(),
                SizedBox(height: 20.0),
                SectionHeader(title: 'Anteriores'),
                SizedBox(height: 5.0),
                if (messagesBefore.length == 0) ...[
                  Text(
                    "No hay mensajes",
                    textAlign: TextAlign.center,
                  )
                ],
                ..._buildNotificationBeforeCards(),
              ],
            ),
    );
  }

  List<Widget> _buildNotificationTodayCards() {
    return messagesToday.map((message) {
      return NotificationCard(
        icon: Icon(Icons.notifications_none_outlined),
        title: message.category ?? '',
        description: message.content ?? '',
        dateTime: DateTime.parse(message.timestamp.toString()),
      );
    }).toList();
  }

  List<Widget> _buildNotificationBeforeCards() {
    return messagesBefore.map((message) {
      return NotificationCard(
        icon: Icon(Icons.notifications_none_outlined),
        title: message.category ?? '',
        description: message.content ?? '',
        dateTime:
            DateTime.parse(message.timestamp ??= DateTime.now().toString()),
      );
    }).toList();
  }

  Future<void> getMessage(BuildContext context) async {
    Response response = await MesageService().getList(context);
    dynamic res = response.data;

    if (res is List) {
      DateTime currentDate = DateTime.now();
      String formattedDate = DateFormat('yyyy-MM-dd').format(currentDate);
      setState(() {
        messagesToday.clear();
        messagesBefore.clear();
        res.forEach((value) {
          String dateString = value['timestamp'];
          DateTime dateTime = DateTime.parse(dateString);
          String date = DateFormat('yyyy-MM-dd').format(dateTime);

          if (formattedDate == date) {
            messagesToday.add(Message.fromJson(value));
          } else {
            messagesBefore.add(Message.fromJson(value));
          }
        });
        isLoading = false;
      });
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

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}

class NotificationCard extends StatefulWidget {
  final Icon icon;
  final String title;
  final String description;
  final DateTime dateTime;

  const NotificationCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
    required this.dateTime,
  }) : super(key: key);

  @override
  _NotificationCardState createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 0,
        color: _isHovered ? Colors.grey[200] : Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: widget.icon,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        widget.description,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  _formatDateTime(widget.dateTime),
                  style: const TextStyle(
                    fontSize: 12.0,
                    color: Color.fromARGB(255, 61, 59, 59),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _formatDateTime(DateTime dateTime) {
    if (dateTime.isBefore(DateTime.now().subtract(const Duration(days: 1)))) {
      return DateFormat('dd/MM/yyyy').format(dateTime);
    } else {
      return DateFormat('HH:mm').format(dateTime);
    }
  }
}
