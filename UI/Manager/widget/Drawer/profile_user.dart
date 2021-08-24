import 'dart:math';

import 'package:flutter/material.dart';
import '../../../.././Api/Manager/Repositorys/Network.dart';
import '../../../.././UI/Manager/widget/style_app/Style_widget.dart';

class CustomSliverHeader extends StatefulWidget {
  final datausernetwork;
  final datauserprofile;
  const CustomSliverHeader(
      {Key? key, required this.datausernetwork, required this.datauserprofile})
      : super(key: key);
  @override
  CustomSliverHeaderState createState() {
    return CustomSliverHeaderState();
  }
}

const avatarSize = 60.0;
const minAvatarSize = 30.0;
const extraSpace = 70.0;

class CustomSliverHeaderState extends State<CustomSliverHeader> {
  @override
  Widget build(BuildContext context) {
    print(widget.datauserprofile.userId.name);
    return Theme(
      data: ThemeData.dark(),
      child: Material(
        color: StyleWidget.white,
        child: SafeArea(
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverPersistentHeader(
                  delegate: MyHeaderDelegate(
                      kToolbarHeight + avatarSize + extraSpace,
                      widget.datausernetwork,
                      widget.datauserprofile),
                  pinned: true,
                ),
              ];
            },
            body:Text('name'),
            //  ListView.builder(
            //   itemBuilder: (context, index) => ListTile(
            //     title: Text("datauserprofile.nameA $index"),
            //   ),
            //   itemCount: 20,
            // ),
          ),
        ),
      ),
    );
  }
}

class MyHeaderDelegate extends SliverPersistentHeaderDelegate {
  final datausernetwork;
  final double extendedHeight;
  final datauserprofile;
  MyHeaderDelegate(
      this.extendedHeight, this.datausernetwork, this.datauserprofile);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // print("shrinkOffset: $shrinkOffset ... $overlapsContent");
    double newSize = maxExtent - shrinkOffset;
    double newSizePercent = avatarSize + extraSpace - shrinkOffset;
    double newAvatarSize = avatarSize - shrinkOffset;
    double newAvatarSpace = avatarSize - shrinkOffset;
    if (newSize < minExtent) {
      newSize = minExtent;
    }
    if (newAvatarSize < minAvatarSize) {
      newAvatarSize = minAvatarSize;
    }
    if (newAvatarSpace < 0) {
      newAvatarSpace = 0;
    }
    final percent = (newSizePercent >= 0 ? newSizePercent : 0) /
        (avatarSize + extraSpace).abs();
    double avatarXPosition = max(
        ((MediaQuery.of(context).size.width / 2) - newAvatarSize / 1.150) *
            percent,
        15);

    double actionsXPosition = 60 * (1 - percent);

    return Container(
      color: StyleWidget.nearlyBlack,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: kToolbarHeight + newAvatarSpace,
            child: Stack(
              children: [
                AppBar(
                  centerTitle: false,
                  elevation: 0.0,
                  actions: [
                    Container(
                      width: 150,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Positioned(
                            top: 0,
                            right: actionsXPosition,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.help),
                                  onPressed: () => null,
                                ),
                                IconButton(
                                  icon: Icon(Icons.more_vert),
                                  onPressed: () => null,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                  backgroundColor: StyleWidget.nearlyBlack,
                ),
                Positioned(
                  bottom: minAvatarSize / 10,
                  right: avatarXPosition,
                  child: CircleAvatar(
                    radius: newAvatarSize / 1.400,
                    backgroundImage: NetworkImage(
                      '$uri/${datausernetwork.img}',
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Expanded(
                  child: Text(
                datauserprofile.userId.name.toString(),
                style: TextStyle(
                    color: StyleWidget.nearlyBlue,
                    fontFamily: StyleWidget.fontName,
                    fontSize: newAvatarSize / 4),
              )),
              Expanded(
                child: Text(
                  datauserprofile.username.toString(),
                  style: TextStyle(
                      color: StyleWidget.nearlyBlue,
                      fontFamily: StyleWidget.fontName,
                      fontSize: 22),
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => extendedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
