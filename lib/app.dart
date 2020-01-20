import 'package:cv/experience_page.dart';
import 'package:cv/home_page.dart';
import 'package:cv/navigation.dart';
import 'package:cv/tab_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

const TOP_PADDING_SIZE = 32.0;
const PAGE_PADDING_SIZE = 18.0;
const TITLE = "thanhnamitit";
const NAME = "Nam Do";
const EMAIL = "thanhnamitit@gmail.com";
const SENTENCE =
    "The proper use of comments is to compensate for our failure to express ourself in code.";
const AUTHOR = "Robert C. Martin";
const MAIN_COLOR = Color(0xff5A72EA);
const SUB_COLOR = Color(0xffFF5A59);

const MIN_TABLET_SIZE = 960;

const PAGE_CONTENT_PADDING =
    const EdgeInsets.symmetric(vertical: 54, horizontal: 48);

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: TITLE,
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  void _downloadCV() {}

  void _hireMe() {}

  Widget pagePadding() => const SizedBox(height: PAGE_PADDING_SIZE);

  Widget _homePage() {
    return IntrinsicHeight(
      child: Stack(
        children: <Widget>[
          Opacity(
            child: Navigation(),
            opacity: 0,
          ),
          Positioned.fill(
            child: HomePage(
              downloadCV: _downloadCV,
              hireMe: _hireMe,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildListDetail(bool forTablet) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: TOP_PADDING_SIZE),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Visibility(visible: !forTablet, child: AppTabBar()),
//          _homePage(),
//          pagePadding(),
//          AboutPage(),
//          pagePadding(),
//          MySkillPage(),
//          pagePadding(),
          ExperiencePage(),
        ],
      ),
    );
  }

  Widget _buildNavigation(bool forTablet) {
    return Padding(
      padding: EdgeInsets.only(top: forTablet ? TOP_PADDING_SIZE : 0),
      child: Navigation(),
    );
  }

  Widget _buildTabletBody(double width) {
    return Scaffold(
      body: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildNavigation(true),
          SizedBox(width: 24),
          LimitedBox(
            maxWidth: 666,
            child: _buildListDetail(true),
          )
        ],
      ),
    );
  }

  Widget _buildPhoneBody() {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: _buildListDetail(false),
      ),
      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.transparent,
        ),
        child: Drawer(
          child: _buildNavigation(false),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constrain) {
        return constrain.maxWidth >= MIN_TABLET_SIZE
            ? _buildTabletBody(constrain.maxWidth)
            : _buildPhoneBody();
      },
    );
  }
}
