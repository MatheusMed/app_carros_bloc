import 'package:app_carros/pages/carros_list_view.dart';
import 'package:app_carros/pages/carros_pages.dart';
import 'package:app_carros/services/carro_api.dart';
import 'package:app_carros/utils/prefs.dart';
import 'package:app_carros/widgets/drawer_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin<HomePage> {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _iniTabs();
  }

  _iniTabs() async {
    _tabController = TabController(length: 3, vsync: this);
    int? tabIdx = await Prefs.getInt("tabIdx");

    setState(() {
      _tabController!.index = tabIdx!;
    });

    _tabController!.addListener(() {
      Prefs.setInt("tabIdx", _tabController!.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Classicos'),
            Tab(text: 'Esportivos'),
            Tab(text: 'Luxo'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          CarrosPage(tipo: TipoCarro.classicos),
          CarrosPage(tipo: TipoCarro.esportivos),
          CarrosPage(tipo: TipoCarro.luxo),
        ],
      ),
      drawer: DrawerList(),
    );
  }
}
