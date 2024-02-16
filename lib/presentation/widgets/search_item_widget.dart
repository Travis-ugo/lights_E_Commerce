// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class SearchItemWidget extends StatelessWidget {
  const SearchItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.grey.withOpacity(0.3),
      ),
      child: TextField(
        key: const Key('searchKey'),
        onChanged: (value) {},
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          prefixIcon: const Icon(Icons.search),
          hintText: "Search your style here...",
          hintStyle: TextStyle(
            color: Colors.grey[600],
          ),
        ),
      ),
    );
  }
}
