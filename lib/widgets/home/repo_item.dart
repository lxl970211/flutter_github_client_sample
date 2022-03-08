import 'package:flutter/material.dart';
import 'package:test_stu/common/global_widget.dart';
import 'package:test_stu/models/index.dart';
import 'package:test_stu/generated/l10n.dart';

class RepoItem extends StatefulWidget {
  RepoItem(this._repo) : super(key: ValueKey(_repo.id));

  final Repo _repo;

  @override
  _RepoItemState createState() => _RepoItemState();
}

class _RepoItemState extends State<RepoItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Material(
          color: Colors.white,
          // shape: BorderDirectional(
          //     bottom:
          //         BorderSide(width: .5, color: Theme.of(context).dividerColor)),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  dense: true,
                  leading: _buildIcon(),
                  title: Text(
                    widget._repo.owner.login,
                    style: const TextStyle(color: Colors.black, fontSize: 13.0),
                  ),
                  trailing: Text(widget._repo.language ?? ''),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18, right: 18, top: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget._repo.fork
                            ? widget._repo.full_name
                            : widget._repo.name,
                        style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 4)),
                      Text(
                        widget._repo.description ??
                            S.of(context).no_description,
                        style: const TextStyle(
                            fontSize: 12.0, color: Colors.black54),
                      )
                    ],
                  ),
                ),
                _buildBottom()
              ],
            ),
          )),
    );
  }

  Widget _buildIcon() {
    return gmAvatar(widget._repo.owner.avatar_url);
  }

  Widget _buildBottom() {
    return Row(
      children: [
        _bottomItem(Icons.star, '${widget._repo.stargazers_count}'),
        _bottomItem(
            Icons.assignment_turned_in, '${widget._repo.open_issues_count}'),
        _bottomItem(Icons.work_rounded, '${widget._repo.fork}'),
      ],
    );
  }

  Widget _bottomItem(IconData icon, String title) {
    return Padding(
        padding: const EdgeInsets.only(left: 18, right: 8, top: 8),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.grey,
              size: 13,
            ),
            Padding(padding: const EdgeInsets.only(left: 4)),
            Text(title,
                style: const TextStyle(color: Colors.grey, fontSize: 12))
          ],
        ));
  }
}
