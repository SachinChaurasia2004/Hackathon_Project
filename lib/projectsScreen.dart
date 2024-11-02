import 'package:flutter/material.dart';

class ProjectsScreen extends StatefulWidget {
  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  final TextEditingController _searchProject = TextEditingController();
  String? selectedTopic;

  final List<String> topics = ['NIT', 'IIT', 'IIIT'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search & Download Projects'),
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
              controller: _searchProject,
              decoration: InputDecoration(
                hintText: 'Search Projects!',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  hint: Text("Choose Uni/College"),
                  value: selectedTopic,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedTopic = newValue;
                    });
                  },
                  items: topics.map((String topic) {
                    return DropdownMenuItem<String>(
                      value: topic,
                      child: Text(topic),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: 100,
                itemBuilder: (BuildContext context, index) {
                  return _buildCard(
                    context,
                    title: 'Project $index',
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
