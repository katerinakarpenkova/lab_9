import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';


import 'audio_player_manager.dart';
import 'audio_video_progress_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Музыкальный плеер',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        brightness: Brightness.dark,
      ),
      home: const LogInScreen(title: 'Музыкальный плеер'),
    );
  }
}

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key, required this.title});
  final String title;
  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          const Padding(padding: EdgeInsets.only(top:20)),
          Row(mainAxisAlignment: MainAxisAlignment.center,
              children:const [Text('Вход:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))]),

          const Padding(padding: EdgeInsets.only(top:10)),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children:const [
              SizedBox(
                  width: 156,
                  height: 44,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Логин',
                    ),
                  )
              ),],
          ),

          const Padding(padding: EdgeInsets.only(top:10)),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children:const [
              SizedBox(
                  width: 156,
                  height: 44,
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Пароль',
                    ),
                  )
              ),],
          ),

          const Padding(padding: EdgeInsets.only(top:10)),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: 32,
                  child: ElevatedButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const AlbumsScreen()));
                  },
                      style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all(Colors.white),
                          backgroundColor: MaterialStateProperty.all(Colors.purple)),
                      child: const Text("Aвторизоваться", style: TextStyle(fontSize: 16))
                  )
              )
            ],
          ),

          const Padding(padding: EdgeInsets.only(top:10)),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SignInScreen()));
              },
                  child: const Text('Регистрация',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white,
                          decorationThickness: 1))
              ),
            ],
          ),
        ],
      ),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}

///------------------------Регистрация------------------------///
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('Вернуться на страницу входа')),
      body: Column(
        children: <Widget>[
          const Padding(padding: EdgeInsets.only(top:20)),
          Row(mainAxisAlignment: MainAxisAlignment.center,
              children:const [Text('Регистрация:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))]),

          const Padding(padding: EdgeInsets.only(top:10)),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children:const [
              SizedBox(
                  width: 200,
                  height: 44,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Ваше имя',
                    ),
                  )
              ),],
          ),

          const Padding(padding: EdgeInsets.only(top:10)),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children:const [
              SizedBox(
                  width: 200,
                  height: 44,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Логин',
                    ),
                  )
              ),],
          ),

          const Padding(padding: EdgeInsets.only(top:10)),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children:const [
              SizedBox(
                  width: 200,
                  height: 44,
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Пароль',
                    ),
                  )
              ),],
          ),

          const Padding(padding: EdgeInsets.only(top:10)),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children:const [
              SizedBox(
                  width: 200,
                  height: 44,
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Повторение пароля',
                    ),
                  )
              ),],
          ),

          const Padding(padding: EdgeInsets.only(top:10)),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 32,
                width: 160,
                child: ElevatedButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const AlbumsScreen()));
                },
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(Colors.white),
                        backgroundColor: MaterialStateProperty.all(Colors.purple)),
                    child: const Text("Войти", style: TextStyle(fontSize: 16))
                ),
              )
            ],
          ),
        ],
      ),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}

final List<IconData> icons = [Icons.library_music_outlined, Icons.headset];
///------------------------Альбомы------------------------///
class AlbumsScreen extends StatefulWidget {
  const AlbumsScreen({super.key});

  @override
  State<AlbumsScreen> createState() => _AlbumsScreenState();
}

class _AlbumsScreenState extends State<AlbumsScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          title: const Text('Музыкальный плеер'),
          automaticallyImplyLeading: false),
      body: Column(
        children: <Widget>[
          const Padding(padding: EdgeInsets.only(top:20)),
          Row(mainAxisAlignment: MainAxisAlignment.center,
              children:const [Text('Альбомы:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))]
          ),

          const Padding(padding: EdgeInsets.only(top:10)),
          SizedBox(
            width: 250,
            height: 88,
            child: Card(
              color: Colors.purple[200],
              child: ListTile(
                leading: Icon(icons[0], size: 30.0),
                title: const Text('Альбом 1'),
                subtitle: const Text('Группа 1'),
                trailing: const Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Album1Screen()));
                },
              ),
            ),
          ),

          SizedBox(
            width: 250,
            height: 88,
            child: Card(
              color: Colors.purple[300],
              child: ListTile(
                leading: Icon(icons[0], size: 30.0),
                title: const Text('Альбом 2'),
                subtitle: const Text('Группа 2'),
                trailing: const Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Album2Screen()));
                },
              ),
            ),
          ),

          SizedBox(
            width: 250,
            height: 88,
            child: Card(
              color: Colors.purple[400],
              child: ListTile(
                leading: Icon(icons[0], size: 30.0),
                title: const Text('Альбом 3'),
                subtitle: const Text('Группа 3'),
                trailing: const Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Album3Screen()));
                },
              ),
            ),
          ),

          SizedBox(
            width: 250,
            height: 88,
            child: Card(
              color: Colors.purple[500],
              child: ListTile(
                leading: Icon(icons[0], size: 30.0),
                title: const Text('Альбом 4'),
                subtitle: const Text('Группа 4'),
                trailing: const Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Album4Screen()));
                },
              ),
            ),
          ),
        ],
      ),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}

