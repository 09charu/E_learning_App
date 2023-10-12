import 'package:flutter/material.dart';

class DescriptionSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Text(
            "lorem jdfnvjnn jbhdbfbwhefnmscnnfefjwnen dsncbjfeknm  enfjewhijfnijcn kjdnf;jiwherifjdnhbfhuqhbchabhghueghdgchbhdbchqeghb hedehfguyfguhdbcue jhdgfhebf ",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black.withOpacity(0.7),
            ),
            textAlign: TextAlign.justify,
          ),
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Text(
                "Course Length: ",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Icon(
              Icons.timer,
              color: Color(0xFF929796),
            ),
            SizedBox(width: 5),
            Text(
              "26 Hours",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Text(
                "Rating",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(width: 5),
            Icon(
              Icons.star,
              color: Colors.yellow,
            ),
            SizedBox(width: 5),
            Text(
              "26 Review",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
