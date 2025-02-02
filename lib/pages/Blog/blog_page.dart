import 'package:ata/widget/const.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BlogPage extends StatefulWidget {
  const BlogPage(
      {super.key, required this.img, required this.title, required this.desc});
  final String img;
  final String title;
  final String desc;

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Colors.white,
          ),
          backgroundColor: orange,
          title: Text(
            widget.title,
            style: TextStyle(
                fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl:
                      "https://atabackend.onrender.com/uploads/${widget.img}",
                  fit: BoxFit.cover,
                  placeholder: (context, url) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },

                  errorWidget: (context, url, error) {
                    return Image.network(
                      "https://picsum.photos/200/300",
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.desc,
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                  textAlign: TextAlign.justify,
                ),
              ),
              const SizedBox(
                height: 60,
              )
            ],
          ),
        ));
  }
}
