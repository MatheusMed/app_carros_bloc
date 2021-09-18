import 'package:app_carros/model/user_model.dart';
import 'package:app_carros/pages/login_page.dart';
import 'package:app_carros/utils/nav.dart';
import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {
  _header(snap) {
    return UserAccountsDrawerHeader(
      accountName: Text(snap.data!.nome!),
      accountEmail: Text(snap.data!.email!),
      currentAccountPicture: CircleAvatar(
        backgroundImage: NetworkImage(snap.data!.urlFoto!),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Future<UserModel?> future = UserModel.get();

    return Drawer(
      child: ListView(
        children: <Widget>[
          FutureBuilder(
            future: future,
            builder: (context, snap) {
              if (snap.hasData) {
                return _header(snap);
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text("Favoritos"),
            subtitle: Text("mais informações..."),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              print("Item 1");
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text("Ajuda"),
            subtitle: Text("mais informações..."),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              print("Item 1");
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Logout"),
            trailing: Icon(Icons.arrow_forward),
            onTap: () => _onClickLogout(context),
          )
        ],
      ),
    );
  }

  _onClickLogout(context) {
    Navigator.pop(context);

    UserModel.clean();
    push(context, LoginPage(), replecement: true);
  }
}
