import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  final TextEditingController _topicNameController = TextEditingController();
  final TextEditingController _uniNameController = TextEditingController();
  String? selectedTopic;

  final List<String> topics = ['PYQs', 'Notes', 'Projects'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              LottieBuilder.asset('assets/write-note.json'),
              TextField(
                controller: _topicNameController,
                decoration: InputDecoration(
                  labelText: 'Topic Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _uniNameController,
                decoration: InputDecoration(
                  labelText: 'University/College',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 16,
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
                    hint: Text("Choose a topic"),
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
              SizedBox(
                height: 24,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Set button color to blue
                    foregroundColor: Colors.white, // Set text color to white
                    padding:
                        EdgeInsets.symmetric(vertical: 16), // Optional padding
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Form submitted successfully!'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                    Navigator.of(context).pushNamed('/home');
                  },
                  child: Text(
                    'Upload Materials',
                    style:
                        TextStyle(fontSize: 18), // Adjust font size if needed
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
