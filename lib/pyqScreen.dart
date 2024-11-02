import 'package:flutter/material.dart';

class PyqScreen extends StatelessWidget {
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
                hintText: 'Search Previous year questions!',
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
                    title: 'PYQ $index',
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
      onTap: () => Navigator.of(context).pushNamed('/pdf'),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(icon, size: 100, color: Colors.blue),
              SizedBox(width: 16),
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
                width: 4,
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
