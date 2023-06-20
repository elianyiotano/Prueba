// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: [
          Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Text('Notificaciones',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                    height: 30.0 / 22.0,
                  ))),
          SectionHeader(title: 'Hoy'),
          SizedBox(height: 5.0),
          NotificationCard(
            icon: Icon(Icons.notifications_none_outlined),
            title: 'Notificación 1',
            description: 'Descripción de la notificación 1',
            dateTime: DateTime.now(),
          ),
          SizedBox(height: 5.0),
          NotificationCard(
            icon: Icon(Icons.notifications_none_outlined),
            title: 'Notificación 2',
            description: 'Descripción de la notificación 2',
            dateTime: DateTime.now(),
          ),
          SizedBox(height: 5.0),
          SectionHeader(title: 'Anteriores'),
          SizedBox(height: 5.0),
          NotificationCard(
            icon: Icon(Icons.notifications_none_outlined),
            title: 'Notificación 3',
            description: 'Descripción de la notificación 3',
            dateTime: DateTime.now().subtract(Duration(days: 1)),
          ),
          SizedBox(height: 5.0),
          NotificationCard(
            icon: Icon(Icons.notifications_none_outlined),
            title: 'Notificación 4',
            description: 'Descripción de la notificación 4',
            dateTime: DateTime.now().subtract(Duration(days: 2)),
          ),
          SizedBox(height: 5.0),
          NotificationCard(
            icon: Icon(Icons.notifications_none_outlined),
            title: 'Notificación 5',
            description: 'Descripción de la notificación 4',
            dateTime: DateTime.now().subtract(Duration(days: 2)),
          ),
          SizedBox(height: 5.0),
          NotificationCard(
            icon: Icon(Icons.notifications_none_outlined),
            title: 'Notificación 6',
            description: 'Descripción de la notificación 4',
            dateTime: DateTime.now().subtract(Duration(days: 2)),
          ),
        ],
      ),
    );
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
      return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    } else {
      return '${dateTime.hour}:${dateTime.minute}';
    }
  }
}
