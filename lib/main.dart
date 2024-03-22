import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(10.385852901899867, -84.30905736510198);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'Mapa'),
    Tab(text: 'Lista'),
  ];

  late TabController _tabController;

  
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          title: const Text("Sismos",
              style: TextStyle(fontWeight: FontWeight.bold)),
          actions: const [
            Column(
              children: [FaIcon(FontAwesomeIcons.circleQuestion,color: Colors.orange,), SizedBox()],
            )
          ],
          bottom: TabBar(controller: _tabController, tabs: myTabs, 
          indicatorColor: Colors.orange,labelColor: Colors.orange,),
        ),
        body: TabBarView(controller: _tabController, children: [
          Stack(
            children: [
              GoogleMap(
                mapType: MapType.terrain,
                onMapCreated: _onMapCreated,
                markers: {
                    const Marker(
                      markerId: MarkerId('Campus Pérez Zeledón'),
                      position: LatLng(9.382686321506991, -83.68996031546553),
                    ),
                    const Marker(
                      markerId: MarkerId('Campus Coto'),
                      position: LatLng(8.576107878739412, -82.86658652817965),
                    ),
                    const Marker(
                      markerId: MarkerId('Campus Liberia'),
                      position: LatLng(10.617612286137149, -85.45048459672411),
                    ),
                    const Marker(
                      markerId: MarkerId('Campus Nicoya'),
                      position: LatLng(10.134797494306458, -85.44670874749988),
                    ),
                    const Marker(
                      markerId: MarkerId('Campus Sarapiqui'),
                      position: LatLng(10.319192242799872, -83.92255395750708),
                    ),
                    const Marker(
                      markerId: MarkerId('Campus Omar Dengo'),
                      position: LatLng(9.998944312390936, -84.11190405877555),
                    ),
                    const Marker(
                      markerId: MarkerId('Campus Benjamin Nuñez'),
                      position: LatLng(9.970991357976395, -84.127704731104),
                    ),
                },
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 8,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.orange,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  bottomLeft: Radius.circular(10.0))),
                          child: const TextButton(
                              onPressed: null,
                              child: Row(
                                children: [
                                  Text("24 horas", 
                                  style: TextStyle(color: Colors.white),),
                                  SizedBox(),
                                  Icon(Icons.replay_outlined,color: Colors.white,)
                                ],
                              )),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.black,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0))),
                          child: const TextButton(
                              onPressed: null,
                              child: Row(
                                children: [
                                  Text("15 días",
                                  style: TextStyle(color: Colors.white),),
                                  SizedBox(),
                                  Icon(Icons.date_range,color: Colors.white,)
                                ],
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Center(
            child: Text("2222"),
          ),
        ]),
        bottomNavigationBar: BottomNavigationBar(items: const [
          BottomNavigationBarItem(icon: Icon(Icons.radar), label: "Sismos"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_2_rounded), label: "¿Lo sentiste?"),
          BottomNavigationBarItem(
              icon: Icon(Icons.portrait_rounded), label: "Más"),
        ])
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
