import 'package:audio_player/components/drawer_items.dart';
import 'package:audio_player/models/song.dart';
import 'package:audio_player/provider/play_list_provider.dart';
import 'package:audio_player/screens/song_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // get the play list provider
  late final dynamic playListProvider;

  @override
  void initState() {
    // get playlist provider
    playListProvider = Provider.of<PlayListProvider>(context, listen: false);

    super.initState();
  }

  // go to song
  void goToSong(int songIndex) {
    // update the current song index
    playListProvider.currentSongIndex = songIndex;

    // navigate to song page
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const SongPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(title: const Text('P L A Y L I S T')),
      drawer: const DrawerList(),
      body: Consumer<PlayListProvider>(
        builder: (context, value, child) {
          // get play list
          final List<Song> playList = value.playList;

          // return list view UI
          return ListView.builder(
            itemCount: playList.length,
            itemBuilder: (context, index) {
              final Song song = playList[index];
              return ListTile(
                title: Text(song.songName),
                subtitle: Text(song.artistName),
                leading: Image.asset(song.albumImagePath),
                onTap: () => goToSong(index),
              );
            },
          );
        },
      ),
    );
  }
}
