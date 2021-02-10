import 'package:flutter/material.dart';

Color blueColor = Color(0xff0142e4);
Color pinkColor = Color(0xffb929be);
Color orangeColor = Color(0xfffeb832);

class UserAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          CustomAvater(
            image: userImage,
          ),
          Transform.translate(
              offset: Offset(
                MediaQuery.of(context).size.height * 0.03,
                MediaQuery.of(context).size.height * 0.07,
              ),
              child: plusBtn())
        ],
      ),
    );
  }

  Widget plusBtn() {
    return Container(
      height: 16,
      width: 16,
      child: Center(
          child: Icon(
        Icons.add,
        color: Colors.white,
        size: 12,
      )),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(colors: [
            blueColor,
            pinkColor,
            pinkColor,
            pinkColor,
          ])),
    );
  }
}

class ContactAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CustomAvater(
            image: friendsmage,
          ),
          Text("Nkechi")
        ],
      ),
    );
  }
}

class CustomAvater extends StatelessWidget {
  final String image;

  const CustomAvater({Key key, this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(3.5),
        child: CircleAvatar(
            backgroundImage: Image.network(
          image,
          fit: BoxFit.contain,
        ).image),
      ),
      height: MediaQuery.of(context).size.height * 0.08,
      width: MediaQuery.of(context).size.height * 0.08,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient:
              LinearGradient(colors: [blueColor, pinkColor, orangeColor])),
    );
  }
}

getUpdateStories() {
  List<Widget> stories = [];

//user first
  stories.add(UserAvatar());

//other stories
  stories.addAll(List.generate(8, (i) => ContactAvatar()));

  return stories;
}

const userImage =
    "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80";

const friendsmage =
    "https://images.unsplash.com/photo-1542206395-9feb3edaa68d?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=700&q=80";

class ProfileAvater extends StatelessWidget {
  final String image;

  const ProfileAvater({Key key, this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(3.5),
        child: CircleAvatar(
            backgroundImage: Image.network(
          image,
          fit: BoxFit.contain,
        ).image),
      ),
      height: MediaQuery.of(context).size.height * 0.13,
      width: MediaQuery.of(context).size.height * 0.13,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient:
              LinearGradient(colors: [blueColor, pinkColor, orangeColor])),
    );
  }
}
