import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  final Map<String, String>? bookingData;

  const FormPage({super.key, this.bookingData});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();

  final namaController = TextEditingController();
  final noHpController = TextEditingController();
  final jamController = TextEditingController();

  String? selectedLapangan;

  final List<String> lapanganList = [
    "Lapangan 1",
    "Lapangan 2",
    "Lapangan 3",
  ];

  @override
  void initState() {
    super.initState();

    if (widget.bookingData != null) {
      namaController.text = widget.bookingData!["nama"] ?? "";
      noHpController.text = widget.bookingData!["nohp"] ?? "";
      jamController.text = widget.bookingData!["jam"] ?? "";
      selectedLapangan = widget.bookingData!["lapangan"];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          widget.bookingData == null
              ? "Tambah Booking"
              : "Edit Booking",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1E3C72), Color(0xFF2A5298)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 120, 20, 20),
          child: SingleChildScrollView(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              elevation: 12,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [

                      buildTextField(
                        controller: namaController,
                        label: "Nama Pemesan",
                        icon: Icons.person,
                      ),
                      const SizedBox(height: 15),

                      buildPhoneField(),
                      const SizedBox(height: 15),

                      DropdownButtonFormField<String>(
                        value: selectedLapangan,
                        items: lapanganList.map((lapangan) {
                          return DropdownMenuItem(
                            value: lapangan,
                            child: Text(lapangan),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedLapangan = value;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Pilih Nomor Lapangan";
                          }
                          return null;
                        },
                        decoration: buildDecoration(
                            "Nomor Lapangan", Icons.sports_soccer),
                      ),
                      const SizedBox(height: 15),

                      buildTextField(
                        controller: jamController,
                        label: "Jam Booking",
                        icon: Icons.access_time,
                      ),
                      const SizedBox(height: 30),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding:
                                const EdgeInsets.symmetric(vertical: 18),
                            backgroundColor:
                                const Color(0xFF1E3C72),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(20),
                            ),
                            elevation: 8,
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.pop(context, {
                                "nama": namaController.text,
                                "nohp": noHpController.text,
                                "lapangan":
                                    selectedLapangan ?? "",
                                "jam": jamController.text,
                              });
                            }
                          },
                          child: Text(
                            widget.bookingData == null
                                ? "Simpan Booking"
                                : "Update Booking",
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,  
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
  }) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "$label tidak boleh kosong";
        }

        if (label == "Nama Pemesan") {
          if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
            return "Nama hanya boleh huruf";
          }
        }

        return null;
      },
      decoration: buildDecoration(label, icon),
    );
  }

  Widget buildPhoneField() {
    return TextFormField(
      controller: noHpController,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Nomor HP tidak boleh kosong";
        }
        if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
          return "Nomor HP harus berupa angka";
        }
        return null;
      },
      decoration: buildDecoration("Nomor HP", Icons.phone),
    );
  }

  InputDecoration buildDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon, color: const Color(0xFF1E3C72)),
      filled: true,
      fillColor: Colors.grey[100],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide.none,
      ),
    );
  }
}