///------------------------Альбом1------------------------///
class Album1Screen extends StatefulWidget {
  const Album1Screen({super.key});

  @override
  State<Album1Screen> createState() => _Album1ScreenState();
}

class _Album1ScreenState extends State<Album1Screen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          title: const Text('Вернуться обратно к списку альбомов')),
      body: Column(
        children: <Widget>[
          const Padding(padding: EdgeInsets.only(top:20)),
          Row(mainAxisAlignment: MainAxisAlignment.center,
              children:const [Text('Альбом 1:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))]
          ),

          const Padding(padding: EdgeInsets.only(top:10)),
          SizedBox(
            width: 450,
            child: Card(
              color: Colors.purple[200],
              child: ListTile(
                leading: Icon(icons[1], size: 30.0),
                title: const Text('Трек 1'),
                //subtitle: const Text('Группа 1'),
                trailing: const Icon(Icons.multitrack_audio),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Track1Screen()));
                },
              ),
            ),
          ),

          SizedBox(
            width: 450,
            child: Card(
              color: Colors.purple[300],
              child: ListTile(
                leading: Icon(icons[1], size: 30.0),
                title: const Text('Трек 2'),
                //subtitle: const Text('Группа 1'),
                trailing: const Icon(Icons.multitrack_audio),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Track2Screen()));
                },
              ),
            ),
          ),

          SizedBox(
            width: 450,
            child: Card(
              color: Colors.purple[400],
              child: ListTile(
                leading: Icon(icons[1], size: 30.0),
                title: const Text('Трек 3'),
                //subtitle: const Text('Группа 1'),
                trailing: const Icon(Icons.multitrack_audio),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Track3Screen()));
                },
              ),
            ),
          ),

          SizedBox(
            width: 450,
            child: Card(
              color: Colors.purple[500],
              child: ListTile(
                leading: Icon(icons[1], size: 30.0),
                title: const Text('Трек 4'),
                //subtitle: const Text('Группа 1'),
                trailing: const Icon(Icons.multitrack_audio),
                onTap: () {
                  // Заглушка, где необходимо указать действие после клика
                },
              ),
            ),
          ),
        ],
      ),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}

///------------------------Альбом2------------------------///
class Album2Screen extends StatefulWidget {
  const Album2Screen({super.key});

  @override
  State<Album2Screen> createState() => _Album2ScreenState();
}

