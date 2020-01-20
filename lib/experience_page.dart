import 'package:cv/page_title.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'base_page.dart';

class ExperiencePage extends StatefulWidget {
  @override
  _ExperiencePageState createState() => _ExperiencePageState();
}

class _ExperiencePageState extends State<ExperiencePage> {
  @override
  Widget build(BuildContext context) {
    return BasePage(
      color: Colors.white,
      child: Padding(
        padding: PAGE_CONTENT_PADDING,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            PageTitle("Experience"),
          ],
        ),
      ),
    );
  }
}
