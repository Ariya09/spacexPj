import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter/bloc/launch_list_bloc.dart';
import 'package:flutter_counter/models/spacexLatest/spacex_latest.dart';
import 'package:flutter_counter/repositoey/option.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LaunchListScreen extends StatefulWidget {
  const LaunchListScreen({Key? key}) : super(key: key);

  @override
  State<LaunchListScreen> createState() => _LaunchListScreenState();
}

class _LaunchListScreenState extends State<LaunchListScreen> {
  LaunchSortOption _selectedSortOption = LaunchSortOption.name;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<LaunchListBloc>(context).add(FetchLaunchesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SpaceX Launches ',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(213, 5, 13, 158),
        centerTitle: true,
      ),
      body: BlocBuilder<LaunchListBloc, LaunchListState>(
        builder: (context, state) {
          if (state is LoadingLaunchListState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is SuccessLaunchListState) {
            final launches = state.launches;
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: SearchBar(
                    leading: const Icon(Icons.search),
                    overlayColor: MaterialStateProperty.all(Colors.blue),
                    hintText: 'Search Launch..',
                    shape: MaterialStateProperty.all(
                        const ContinuousRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20)))),
                    onChanged: (query) =>
                        BlocProvider.of<LaunchListBloc>(context)
                            .add(SearchLaunchEvent(query)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      DropdownButton<LaunchSortOption>(
                        value: _selectedSortOption,
                        dropdownColor: Colors.grey[100],
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                        items: buildDropdownMenuItems(),
                        onChanged: (value) {
                          setState(() {
                            _selectedSortOption = value!;
                            BlocProvider.of<LaunchListBloc>(context)
                                .add(SortLaunchesEvent(value));
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: launches.length,
                    itemBuilder: (context, index) {
                      final launch = launches[index];
                      return LaunchListItem(launch: launch);
                    },
                  ),
                ),
              ],
            );
          } else if (state is ErrorLaunchListState) {
            return Center(child: Text(state.error));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

class LaunchListItem extends StatelessWidget {
  final SpacexLatest launch;

  const LaunchListItem({Key? key, required this.launch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      child: Card(
        margin: EdgeInsets.all(8.0),
        color: Colors.blue[50],
        child: ListTile(
          leading: _buildLaunchImage(),
          title: Text(launch.name ?? 'N/A'),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Launch Time: ${launch.dateUtc?.toLocal()}'),
              Text('State: ${launch.success ?? false}'),
            ],
          ),
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => LaunchDetail(launch: launch),
            //   ),
            // );
            BlocProvider.of<LaunchListBloc>(context)
                .add(LaunchDetailEvent(launch: launch.id.toString()));

            Modular.to.navigate('/testRT');
            // print('tttt');
          },
        ),
      ),
    );
  }

  Widget _buildLaunchImage() {
    final imageUrl = launch.links?.patch?.small;

    if (imageUrl != null && Uri.tryParse(imageUrl) != null) {
      return Image.network(
        imageUrl.toString(),
        width: 48.0,
        height: 48.0,
        fit: BoxFit.cover,
      );
    } else {
      return Image.asset(
        'assets/img_backup.png', // Replace with your placeholder image asset
        width: 48.0,
        height: 48.0,
        fit: BoxFit.cover,
      );
    }
  }
}