class _Album2ScreenState extends State<Album2Screen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          title: const Text('Вернуться обратно к списку альбомов')),
      body: Column(
        children: <Widget>[
          const Padding(padding: EdgeInsets.only(top:20)),
          Row(mainAxisAlignment: MainAxisAlignment.center,
              children:const [Text('Альбом 2:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))]
          ),

          const Padding(padding: EdgeInsets.only(top:10)),
          SizedBox(
            width: 450,
            child: Card(
              color: Colors.purple[200],
              child: ListTile(
                leading: Icon(icons[1], size: 30.0),
                title: const Text('Трек 1'),
                //subtitle: const Text('Группа 1'),
                trailing: const Icon(Icons.multitrack_audio),
                onTap: () {
                  // Заглушка, где необходимо указать действие после клика
                },
              ),
            ),
          ),

          SizedBox(
            width: 450,
            child: Card(
              color: Colors.purple[300],
              child: ListTile(
                leading: Icon(icons[1], size: 30.0),
                title: const Text('Трек 2'),
                //subtitle: const Text('Группа 1'),
                trailing: const Icon(Icons.multitrack_audio),
                onTap: () {
                  // Заглушка, где необходимо указать действие после клика
                },
              ),
            ),
          ),

          SizedBox(
            width: 450,
            child: Card(
              color: Colors.purple[400],
              child: ListTile(
                leading: Icon(icons[1], size: 30.0),
                title: const Text('Трек 3'),
                //subtitle: const Text('Группа 1'),
                trailing: const Icon(Icons.multitrack_audio),
                onTap: () {
                  // Заглушка, где необходимо указать действие после клика
                },
              ),
            ),
          ),

          SizedBox(
            width: 450,
            child: Card(
              color: Colors.purple[500],
              child: ListTile(
                leading: Icon(icons[1], size: 30.0),
                title: const Text('Трек 4'),
                //subtitle: const Text('Группа 1'),
                trailing: const Icon(Icons.multitrack_audio),
                onTap: () {
                  // Заглушка, где необходимо указать действие после клика
                },
              ),
            ),
          ),
        ],
      ),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}

///------------------------Альбом3------------------------///
class Album3Screen extends StatefulWidget {
  const Album3Screen({super.key});

  @override
  State<Album3Screen> createState() => _Album3ScreenState();
}

class _Album3ScreenState extends State<Album3Screen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          title: const Text('Вернуться обратно к списку альбомов')),
      body: Column(
        children: <Widget>[
          const Padding(padding: EdgeInsets.only(top:20)),
          Row(mainAxisAlignment: MainAxisAlignment.center,
              children:const [Text('Альбом 3:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))]
          ),

          const Padding(padding: EdgeInsets.only(top:10)),
          SizedBox(
            width: 450,
            child: Card(
              color: Colors.purple[200],
              child: ListTile(
                leading: Icon(icons[1], size: 30.0),
                title: const Text('Трек 1'),
                //subtitle: const Text('Группа 1'),
                trailing: const Icon(Icons.multitrack_audio),
                onTap: () {
                  // Заглушка, где необходимо указать действие после клика
                },
              ),
            ),
          ),

          SizedBox(
            width: 450,
            child: Card(
              color: Colors.purple[300],
              child: ListTile(
                leading: Icon(icons[1], size: 30.0),
                title: const Text('Трек 2'),
                //subtitle: const Text('Группа 1'),
                trailing: const Icon(Icons.multitrack_audio),
                onTap: () {
                  // Заглушка, где необходимо указать действие после клика
                },
              ),
            ),
          ),

          SizedBox(
            width: 450,
            child: Card(
              color: Colors.purple[400],
              child: ListTile(
                leading: Icon(icons[1], size: 30.0),
                title: const Text('Трек 3'),
                //subtitle: const Text('Группа 1'),
                trailing: const Icon(Icons.multitrack_audio),
                onTap: () {
                  // Заглушка, где необходимо указать действие после клика
                },
              ),
            ),
          ),

          SizedBox(
            width: 450,
            child: Card(
              color: Colors.purple[500],
              child: ListTile(
                leading: Icon(icons[1], size: 30.0),
                title: const Text('Трек 4'),
                //subtitle: const Text('Группа 1'),
                trailing: const Icon(Icons.multitrack_audio),
                onTap: () {
                  // Заглушка, где необходимо указать действие после клика
                },
              ),
            ),
          ),
        ],
      ),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}

///------------------------Альбом4------------------------///
class Album4Screen extends StatefulWidget {
  const Album4Screen({super.key});

  @override
  State<Album4Screen> createState() => _Album4ScreenState();
}

class _Album4ScreenState extends State<Album4Screen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          title: const Text('Вернуться обратно к списку альбомов')),
      body: Column(
        children: <Widget>[
          const Padding(padding: EdgeInsets.only(top:20)),
          Row(mainAxisAlignment: MainAxisAlignment.center,
              children:const [Text('Альбом 4:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))]
          ),

          const Padding(padding: EdgeInsets.only(top:10)),
          SizedBox(
            width: 450,
            child: Card(
              color: Colors.purple[200],
              child: ListTile(
                leading: Icon(icons[1], size: 30.0),
                title: const Text('Трек 1'),
                //subtitle: const Text('Группа 1'),
                trailing: const Icon(Icons.multitrack_audio),
                onTap: () {
                  // Заглушка, где необходимо указать действие после клика
                },
              ),
            ),
          ),

          SizedBox(
            width: 450,
            child: Card(
              color: Colors.purple[300],
              child: ListTile(
                leading: Icon(icons[1], size: 30.0),
                title: const Text('Трек 2'),
                //subtitle: const Text('Группа 1'),
                trailing: const Icon(Icons.multitrack_audio),
                onTap: () {
                  // Заглушка, где необходимо указать действие после клика
                },
              ),
            ),
          ),

          SizedBox(
            width: 450,
            child: Card(
              color: Colors.purple[400],
              child: ListTile(
                leading: Icon(icons[1], size: 30.0),
                title: const Text('Трек 3'),
                //subtitle: const Text('Группа 1'),
                trailing: const Icon(Icons.multitrack_audio),
                onTap: () {
                  // Заглушка, где необходимо указать действие после клика
                },
              ),
            ),
          ),

          SizedBox(
            width: 450,
            child: Card(
              color: Colors.purple[500],
              child: ListTile(
                leading: Icon(icons[1], size: 30.0),
                title: const Text('Трек 4'),
                //subtitle: const Text('Группа 1'),
                trailing: const Icon(Icons.multitrack_audio),
                onTap: () {
                  // Заглушка, где необходимо указать действие после клика
                },
              ),
            ),
          ),
        ],
      ),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}

class Track1Screen extends StatefulWidget {
  const Track1Screen({Key? key}) : super(key: key);

  @override
  State<Track1Screen> createState() => _Track1ScreenState();
}

class _Track1ScreenState extends State<Track1Screen> {
  late AudioPlayerManager1 manager;

  @override
  void initState() {
    super.initState();
    manager = AudioPlayerManager1();
    manager.init();
  }

  @override
  void dispose() {
    manager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FullExample1(audioPlayerManager: manager);
  }
}

class FullExample1 extends StatefulWidget {
  const FullExample1({
    Key? key,
    required this.audioPlayerManager,
  }) : super(key: key);

  final AudioPlayerManager1 audioPlayerManager;

  @override
  State<FullExample1> createState() => _FullExample1State();
}

class _FullExample1State extends State<FullExample1> {
  final _labelLocation = TimeLabelLocation.below;
  final _labelType = TimeLabelType.remainingTime;
  final _thumbRadius = 10.0;
  final _labelPadding = 8.0;
  final _barHeight = 4.0;
  final _barCapShape = BarCapShape.round;
  final _thumbCanPaintOutsideBar = true;

  @override
  void initState() {
    super.initState();
    widget.audioPlayerManager.init();
  }

  @override
  void dispose() {
    widget.audioPlayerManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Вернуться обратно к списку треков')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset("images/1.jpg",
                  width: 500,
                  height: 250,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Название трека',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Группа',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                child: _progressBar(),
              ),
              const SizedBox(height: 20),
              _playButton(),
            ],
          ),
        ),
      ),
    );
  }

  StreamBuilder<DurationState1> _progressBar() {
    return StreamBuilder<DurationState1>(
      stream: widget.audioPlayerManager.durationState1,
      builder: (context, snapshot) {
        final durationState = snapshot.data;
        final progress = durationState?.progress ?? Duration.zero;
        final buffered = durationState?.buffered ?? Duration.zero;
        final total = durationState?.total ?? Duration.zero;
        return ProgressBar(
          progress: progress,
          buffered: buffered,
          total: total,
          onSeek: widget.audioPlayerManager.player.seek,
          onDragUpdate: (details) {
            debugPrint('${details.timeStamp}, ${details.localPosition}');
          },
          barHeight: _barHeight,
          barCapShape: _barCapShape,
          thumbRadius: _thumbRadius,
          thumbCanPaintOutsideBar: _thumbCanPaintOutsideBar,
          timeLabelLocation: _labelLocation,
          timeLabelType: _labelType,
          timeLabelPadding: _labelPadding,
        );
      },
    );
  }

  StreamBuilder<PlayerState> _playButton() {
    return StreamBuilder<PlayerState>(
      stream: widget.audioPlayerManager.player.playerStateStream,
      builder: (context, snapshot) {
        final playerState = snapshot.data;
        final processingState = playerState?.processingState;
        final playing = playerState?.playing;
        if (processingState == ProcessingState.loading ||
            processingState == ProcessingState.buffering) {
          return Container(
            //margin: const EdgeInsets.all(8.0),
            width: 35.0,
            height: 35.0,

            child: const CircularProgressIndicator(
            ),
          );
        } else if (playing != true) {
          return CircleAvatar(
            backgroundColor: Colors.purple,
            radius: 35,
            child: IconButton(
              icon: const Icon(Icons.play_arrow),
              iconSize: 35.0,
              color: Colors.white,
              onPressed: widget.audioPlayerManager.player.play,
            ),
          );
        } else if (processingState != ProcessingState.completed) {
          return CircleAvatar(
            backgroundColor: Colors.purple,
            radius: 35,
            child: IconButton(
              icon: const Icon(Icons.pause),
              iconSize: 35.0,
              color: Colors.white,
              onPressed: widget.audioPlayerManager.player.pause,
            ),
          );
        } else {
          return CircleAvatar(
            backgroundColor: Colors.purple,
            radius: 35,
            child: IconButton(
              icon: const Icon(Icons.replay),
              iconSize: 35.0,
              color: Colors.white,
              onPressed: () =>
                  widget.audioPlayerManager.player.seek(Duration.zero),
            ),
          );
        }
      },
    );
  }
}

