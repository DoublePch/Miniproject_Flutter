import 'package:flutter/material.dart';
import 'package:miniproject/services/remote_service.dart';

import '../model/post.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  List<Post>? post;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    post = await RemoteService().getPosts();
    if (post != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Post'),
        ),
        body: Visibility(
          visible: isLoaded,
          child: ListView.builder(
            itemCount: post?.length,
            itemBuilder: (context, index) {
              return Container(
                child: Column(
                  children: [
                    Text(
                      "${post![index].stockTypeId.stockTypeName}",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              );
            },
          ),
          replacement: const Center(
            child: CircularProgressIndicator(),
          ),
        ));
  }
}
