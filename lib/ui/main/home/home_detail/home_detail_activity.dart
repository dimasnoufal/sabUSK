import 'package:flutter/material.dart';

class HomeDetailActivity extends StatelessWidget {
  const HomeDetailActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Detail Jadwal Kuliah'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          Image.asset('images/books.png'),
          const SizedBox(height: 10.0),
          Text(
            'Jadwal Kuliah',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 10.0),
          const Text(
              'Amet laboris anim cupidatat in voluptate voluptate nisi magna laboris quis elit. Ea cupidatat anim cillum esse aliqua magna reprehenderit. Consectetur magna do voluptate dolor nisi Lorem. Veniam culpa ex duis proident laboris. Lorem magna laborum mollit eu consectetur amet magna esse elit qui enim. Ipsum ad tempor sit irure nostrud commodo.'),
        ],
      ),
    );
  }
}