class Track2Screen extends StatefulWidget {
  const Track2Screen({Key? key}) : super(key: key);

  @override
  State<Track2Screen> createState() => _Track2ScreenState();
}

class _Track2ScreenState extends State<Track2Screen> {
  late AudioPlayerManager2 manager;

  @override
  void initState() {
    super.initState();
    manager = AudioPlayerManager2();
    manager.init();
  }

  @override
  void dispose() {
    manager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FullExample2(audioPlayerManager: manager);
  }
}

class FullExample2 extends StatefulWidget {
  const FullExample2({
    Key? key,
    required this.audioPlayerManager,
  }) : super(key: key);

  final AudioPlayerManager2 audioPlayerManager;

  @override
  State<FullExample2> createState() => _FullExample2State();
}

class _FullExample2State extends State<FullExample2> {
  final _labelLocation = TimeLabelLocation.below;
  final _labelType = TimeLabelType.remainingTime;
  final _thumbRadius = 10.0;
  final _labelPadding = 8.0;
  final _barHeight = 4.0;
  final _barCapShape = BarCapShape.round;
  final _thumbCanPaintOutsideBar = true;

  @override
  void initState() {
    super.initState();
    widget.audioPlayerManager.init();
  }

  @override
  void dispose() {
    widget.audioPlayerManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Вернуться обратно к списку треков')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset("images/2.jpg",
                  width: 500,
                  height: 250,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Название трека',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Группа',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                child: _progressBar(),
              ),
              const SizedBox(height: 20),
              _playButton(),
            ],
          ),
        ),
      ),
    );
  }

  StreamBuilder<DurationState2> _progressBar() {
    return StreamBuilder<DurationState2>(
      stream: widget.audioPlayerManager.durationState2,
      builder: (context, snapshot) {
        final durationState = snapshot.data;
        final progress = durationState?.progress ?? Duration.zero;
        final buffered = durationState?.buffered ?? Duration.zero;
        final total = durationState?.total ?? Duration.zero;
        return ProgressBar(
          progress: progress,
          buffered: buffered,
          total: total,
          onSeek: widget.audioPlayerManager.player.seek,
          onDragUpdate: (details) {
            debugPrint('${details.timeStamp}, ${details.localPosition}');
          },
          barHeight: _barHeight,
          barCapShape: _barCapShape,
          thumbRadius: _thumbRadius,
          thumbCanPaintOutsideBar: _thumbCanPaintOutsideBar,
          timeLabelLocation: _labelLocation,
          timeLabelType: _labelType,
          timeLabelPadding: _labelPadding,
        );
      },
    );
  }

  StreamBuilder<PlayerState> _playButton() {
    return StreamBuilder<PlayerState>(
      stream: widget.audioPlayerManager.player.playerStateStream,
      builder: (context, snapshot) {
        final playerState = snapshot.data;
        final processingState = playerState?.processingState;
        final playing = playerState?.playing;
        if (processingState == ProcessingState.loading ||
            processingState == ProcessingState.buffering) {
          return Container(
            //margin: const EdgeInsets.all(8.0),
            width: 35.0,
            height: 35.0,

            child: const CircularProgressIndicator(
            ),
          );
        } else if (playing != true) {
          return CircleAvatar(
            backgroundColor: Colors.purple,
            radius: 35,
            child: IconButton(
              icon: const Icon(Icons.play_arrow),
              iconSize: 35.0,
              color: Colors.white,
              onPressed: widget.audioPlayerManager.player.play,
            ),
          );
        } else if (processingState != ProcessingState.completed) {
          return CircleAvatar(
            backgroundColor: Colors.purple,
            radius: 35,
            child: IconButton(
              icon: const Icon(Icons.pause),
              iconSize: 35.0,
              color: Colors.white,
              onPressed: widget.audioPlayerManager.player.pause,
            ),
          );
        } else {
          return CircleAvatar(
            backgroundColor: Colors.purple,
            radius: 35,
            child: IconButton(
              icon: const Icon(Icons.replay),
              iconSize: 35.0,
              color: Colors.white,
              onPressed: () =>
                  widget.audioPlayerManager.player.seek(Duration.zero),
            ),
          );
        }
      },
    );
  }
}

