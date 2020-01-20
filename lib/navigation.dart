import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'app.dart';

const FACEBOOK_URL = "https://www.facebook.com/thanhnamitit";
const INSTAGRAM_URL = "https://www.instagram.com/thanhnamitit/";
const GITHUB_URL = "https://github.com/thanhnamitit";
const LINKEDIN_URL = "https://www.linkedin.com/in/đỗ-nam-b51829167/";

class Navigation extends StatelessWidget {
  Widget _buildNavigationOption(
    String title,
    IconData icon, {
    Function onTap,
  }) {
    return InkWell(
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 6, bottom: 6),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: Colors.white,
              size: 18,
            ),
            SizedBox(width: 12),
            Text(
              title,
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildLinkingButton(IconData iconData, String url) {
    return Container(
      width: 32,
      height: 32,
      margin: EdgeInsets.only(right: 12),
      child: FloatingActionButton(
        onPressed: () {
          launch(url);
        },
        elevation: 2,
        backgroundColor: SUB_COLOR,
        child: Icon(
          iconData,
          color: Colors.white,
          size: 16,
        ),
      ),
    );
  }

  Widget _buildNavigation() {
    return Card(
      color: MAIN_COLOR,
      elevation: 12,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(32),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                width: 64,
                height: 64,
                child: CircleAvatar(
                  backgroundImage: AssetImage("image/avatar.jpg"),
                ),
              ),
              SizedBox(height: 24),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: "$NAME",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    TextSpan(
                      text: ' ●',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: SUB_COLOR,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 4),
              Text(
                "Mobile developer",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w200,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 48),
              _buildNavigationOption("Home", Icons.home, onTap: () {}),
              _buildNavigationOption("About", Icons.account_box, onTap: () {}),
              _buildNavigationOption("Resume", Icons.book, onTap: () {}),
              _buildNavigationOption("Work", Icons.work, onTap: () {}),
              _buildNavigationOption("Contact", Icons.contacts, onTap: () {}),
              SizedBox(height: 48),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  _buildLinkingButton(
                    FontAwesomeIcons.facebookF,
                    FACEBOOK_URL,
                  ),
                  _buildLinkingButton(
                    FontAwesomeIcons.instagram,
                    INSTAGRAM_URL,
                  ),
                  _buildLinkingButton(
                    FontAwesomeIcons.githubAlt,
                    GITHUB_URL,
                  ),
                  _buildLinkingButton(
                    FontAwesomeIcons.linkedinIn,
                    LINKEDIN_URL,
                  ),
                ],
              ),
              SizedBox(height: 32),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  EMAIL,
                  style: TextStyle(
                    color: Colors.white.withOpacity(.5),
                    fontWeight: FontWeight.w100,
                    fontStyle: FontStyle.italic,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildNavigation();
  }
}
