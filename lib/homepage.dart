import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final listMember = {
    "member": [
      {
        "nama": "Cantika Dyah Wahyuningrum",
        "nim": "123210153",
        'kelas': 'IF-E',
      },
      {
        'nama': 'Mutiara Angelicha Rahma',
        'nim': '123210169',
        'kelas': 'IF-E',
      },
      {
        'nama': 'Niken Riri',
        'nim': ' ',
        'kelas': 'IF-E',
      },
    ]
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemBuilder: (context, index) {
          return Card(
            elevation: 20,
            shadowColor: Colors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              height: 200,
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  const SizedBox(
                    width: 30,
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          overflow: TextOverflow.ellipsis,
                          '${listMember['member']![index]['nama']}',
                          style: const TextStyle(fontSize: 20),
                          maxLines: 1,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          '${listMember['member']![index]['nim']}',
                          style: const TextStyle(fontSize: 20),
                          maxLines: 1,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          '${listMember['member']![index]['kelas']}',
                          style: const TextStyle(fontSize: 20),
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          height: 12,
        ),
        itemCount: listMember['member']!.length,
      ),
    );
  }
}