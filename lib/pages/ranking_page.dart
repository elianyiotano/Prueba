import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jogo_mobile_app/models/user.dart';
import 'package:jogo_mobile_app/services/user.service.dart';
import 'package:jogo_mobile_app/widgets/failed_modal.dart';

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
          color: Colors.green,
        ),
        title: const Text(
          'Clasificación',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (users.length == 0)
                  Text(
                    "No hay un ranking disponible",
                    textAlign: TextAlign.center,
                  ),
                Expanded(
                  child: ListView.separated(
                    itemCount: users.length,
                    separatorBuilder: (context, index) => Divider(),
                    itemBuilder: (context, index) {
                      final user = users[index];
                      // Formateamos el índice con un tamaño fijo de dos caracteres
                      final formattedIndex =
                          '${(index + 1).toString().padLeft(2, '0')}';
                      return ListTile(
                        leading: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width:
                                  40, // Ancho del índice para que sea uniforme
                              child: Text(
                                '$formattedIndex.',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily:
                                        'monospace'), // Usamos una fuente de ancho fijo (monospace)
                              ),
                            ),
                            SizedBox(width: 8),
                            CircleAvatar(
                              backgroundImage: NetworkImage(user
                                      .profilePhotoUrl ??
                                  'https://pimedelaar.org/wp-content/uploads/2023/05/no-image.png'),
                            ),
                          ],
                        ),
                        title: Text(
                          "${user.firstName} ${user.lastName1}" ?? '',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
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

      if (res is List) {
        users.clear();
        res.forEach((value) {
          users.add(User.fromJson(value));
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
}
