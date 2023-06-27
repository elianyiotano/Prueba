import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jogo_mobile_app/models/user.dart';
import 'package:jogo_mobile_app/routes.gr.dart';
import 'package:jogo_mobile_app/services/events.service.dart';
import 'package:jogo_mobile_app/services/user.service.dart';

class RankingPage extends StatefulWidget {
  @override
  _RankingPageState createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {
  final List<User> users = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getRanking(context);
  }

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
          color: Color.fromARGB(255, 3, 19, 123),
        ),
        title: const Row(
          children: [
            Expanded(
              child: Text(
                'Ranking',
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
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView.separated(
                    itemCount: users.length,
                    separatorBuilder: (context, index) => Divider(),
                    itemBuilder: (context, index) {
                      final user = users[index];
                      return ListTile(
                        leading: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '${index+1}.',
                              style: TextStyle(color: Colors.black),
                            ),
                            SizedBox(width: 8),
                            CircleAvatar(
                              backgroundImage: NetworkImage(user.photo ?? ''),
                            ),
                          ],
                        ),
                        title: Text(
                          user.name ?? '',
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
                              '${user.points ?? ''} Pts',
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
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .fontSize,
                                color: Color.fromARGB(255, 57, 56, 56),
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              user.category ?? '',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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

  Future<void> getRanking(context) async {
    if (true) {
      Response response = await UserService().ranking(context);
      dynamic res = response.data;
      print(res);
      if (res['ErrorCode'] == null && res["success"] != "") {
        users.clear();
        res['ranking'].forEach((value) {
          users.add(User.fromJson(value));
        });
        if (mounted) {
          setState(() {
            isLoading = false;
          });
        }
      } else {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${res['message']}'),
            duration: Duration(seconds: 4),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}
