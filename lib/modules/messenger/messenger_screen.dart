import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget {
  const MessengerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 20,
        title: Row(
          children: const [
            CircleAvatar(
              radius: 15,
              backgroundImage: NetworkImage(
                  'https://sm.ign.com/t/ign_mear/news/t/the-avatar/the-avatar-sequels-cost-1-billion-to-produce_5rw1.1200.jpg'),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              'Chats',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const CircleAvatar(
                radius: 15,
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.camera_alt,
                  size: 16,
                  color: Colors.white,
                ),
              )),
          IconButton(
              onPressed: () {},
              icon: const CircleAvatar(
                radius: 15,
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.edit,
                  size: 16,
                  color: Colors.white,
                ),
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey[300]),
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: const [
                    Icon(Icons.search),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Search',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),


              Container(
                height: 100,
                child: ListView.separated(
                  separatorBuilder: (context,index)=>SizedBox(width: 20,),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => buildStoryItem(),
                  itemCount: 10,
                ),
              ),
              SizedBox(height: 20,),
              ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context,index)=>buildChatItem(),
                  separatorBuilder: (context,index)=>SizedBox(height: 20,),
                  itemCount: 10)
            ],
          ),
        ),
      ),
    );
  }

  //1- build items
  //2- build list
  //3- add item to list

  Widget buildChatItem() => Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: const [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                    'https://sm.ign.com/t/ign_mear/news/t/the-avatar/the-avatar-sequels-cost-1-billion-to-produce_5rw1.1200.jpg'),
              ),
              CircleAvatar(
                radius: 10,
                backgroundColor: Colors.white,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(bottom: 3.0, end: 3.0),
                child: CircleAvatar(
                  radius: 7,
                  backgroundColor: Colors.red,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Femon gamel',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'My name Femon gamel shawky My name Femon gamel shawkyMy name Femon gamel shawkyMy name Femon gamel shawky ',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        width: 7,
                        height: 7,
                        decoration: const BoxDecoration(
                            color: Colors.blue, shape: BoxShape.circle),
                      ),
                    ),
                    const Text('02:00 pm'),
                  ],
                )
              ],
            ),
          )
        ],
      );

  Widget buildStoryItem() => SizedBox(
        width: 60,
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: const [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      'https://sm.ign.com/t/ign_mear/news/t/the-avatar/the-avatar-sequels-cost-1-billion-to-produce_5rw1.1200.jpg'),
                ),
                CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.white,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(bottom: 3.0, end: 3.0),
                  child: CircleAvatar(
                    radius: 7,
                    backgroundColor: Colors.red,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Femon Gamel shawky',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      );
}
