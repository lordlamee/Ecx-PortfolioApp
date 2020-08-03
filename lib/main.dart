import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(Portfolio());
}

class Portfolio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF95A2F1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Spacer(),
          Hero(
            tag: "dp",
              child: DisplayPicture(
                radius: 100,
              )),
          SizedBox(
            height: 10,
          ),
          Text(
            'Gabriel Olamide Akorede',
            style: GoogleFonts.beVietnam(
              color: Colors.white,
              fontSize: 21,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlutterLogo(
                colors: Colors.purple,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Flutter Developer',
                style: GoogleFonts.beVietnam(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          Spacer(),
          InkResponse(
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => PortfolioScreen()
                )
              );
            },
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.keyboard_arrow_down,
                size: 50,
                color: Colors.white,
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}

class DisplayPicture extends StatelessWidget {
  const DisplayPicture({
    Key key,this.radius,
  }) : super(key: key);
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: radius,
      width: radius,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image:
          DecorationImage(image: AssetImage("assets/olamide.jpg"),),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            offset: Offset(1,4),
            blurRadius: 10
          ),
        ]
      ),
    );
  }
}

class PortfolioScreen extends StatelessWidget {
  final _gradientColors = [
    Color(0xFF95A2F1),
    Color(0xFF95A2F1),
    Colors.grey[200],
    Colors.grey[200],
  ];
  @override
  Widget build(BuildContext context) {
    final double fillPercent = 75; // fills 30% for container from bottom
    final double fillStop = (100 - fillPercent) / 100;
    final List<double> stops = [0.0, fillStop, fillStop, 1.0];
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.tight(screenSize),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: _gradientColors,
            stops: stops,
          )
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20,40,20,0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                        child: InkResponse(
                          onTap: (){
                            Navigator.pop(context);
                          },
                            child: Icon(Icons.arrow_back, size: 30, color: Colors.white,))),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Transform.translate(
                              offset: Offset(0,-30),
                              child: Column(
                                children: <Widget>[
                                  Hero(
                                    tag: "id",
                                      child: DisplayPicture(
                                        radius: 60,
                                      ),),
                                  Text(
                                    'Gabriel Olamide Akorede',
                                    style: GoogleFonts.beVietnam(
                                      color: Colors.black,
                                      fontSize: 21,
                                    ),
                                  ),
                                  Text(
                                    'Flutter Developer',
                                    style: GoogleFonts.beVietnam(
                                      color: Colors.green,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        SocialCard(
                          socialName: "Github",
                          description: "github profile",
                          assetName: "githublogo",
                        ),
                          SocialCard(
                            socialName: "Instagram",
                            description: "IG profile",
                            assetName: "instagramlogo",
                          ),
                          SocialCard(
                            socialName: "Twitter",
                            description: "twitter profile",
                            assetName: "twitterlogo",
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 40),
              width: double.infinity,
              height: 120,
              color: Color(0xFF35CC91),
              child: Column(
                  children : <Widget>[
                    Text('+2348029668133',
                      style: GoogleFonts.beVietnam(
                        color: Colors.white.withOpacity(0.7),
                      ),)]
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SocialCard extends StatelessWidget {
  const SocialCard({
    Key key,this.description,this.assetName,this.socialName
  }) : super(key: key);
  final String assetName;
  final String socialName;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image(
            image: AssetImage('assets/$assetName.png'),
            height: 50,
          ),
          SizedBox(
            width: 20,
          ),
          Text(socialName, style: GoogleFonts.beVietnam(
            color: Colors.black,
            fontSize: 16
          ),),
          SizedBox(
            width: 10,
          ),
          Text("Check out my $description",style: GoogleFonts.beVietnam(
              color: Colors.black,
            fontSize: 10
          ),)
        ],
      ),
    );
  }
}
