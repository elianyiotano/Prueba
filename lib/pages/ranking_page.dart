import 'package:flutter/material.dart';

class RankingPage extends StatelessWidget {
  const RankingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const <Widget>[
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/image1.png'),
            ),
            title: Text('Pedro Fernandez'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('450 pts'),
                Text('Tipo A'),
              ],
            ),
            trailing: Icon(Icons.favorite_rounded),
          ),
          Divider(height: 0),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/prueba.png'),
            ),
            title: Text('Sofi Gomez'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('413 pts'),
                Text('Tipo B'),
              ],
            ),
            trailing: Icon(Icons.favorite_rounded),
          ),
          Divider(height: 0),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/prueba.png'),
            ),
            title: Text('Vale Brenes'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('378 pts'),
                Text('Tipo C'),
              ],
            ),
            trailing: Icon(Icons.favorite_rounded),
          ),
          Divider(height: 0),
        ],
      ),
    );
  }
}