class Track3Screen extends StatefulWidget {
  const Track3Screen({Key? key}) : super(key: key);

  @override
  State<Track3Screen> createState() => _Track3ScreenState();
}

class _Track3ScreenState extends State<Track3Screen> {
  late AudioPlayerManager3 manager;

  @override
  void initState() {
    super.initState();
    manager = AudioPlayerManager3();
    manager.init();
  }

  @override
  void dispose() {
    manager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FullExample3(audioPlayerManager: manager);
  }
}

class FullExample3 extends StatefulWidget {
  const FullExample3({
    Key? key,
    required this.audioPlayerManager,
  }) : super(key: key);

  final AudioPlayerManager3 audioPlayerManager;

  @override
  State<FullExample3> createState() => _FullExample3State();
}

class _FullExample3State extends State<FullExample3> {
  final _labelLocation = TimeLabelLocation.below;
  final _labelType = TimeLabelType.remainingTime;
  final _thumbRadius = 10.0;
  final _labelPadding = 8.0;
  final _barHeight = 4.0;
  final _barCapShape = BarCapShape.round;
  final _thumbCanPaintOutsideBar = true;

  @override
  void initState() {
    super.initState();
    widget.audioPlayerManager.init();
  }

  @override
  void dispose() {
    widget.audioPlayerManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Вернуться обратно к списку треков')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset("images/3.jpg",
                  width: 500,
                  height: 250,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Название трека',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Группа',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                child: _progressBar(),
              ),
              const SizedBox(height: 20),
              _playButton(),
            ],
          ),
        ),
      ),
    );
  }

  StreamBuilder<DurationState3> _progressBar() {
    return StreamBuilder<DurationState3>(
      stream: widget.audioPlayerManager.durationState3,
      builder: (context, snapshot) {
        final durationState = snapshot.data;
        final progress = durationState?.progress ?? Duration.zero;
        final buffered = durationState?.buffered ?? Duration.zero;
        final total = durationState?.total ?? Duration.zero;
        return ProgressBar(
          progress: progress,
          buffered: buffered,
          total: total,
          onSeek: widget.audioPlayerManager.player.seek,
          onDragUpdate: (details) {
            debugPrint('${details.timeStamp}, ${details.localPosition}');
          },
          barHeight: _barHeight,
          barCapShape: _barCapShape,
          thumbRadius: _thumbRadius,
          thumbCanPaintOutsideBar: _thumbCanPaintOutsideBar,
          timeLabelLocation: _labelLocation,
          timeLabelType: _labelType,
          timeLabelPadding: _labelPadding,
        );
      },
    );
  }

  StreamBuilder<PlayerState> _playButton() {
    return StreamBuilder<PlayerState>(
      stream: widget.audioPlayerManager.player.playerStateStream,
      builder: (context, snapshot) {
        final playerState = snapshot.data;
        final processingState = playerState?.processingState;
        final playing = playerState?.playing;
        if (processingState == ProcessingState.loading ||
            processingState == ProcessingState.buffering) {
          return Container(
            width: 35.0,
            height: 35.0,
            child: const CircularProgressIndicator(
            ),
          );
        } else if (playing != true) {
          return CircleAvatar(
            backgroundColor: Colors.purple,
            radius: 35,
            child: IconButton(
              icon: const Icon(Icons.play_arrow),
              iconSize: 35.0,
              color: Colors.white,
              onPressed: widget.audioPlayerManager.player.play,
            ),
          );
        } else if (processingState != ProcessingState.completed) {
          return CircleAvatar(
            backgroundColor: Colors.purple,
            radius: 35,
            child: IconButton(
              icon: const Icon(Icons.pause),
              iconSize: 35.0,
              color: Colors.white,
              onPressed: widget.audioPlayerManager.player.pause,
            ),
          );
        } else {
          return CircleAvatar(
            backgroundColor: Colors.purple,
            radius: 35,
            child: IconButton(
              icon: const Icon(Icons.replay),
              iconSize: 35.0,
              color: Colors.white,
              onPressed: () =>
                  widget.audioPlayerManager.player.seek(Duration.zero),
            ),
          );
        }
      },
    );
  }
}
