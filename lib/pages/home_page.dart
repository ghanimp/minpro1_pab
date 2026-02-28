import 'package:flutter/material.dart';
import 'form_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, String>> bookingList = [];

  void addBooking(Map<String, String> data) {
    setState(() {
      bookingList.add(data);
    });
  }

  void updateBooking(int index, Map<String, String> data) {
    setState(() {
      bookingList[index] = data;
    });
  }

  void deleteBooking(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: const Text("Hapus Booking"),
        content: const Text("Yakin ingin menghapus booking ini?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Batal"),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                bookingList.removeAt(index);
              });
              Navigator.pop(context);
            },
            child: const Text(
              "Hapus",
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E3C72),
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Futsal Arena",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: bookingList.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.sports_soccer,
                      size: 80,
                      color: Color(0xFF1E3C72),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Belum ada booking",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              )
            : ListView.builder(
                itemCount: bookingList.length,
                itemBuilder: (context, index) {
                  final data = bookingList[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    child: Card(
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(18),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(14),
                              decoration: BoxDecoration(
                                color: const Color(0xFFE0E7FF),
                                borderRadius:
                                    BorderRadius.circular(16),
                              ),
                              child: const Icon(
                                Icons.sports_soccer,
                                color: Color(0xFF1E3C72),
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data["nama"] ?? "",
                                    style: const TextStyle(
                                      fontWeight:
                                          FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    "${data["lapangan"]} • Jam: ${data["jam"]}",
                                    style: const TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                  Text(
                                    "Nomor HP: ${data["nohp"]}",
                                    style: const TextStyle(
                                      color: Colors.black45,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.blue,
                                  ),
                                  onPressed: () async {
                                    final result =
                                        await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            FormPage(
                                          bookingData: data,
                                        ),
                                      ),
                                    );

                                    if (result != null) {
                                      updateBooking(
                                          index, result);
                                    }
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  onPressed: () =>
                                      deleteBooking(index),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Color(0xFF1E3C72),
        elevation: 6,
        icon: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        label: const Text(
          "Tambah",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FormPage(),
            ),
          );

          if (result != null) {
            addBooking(result);
          }
        },
      ),
    );
  }
}