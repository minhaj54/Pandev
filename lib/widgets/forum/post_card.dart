import 'package:flutter/material.dart';

class ForumPostCard extends StatelessWidget {
  const ForumPostCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrqYsvckezNuaFPM884_OqtXRJoiqHJO_gAA&s'),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Jane Smith',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        '2 hours ago',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Text(
              'How to manage stress during COVID-19?',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 8),
            Text(
              'During these challenging times, I\'ve found it difficult to...',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.thumb_up_outlined, size: 20),
                SizedBox(width: 4),
                Text('24'),
                SizedBox(width: 16),
                Icon(Icons.comment_outlined, size: 20),
                SizedBox(width: 4),
                Text('8 comments'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
