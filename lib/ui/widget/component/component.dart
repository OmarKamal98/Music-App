import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const Color buttonColor = Color(0xFFCBFB5E);
const Color searchColor = Color(0xFF363942);
const Color screenColor = Color(0xFF0E0B1F);

Widget defaultButton({
  double width = double.infinity,
  double radius = 10.0,
  Color background = buttonColor,
  bool isUpperCase = true,
  double height = 40,
  @required Function function,
  @required String text,
}) =>
    Container(
      width: width,
      height: height,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            fontSize: 20.sp,
            color: Colors.black,
          ),
        ),
      ),
      decoration: BoxDecoration(
          color: background, borderRadius: BorderRadius.circular(radius)),
    );

Widget libraryItem({
  double width = double.infinity,
  double radius = 10.0,
  Color background,
  @required Icon prefixIcon,
  double height = 40,
  @required Function function,
  @required String text,
}) =>
    InkWell(
      onTap: function,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: screenColor, borderRadius: BorderRadius.circular(radius)),
        child: Column(
          children: [
            Row(
              children: [
                prefixIcon,
                SizedBox(
                  width: 20.w,
                ),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_right,
                  color: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );

Widget cardMusic({
  double width = double.infinity,
  double radius = 10.0,
  double height = 40,
  @required Function onTapFun,
  @required Image image,
  @required Text title,
  @required Text subtitle,
}) =>
    Row(
      children: [
        Expanded(
          child: ListTile(
            onTap: onTapFun,
            leading: image,
            title: title,
            subtitle: subtitle,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        PopupMenuButton(
          icon: const Icon(
            Icons.more_vert_rounded,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
          onSelected: (int value) {},
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 5,
              child: Row(
                children: [
                  const Icon(
                    Icons.album_rounded,
                  ),
                  const SizedBox(width: 10.0),
                  Text(
                    'viewAlbum',
                  ),
                ],
              ),
            ),
            PopupMenuItem(
              value: 0,
              child: Row(
                children: [
                  Icon(
                    Icons.playlist_add,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  const SizedBox(width: 10.0),
                  Text(
                    'addToPlaylist',
                  ),
                ],
              ),
            ),
            PopupMenuItem(
              value: 10,
              child: Row(
                children: [
                  Icon(
                    Icons.info_rounded,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  const SizedBox(width: 10.0),
                  Text(
                    'songInfo',
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          width: 5,
        )
      ],
    );

Widget searchField({
  @required Function function,
  double radius = 10.0,
  Icon suffixIcon,
}) =>
    Container(
      width: double.infinity,
      height: 40.h,
      child: TextField(
        decoration: InputDecoration(
            hintText: 'Search',
            border: OutlineInputBorder(),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            suffixIcon: suffixIcon),
        onTap: function,
      ),
      decoration: BoxDecoration(
          color: searchColor, borderRadius: BorderRadius.circular(radius)),
    );

Widget defaultFormField({
  @required TextEditingController controller,
  @required TextInputType type,
  @required Function onSubmit,
  @required Function validate,
  @required String label,
  @required IconData prefix,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: onSubmit(),
      validator: validate(),
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(prefix),
        border: const OutlineInputBorder(),
      ),
    );

TextEditingController textFieldController = TextEditingController();

Future<void> playListInputDialog(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Color(0xFF7A7C81),
        title: Text('createNewPlaylist'),
        content: TextField(
          controller: textFieldController,
          decoration: InputDecoration(hintText: "playlist name"),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                  ),
                  child: Text('CANCEL'),
                  onPressed: () {
                    textFieldController.clear();
                    Navigator.pop(context);
                  },
                ),
                Spacer(),
                ElevatedButton(
                  child: Text('OK'),
                  onPressed: () {
                    textFieldController.clear();
                    print(textFieldController.text);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}
