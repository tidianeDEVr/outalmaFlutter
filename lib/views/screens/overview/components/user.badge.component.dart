import 'package:flutter/material.dart';
import 'package:outalma/utils/outalma.config.dart';
import 'package:outalma/views/screens/overview/components/modal.user.menu.component.dart';

class UserBadgeComponent extends StatefulWidget {
  const UserBadgeComponent({super.key});

  @override
  State<UserBadgeComponent> createState() => _UserBadgeComponentState();
}

class _UserBadgeComponentState extends State<UserBadgeComponent> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _displayBottomSheet(context);
      },
      child: Container(
        width: 200,
        height: 52,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        padding: const EdgeInsets.only(
          left: 8,
          right: 8,
          top: 2,
          bottom: 2,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('lib/assets/images/ava.png'),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 15),
              child: RichText(
                text: TextSpan(
                    text: 'Bonjour \n',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 14,
                    ),
                    children: const [
                      TextSpan(
                        text: 'Mami Fall',
                        style: TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ]),
              ),
            ),
            Container(
              width: .5,
              color: Colors.grey,
              height: 40,
            ),
            Container(
              margin: const EdgeInsets.only(right: 5),
              child: const Icon(
                Icons.keyboard_arrow_down_outlined,
                color: Colors.black,
              ),
            ),
            // IconButton(
            //   onPressed: () => _displayBottomSheet(context),
            //   icon: const Icon(Icons.keyboard_arrow_down_outlined),
            //   color: Colors.black,
            // )
          ],
        ),
      ),
    );
  }

  Future _displayBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: outalmaBackgroundModal,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (builder) => const ModalUserMenuComponent(),
    );
  }
}
