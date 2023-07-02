import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jogo_mobile_app/models/coupon.dart';
import 'package:jogo_mobile_app/routes.gr.dart';
import 'package:jogo_mobile_app/services/coupons.service.dart';
import 'package:intl/intl.dart';
import 'package:jogo_mobile_app/widgets/failed_modal.dart';

class CouponsPage extends StatefulWidget {
  @override
  _CouponsPageState createState() => _CouponsPageState();
}

class _CouponsPageState extends State<CouponsPage> {
  List<Coupon> coupons = [];

  @override
  void initState() {
    super.initState();
    getCouponList();
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
                'Descuentos',
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
            itemCount: coupons.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildEventTile(coupons[index]);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildEventTile(Coupon coupon) {
    return GestureDetector(
      onTap: () {
        _navigateToEventDetail(coupon);
      },
      child: Container(
        height: 200,
        width: double.infinity,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11.0),
          image: DecorationImage(
            image: NetworkImage(coupon.image ??
                'https://blog.mailup.es/wp-content/uploads/2018/01/evento-cover.jpg'),
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
                  color: const Color.fromARGB(255, 2, 49, 87),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Text(
                  "${_formatDate(coupon.validFrom)}" ?? '',
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
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(11.0),
                ),
                child: Text(
                  coupon.name ?? '',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToEventDetail(Coupon coupon) {
    AutoRouter.of(context).push(DetailRoute(coupon: coupon));
  }

  Future<void> getCouponList() async {
    if (true) {
      Response response = await CouponService().getList(context);
      dynamic res = response.data;
      print(res);
      if (res is List) {
        coupons.clear();
        res.forEach((value) {
          coupons.add(Coupon.fromJson(value));
        });
        print(coupons[1].image);
        if (mounted) {
          setState(() {});
        }
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return FailedModal(
              title: 'Ha ocurrido un error',
              description: '${res['error']}',
            );
          },
        );
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
