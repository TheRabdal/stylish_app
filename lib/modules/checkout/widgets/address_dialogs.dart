import 'package:stylish_app/packages/packages.dart';

class AddressDialogs {
  static void showEditDialog(
    BuildContext context, {
    required int index,
    required List<Map<String, String>> addresses,
    required Function(int, String, String) onSave,
  }) {
    final addressController = TextEditingController(
      text: addresses[index]['address'],
    );
    final contactController = TextEditingController(
      text: addresses[index]['contact'],
    );

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Edit Address",
          style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: addressController,
              decoration: InputDecoration(
                labelText: "Address",
                labelStyle: GoogleFonts.montserrat(),
                border: const OutlineInputBorder(),
              ),
              maxLines: 2,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: contactController,
              decoration: InputDecoration(
                labelText: "Contact",
                labelStyle: GoogleFonts.montserrat(),
                border: const OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Cancel",
              style: GoogleFonts.montserrat(color: Colors.grey),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              onSave(index, addressController.text, contactController.text);
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFF83758),
            ),
            child: Text(
              "Save",
              style: GoogleFonts.montserrat(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  static void showAddDialog(
    BuildContext context, {
    required Function(String, String) onAdd,
  }) {
    final addressController = TextEditingController();
    final contactController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Add New Address",
          style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: addressController,
              decoration: InputDecoration(
                labelText: "Address",
                labelStyle: GoogleFonts.montserrat(),
                border: const OutlineInputBorder(),
              ),
              maxLines: 2,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: contactController,
              decoration: InputDecoration(
                labelText: "Contact",
                labelStyle: GoogleFonts.montserrat(),
                border: const OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Cancel",
              style: GoogleFonts.montserrat(color: Colors.grey),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (addressController.text.isNotEmpty &&
                  contactController.text.isNotEmpty) {
                onAdd(addressController.text, contactController.text);
                Navigator.pop(context);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFF83758),
            ),
            child: Text(
              "Add",
              style: GoogleFonts.montserrat(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
