import 'package:flutter/material.dart';
import 'package:vitasprint/constants/app_colors.dart';

class RecipeItem extends StatelessWidget {
  String name, des,time;

  RecipeItem({super.key, required this.name, required this.des, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(.05),
        borderRadius: BorderRadius.circular(24)
      ),
      child: Row(
        children: [
          Container(
            color: Colors.transparent,
            padding: EdgeInsets.all(4),
            child: Image.network(
              'https://firebasestorage.googleapis.com/v0/b/vitasprint-73cfd.appspot.com/o/recipes%2FPngItem_1522450.png?alt=media&token=78938bd7-ed5d-4ce0-b58e-9e682437e388',
              height: 120.0, // Set the height of the image
              fit: BoxFit.cover, // Adjust the BoxFit as per your needs
            )
          ),
          Flexible(
            child: Container(
              margin: EdgeInsets.only(top: 8, bottom: 8,left: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Row(
                    children: [
                      const Expanded(
                        child: Text(
                        "Cuisine",
                        style: TextStyle(fontSize: 13, color: Colors.brown),
                      ),),
                      Container(
                        margin: EdgeInsets.only(top: 4,right: 16),
                        child: const Row(
                          children: [
                            Text(
                              "45 mins",
                              style: TextStyle(fontSize: 11, color: Colors.black45),
                            ),
                            Padding(padding: EdgeInsets.all(2)),
                            Icon(Icons.access_time, color: Colors.black54,size: 18,),
                          ],
                        ),
                      )
                    ],
                  ),
                  Text(
                    name,
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                  const Padding(padding: EdgeInsets.all(2)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RowItem(value: "--", icon: Icons.whatshot_outlined, ),
                      RowItem(value: "--", icon: Icons.local_dining_outlined)
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RowItem extends StatelessWidget {
  String value;
  IconData icon;

  RowItem(
      {super.key,
      required this.value,
      required this.icon,});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 4,right: 16),
      child: Column(
        children: [
          Icon(icon, color: Colors.black54,size: 18,),
          Text(
            value,
            style: TextStyle(fontSize: 11, color: Color(0xff0c2c52)),
          )
        ],
      ),
    );
  }
}
