import 'package:flutter/material.dart';

class NotesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _searchPyq = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Previous year Papers'),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pushNamed('/home'),
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchPyq,
              decoration: InputDecoration(
                hintText: 'Search Notes',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: 100,
                itemBuilder: (BuildContext context, index) {
                  return _buildCard(
                    context,
                    title: 'Subject $index',
                    icon: Icons.article,
                    onTap: () => Navigator.of(context).pushNamed('/upload'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context,
      {required String title,
      required IconData icon,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(icon, size: 100, color: Colors.blue),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Icon(Icons.school_rounded, size: 40, color: Colors.blue),
              SizedBox(
                width: 8,
              ),
              Text(
                '(NIT Meghalaya)',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
