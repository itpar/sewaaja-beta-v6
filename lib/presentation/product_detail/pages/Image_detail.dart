import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_loginn/api.dart';

class ImageDetail extends StatefulWidget {
  static Route<dynamic> route() => MaterialPageRoute(
    builder: (context) => ImageDetail(),
  );
  @override
  _ImageDetailState createState() => _ImageDetailState();
}

class _ImageDetailState extends State<ImageDetail> {

  String allUrl = Api.viewAll;
  String UploadUrl = Api.upload;

  Future allPerson() async {
    var response = await http.get(allUrl);
    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();
    allPerson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Data'),
      ),
      body: FutureBuilder(
        future: allPerson(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                List list = snapshot.data;
                return Card(
                  child: ListTile(
                    title: Container(
                      width: 300,
                      height: 300,
                      child: Image.network(
                          "http://192.168.43.212/image_upload_php_mysql/uploads/${list[index]['image']}"),
                    ),
                    subtitle: Center(
                        child: Column(
                          children: [
                            Text(list[index]['name'],
                            ),
                            Text(list[index]['description'],
                            ),
                          ],
                        ),
                    ),
                  ),
                );
              })
              : Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
