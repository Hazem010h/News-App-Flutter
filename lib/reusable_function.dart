import 'package:flutter/material.dart';
import 'package:news_app/NewsCubit.dart';

Widget buildArticaleItem(articale,context)=> Padding(
  padding: const EdgeInsets.all(8.0),
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('${articale['urlToImage']}'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      const SizedBox(),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children:[
              Text(
                '${articale['title']}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: NewsCubit.get(context).darkTheme?Colors.white:Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '${articale['publishedAt']}',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  ),
);

Widget myDivider()=> const Padding(
  padding: EdgeInsets.all(8.0),
  child:   Divider(
    height: 1,
    thickness: 1,
    color: Colors.grey,
  ),
);

Widget ReusableTextFormField({
  required Widget label,
  required void Function() onTap,
  required void Function(String) onChange,
  required TextEditingController controller,
  required Icon prefixIcon,
  Color borderColor=Colors.blue,
})=>Padding(
  padding: const EdgeInsets.fromLTRB(8,5,8,5),
  child:   TextFormField(
    controller: controller,
    onChanged: onChange,
    onTap: onTap,
    decoration: InputDecoration(
      enabledBorder: const OutlineInputBorder(),
      label: label,
      prefix: prefixIcon,
      focusedBorder:OutlineInputBorder(
        borderSide: BorderSide(color: borderColor, width: 2.0),
        borderRadius: BorderRadius.circular(25.0),
      ),
    ),
  ),
);