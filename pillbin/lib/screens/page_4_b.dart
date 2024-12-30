import 'package:flutter/material.dart';

class Page4B extends StatefulWidget {
  Page4B({super.key, required this.ontap, required this.pageIndex, required this.pageNotifier});
   final void Function() ontap;
  final int pageIndex;
  final ValueNotifier<int> pageNotifier;

  @override
  State<Page4B> createState() => _Page4BState();
}

class _Page4BState extends State<Page4B> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}