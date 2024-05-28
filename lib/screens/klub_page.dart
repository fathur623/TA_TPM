import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ta_tpm/screens/detail_klub_page.dart';
import 'dart:convert';

class Klub extends StatefulWidget {
  final int leagueId;

  Klub({required this.leagueId});

  @override
  _KlubState createState() => _KlubState();
}

class _KlubState extends State<Klub> {
  List<dynamic> _teams = [];
  List<dynamic> _filteredTeams = [];
  bool _isLoading = true;
  TextEditingController _searchController = TextEditingController();

  Future<void> _fetchTeams() async {
    try {
      final response = await http.get(Uri.parse(
          'https://go-football-api-v44dfgjgyq-et.a.run.app/${widget.leagueId}'));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        print('Team data fetched: $jsonData');
        setState(() {
          _teams = jsonData['Data'] ?? [];
          _filteredTeams = _teams;
          _isLoading = false;
        });
      } else {
        print('Failed to load teams: ${response.statusCode}');
        throw Exception('Failed to load teams');
      }
    } catch (e) {
      print('Error fetching teams: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchTeams();
    _searchController.addListener(_filterTeams);
  }

  void _filterTeams() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredTeams = _teams.where((team) {
        final teamName = team['NameClub']?.toLowerCase() ?? '';
        return teamName.contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Cari berdasarkan Nama Klub',
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white),
          ),
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0), // Add padding here
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : _filteredTeams.isEmpty
                ? Center(child: Text('No teams found'))
                : ListView.builder(
                    itemCount: _filteredTeams.length,
                    itemBuilder: (context, index) {
                      final team = _filteredTeams[index];
                      final teamName = team['NameClub'] ?? 'Unknown Team';
                      final logoUrl = team['LogoClubUrl'] ?? '';
                      final stadiumName =
                          team['StadiumName'] ?? 'Unknown Stadium';

                      return Card(
                        child: ListTile(
                          leading: logoUrl.isNotEmpty
                              ? Image.network(
                                  logoUrl,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Icon(Icons.error);
                                  },
                                )
                              : Icon(Icons.sports),
                          title: Text(teamName),
                          subtitle: Text(
                            stadiumName,
                            style: TextStyle(fontSize: 12),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    Detail(teamId: team['IdClub']),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
      ),
    );
  }
}
