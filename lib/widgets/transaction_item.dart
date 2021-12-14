
import 'package:banking_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'avatar_image.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem(this.data, { Key? key, this.onTap}) : super(key: key);
  final data;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: secondary,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: shadowColor.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(1, 1), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            SizedBox(height: 2),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AvatarImage(
                  data['image'], 
                  isSVG: false,
                  width: 35, height:35,
                  radius: 50,
                ),
                SizedBox(width: 20),
                Expanded(
                  child: 
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              child: Text(data['name'], maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700))
                            )
                          ),
                          SizedBox(width: 5),
                          Container(
                            child: Text(data['price'], maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600))
                          )
                        ],
                      ),
                      SizedBox(height: 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child: Text(data['date'], maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 12, color: Colors.grey))
                          ),
                          Container(
                            child: data['type'] == 1 ?
                               Icon(Icons.download_rounded, color: green,)
                               :
                               Icon(Icons.upload_rounded, color: red,)
                          ),
                        ],
                      ),
                    ],
                  )
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}