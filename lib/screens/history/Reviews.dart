import 'package:flutter/material.dart';
import 'package:flutter_laravel/services/auth.dart';
import 'package:flutter_laravel/services/comment.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class Reviews extends StatefulWidget {
  const Reviews({Key key}) : super(key: key);

  @override
  _ReviewsState createState() => _ReviewsState();
}

double _rating;

class _ReviewsState extends State<Reviews> {
  TextEditingController _commentController = TextEditingController();
  var now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Reviews and rating',
                style: TextStyle(color: Colors.black))),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Stack(children: <Widget>[
            Image.asset(
              'images/about.png',
              fit: BoxFit.fill,
            ),
            Column(
              children: [
                SizedBox(
                  height: 263,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 3,
                    color: Colors.blue[100],
                    child: Consumer<Auth>(builder: (context, auth, child) {
                      return Column(
                        children: <Widget>[
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            '${now.day}-' + '${now.month}-' + '${now.year}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[900],
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                auth.user.name,
                                style: TextStyle(
                                  color: Colors.blue[900],
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                width: 30.0,
                              ),
                              RatingBar.builder(
                                initialRating: 0,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 2.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  setState(() {
                                    _rating = rating;
                                  });
                                },
                                updateOnDrag: true,
                              ),
                            ],
                          ),
                          TextFormField(
                            controller: _commentController,
                            validator: (value) => value.isEmpty
                                ? 'please enter your comment'
                                : null,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              labelText: 'Comment',
                              prefixIcon: Icon(
                                Icons.comment,
                              ),
                              fillColor: Colors.transparent,
                              errorStyle: TextStyle(
                                fontSize: 15,
                                //backgroundColor: Colors.transparent,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3.0,
                          ),
                          FlatButton(
                            onPressed: () {
                              Map creds4 = {
                                'rating': _rating,
                                'comment': _commentController.text,
                              };
                              Provider.of<Com>(context, listen: false)
                                  .comment(creds4: creds4);
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Reviews()));
                              print(creds4);
                            },
                            child: Text('Add you comment',
                                style: TextStyle(color: Colors.blue)),
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: Colors.blue,
                                    width: 1,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(50)),
                          )
                        ],
                      );
                    }),
                  ),
                ),
              ],
            ),
          ]),
        ));
  }
}
