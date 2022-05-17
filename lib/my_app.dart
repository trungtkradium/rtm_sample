import 'package:flutter/material.dart';
import 'package:manabie_rtm/rtm/manabie_rtm_engine.dart';
import 'package:manabie_rtm/rtm/model/rtm_enum.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, @required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final rtmEngine = ManabieRtmEngine();

  @override
  void initState() {
    super.initState();
  }

  Future<void> _initRtm(String appId, userId, token, channelId) async {
    rtmEngine.initClient(appId);
    rtmEngine.onJoinChannelResult = (result) {};

    rtmEngine.onConnectionStateChanged = (state, reason) async {
      if (state == RtmConnectionState.connected) {
        await rtmEngine.createChannel(channelId);
        await rtmEngine.joinChannel();
      }
      print("=============");
      print("===== $state");
      print("===== $reason");
      print("=============");
    };

    await Future.delayed(const Duration(seconds: 3));
    await rtmEngine.login(
      token,
      userId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: const Key('Init'),
        onPressed: () async {
          await _initRtm('5ad3e63119614598be794deba2212ed5',
              'TeacherId 0Lesson 0', '', 'Lesson 0');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
