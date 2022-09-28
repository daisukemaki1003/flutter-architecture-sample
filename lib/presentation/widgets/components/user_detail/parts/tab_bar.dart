import 'package:flutter/material.dart';

class TabBarComponent extends StatelessWidget {
  const TabBarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: TabBar(
            indicator: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                width: 2,
                color: Colors.black,
              )),
            ),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            tabs: [
              _tabTitle('詳細'),
              _tabTitle('日記'),
            ],
          ),
        ),
        Expanded(flex: 2, child: Container()),
      ],
    );
  }

  Widget _tabTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: SizedBox(
        height: 40,
        width: 132,
        child: Tab(text: title),
      ),
    );
  }
}
