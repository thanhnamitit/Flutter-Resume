import 'package:cv/data.dart';
import 'package:cv/widget/menu_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'app.dart';

class Navigation extends StatelessWidget {
  final Function onTap;

  Navigation(this.onTap);

  Widget _buildNavigationOption(
    String title,
    IconData icon, {
    Function onTap,
  }) {
    return MenuButton(
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
                  backgroundImage: AssetImage(Data.AVATAR),
                  backgroundColor: Colors.white,
                ),
              ),
              SizedBox(height: 24),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: "${Data.NAME}",
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
              _buildNavigationOption("Home", Icons.home, onTap: () {
                this.onTap(0);
              }),
              _buildNavigationOption("About", Icons.account_box, onTap: () {
                this.onTap(1);
              }),
              _buildNavigationOption("Resume", Icons.book, onTap: () {
                this.onTap(2);
              }),
              _buildNavigationOption("Work", Icons.work, onTap: () {
                this.onTap(3);
              }),
              _buildNavigationOption("Contact", Icons.contacts, onTap: () {
                this.onTap(4);
              }),
              SizedBox(height: 48),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  _buildLinkingButton(
                    FontAwesomeIcons.facebookF,
                    Data.FACEBOOK_URL,
                  ),
                  _buildLinkingButton(
                    FontAwesomeIcons.instagram,
                    Data.INSTAGRAM_URL,
                  ),
                  _buildLinkingButton(
                    FontAwesomeIcons.githubAlt,
                    Data.GITHUB_URL,
                  ),
                  _buildLinkingButton(
                    FontAwesomeIcons.linkedinIn,
                    Data.LINKEDIN_URL,
                  ),
                ],
              ),
              SizedBox(height: 32),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  Data.EMAIL,
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
