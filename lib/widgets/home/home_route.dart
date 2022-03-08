import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_stu/common/Git.dart';
import 'package:test_stu/generated/l10n.dart';
import 'package:test_stu/models/index.dart';
import 'package:test_stu/states/UserModel.dart';
import 'package:test_stu/widgets/home/my_drawer.dart';
import 'repo_item.dart';

class HomeRoute extends StatefulWidget {
  const HomeRoute({Key? key}) : super(key: key);

  @override
  _HomeRouteState createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  List<Repo> _lists = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).home)),
      body: _buildBody(),
      drawer: MyDrawer(),
    );
  }

  Widget _buildBody() {
    UserModel userModel = Provider.of<UserModel>(context);
    if (!userModel.isLogin) {
      return Center(
        child: ElevatedButton(
            child: Text(S.of(context).login),
            onPressed: () {
              Navigator.of(context).pushNamed('login');
            }),
      );
    } else {
      return Column(
        children: [
          ElevatedButton(
              onPressed: () {
                _retrieveData();
              },
              child: Text('加载数据')),
          Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    _retrieveData();

                    // if (_lists[index].name == loadingTag) {
                    //   if (hasMore) {
                    //     return Container(
                    //       padding: const EdgeInsets.all(16),
                    //       alignment: Alignment.center,
                    //       child: const SizedBox(
                    //         width: 24,
                    //         height: 24,
                    //         child: CircularProgressIndicator(strokeWidth: 2.0),
                    //       ),
                    //     );
                    //   } else {
                    //     return Container(
                    //       alignment: Alignment.center,
                    //       padding: const EdgeInsets.all(16),
                    //       child: Text(
                    //         S.of(context).no_more,
                    //         style: const TextStyle(color: Colors.grey),
                    //       ),
                    //     );
                    //   }
                    // }
                    return RepoItem(_lists[index]);
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(height: .0);
                  },
                  itemCount: _lists.length))
        ],
      );
    }
  }

  int page = 1;

  bool hasMore = false;

  String loadingTag = '';

  void _retrieveData() async {
    var data = await Git(context)
        .getRepos(queryParameters: {'page': page, 'page_size': 20});

    hasMore = data.length > 0 && data.length % 20 == 0;
    setState(() {
      _lists.insertAll(0, data);
      page++;
    });
  }
}
