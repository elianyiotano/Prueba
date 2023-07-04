import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:jogo_mobile_app/models/coupon.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatelessWidget {
  final Coupon coupon;

  DetailPage({required this.coupon});

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
                  return CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                  );
                } else if (snapshot.hasError) {
                  return Text('Fallo al cargar la imagen');
                } else {
                  return Image.network(
                    coupon.image ?? '',
                    fit: BoxFit.cover,
                    width: 1000,
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
                    coupon.name ?? '',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFF2FFF2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 8,
                        ),
                        child: Text(
                          "${_formatDate(coupon.validFrom)} - ${_formatDate(coupon.validUntil)}" ??
                              '',
                          style: TextStyle(
                            color: const Color(0xFF0F511D),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFF2FFF2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 8,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      coupon.venue ?? '',
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
                    coupon.description ?? '',
                    textAlign: TextAlign.justify,
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
    if (coupon.image != null) {
      await precacheImage(NetworkImage(coupon.image!), context);
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
