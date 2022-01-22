import 'package:flutter/material.dart';
import 'package:flutter_laravel/screens/home_screen.dart';

import 'detail_service.dart';

const stylistData = [
  {
    'serviceName': 'Body wash',
    'imgUrl': 'images/log.jpg',
    'bgColor': Color(0xffFFF0EB),
    'title': 'Our quality difference: tunnel washing',
    'description':
        'The secret of Car Wash is effectiveness lies as much in the exclusive technology of the North American equipment (the tunnel) as in the know-how of the staff.',
    'title2': 'Exclusive technology and manual know-how unique in Morocco',
    'description2':
        'The exterior washing is thus ensured by ingenious robotized processes such as fabric brushes, called "mitters", a kind of swing from which felt strips are suspended, but also side and horizontal brushes, wheel brushes, high pressure jets.'
  },
  {
    'serviceName': 'Interior Cleaning',
    'imgUrl': 'images/int.jpg',
    'bgColor': Color(0xffEBF6FF),
    'title': 'Internal cleaning',
    'description':
        'The secret of Car Wash is effectiveness lies as much in the exclusive technology of the North American equipment (the tunnel) as in the know-how of the staff.',
    'title2': 'How to do it?',
    'description2':
        'The interior plastics are dusted. Our sponges are changed regularly so as not to stain the windshield pillars when treating the dashboard. For very dirty vehicles, we first use a towel impregnated with universal cleaner. Finally, the windows are cleaned, first internally, then externally. Depending on the formula chosen, a cabin perfume is sprayed, a tire shine is applied to the vehicle\'s tires with a foam sponge.'
  },
  {
    'serviceName': 'Light Service',
    'imgUrl': 'images/lii.png',
    'bgColor': Color(0xffFFF3EB),
    'title': 'Why cleaning the light?',
    'description':
        'You then have the choice of either having your lights replaced by your garage, which can be expensive, or having them renovated. American Car Wash offers to renovate your headlights for a cost between 3 and 10 times lower than the replacement.',
    'title2': 'What\'s the deferrance ?',
    'description2':
        'Your headlights regain their original transparency and your visual comfort while driving at night is significantly improved (by 30 to 50%). It is possible to renovate only one optic, for example when the second one has already been changed and there is a difference in color.The implementation consists of preparing the lens by sanding with an abrasive disc to remove the protective varnish, then successively sanding the lens with discs with increasingly fine grains. The optics are then polished.All our renovation services are available without or with an appointment.'
  },
  {
    'serviceName': 'Engine Detailing',
    'imgUrl': 'images/eng.jpg',
    'bgColor': Color(0xffEBF6FF),
    'title': 'Why Engine Detailing Is Important?',
    'description':
        'Before we go into why the engine should not be running while in detailing mode, let us remember why engine detailing is important in the first place. For sellers of used cars, cleaning the car engine is mandatory.',
    'title2': 'Where to Do Engine Detailing?',
    'description2':
        'Ideally, engine cleaning should be done by people who are aware of the procedure and the risks. Research carefully and choose experienced detailers. In general, they would wash it with a steam jet and a suitable detergent and then dry it with compressed air. Ask them for details to be sure they know how to do this properly.'
  }
];

class service extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HomeScreen()));
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(50),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 5,
                      ),
                      Center(
                        child: Text(
                          'Services',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ),
                      StylistCard(stylistData[0]),
                      StylistCard(stylistData[1]),
                      StylistCard(stylistData[2]),
                      StylistCard(stylistData[3]),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StylistCard extends StatelessWidget {
  final stylist;
  StylistCard(this.stylist);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 4 - 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: stylist['bgColor'],
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 20,
            right: -60,
            child: Image.asset(
              stylist['imgUrl'],
              width: MediaQuery.of(context).size.width * 0.60,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 40, left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  stylist['serviceName'],
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailScreen(stylist)));
                  },
                  color: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Show more',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
