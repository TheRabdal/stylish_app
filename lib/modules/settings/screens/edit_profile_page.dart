import 'package:stylish_app/packages/packages.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();

  // Personal Details
  final TextEditingController _emailController = TextEditingController(
    text: "aashifa@gmail.com",
  );
  final TextEditingController _passwordController = TextEditingController(
    text: "password123",
  );

  // Business Address Details
  final TextEditingController _pincodeController = TextEditingController(
    text: "450116",
  );
  final TextEditingController _addressController = TextEditingController(
    text: "216 St Paul's Rd,",
  );
  final TextEditingController _cityController = TextEditingController(
    text: "London",
  );
  final TextEditingController _countryController = TextEditingController(
    text: "United Kingdom",
  );
  String? _selectedState = "N1 2LL,"; // Dropdown value

  // Bank Account Details
  final TextEditingController _bankAccountController = TextEditingController(
    text: "204356XXXXXXX",
  );
  final TextEditingController _holderNameController = TextEditingController(
    text: "Abhiraj Sisodiya",
  );
  final TextEditingController _ifscController = TextEditingController(
    text: "SBIN00428",
  );

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _pincodeController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _countryController.dispose();
    _bankAccountController.dispose();
    _holderNameController.dispose();
    _ifscController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Checkout", // Title as per design image, though context is Edit Profile.
          style: GoogleFonts.montserrat(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Avatar
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-1.2.1&auto=format&fit=crop&w=100&q=80',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          color: Color(0xFF4392F9),
                          shape: BoxShape.circle,
                          border: Border.fromBorderSide(
                            BorderSide(color: Colors.white, width: 2),
                          ),
                        ),
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Personal Details
              _buildSectionTitle("Personal Details"),
              const SizedBox(height: 16),
              _buildTextField(
                label: "Email Address",
                controller: _emailController,
              ),
              const SizedBox(height: 16),
              _buildTextField(
                label: "Password",
                controller: _passwordController,
                isPassword: true,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 24),
                  child: Text(
                    "Change Password",
                    style: GoogleFonts.montserrat(
                      color: const Color(0xFFF83758),
                      fontSize: 12,
                      decoration: TextDecoration.underline,
                      decorationColor: const Color(0xFFF83758),
                    ),
                  ),
                ),
              ),

              const Divider(color: Colors.grey, thickness: 0.1),
              const SizedBox(height: 24),

              // Business Address Details
              _buildSectionTitle("Business Address Details"),
              const SizedBox(height: 16),
              _buildTextField(label: "Pincode", controller: _pincodeController),
              const SizedBox(height: 16),
              _buildTextField(label: "Address", controller: _addressController),
              const SizedBox(height: 16),
              _buildTextField(label: "City", controller: _cityController),
              const SizedBox(height: 16),
              _buildDropdownField(
                label: "State",
                value: _selectedState,
                items: ["N1 2LL,", "State 2", "State 3"],
                onChanged: (val) => setState(() => _selectedState = val),
              ),
              const SizedBox(height: 16),
              _buildTextField(label: "Country", controller: _countryController),

              const SizedBox(height: 24),
              const Divider(color: Colors.grey, thickness: 0.1),
              const SizedBox(height: 24),

              // Bank Account Details
              _buildSectionTitle("Bank Account Details"),
              const SizedBox(height: 16),
              _buildTextField(
                label: "Bank Account Number",
                controller: _bankAccountController,
              ),
              const SizedBox(height: 16),
              _buildTextField(
                label: "Account Holder's Name",
                controller: _holderNameController,
              ),
              const SizedBox(height: 16),
              _buildTextField(label: "IFSC Code", controller: _ifscController),

              const SizedBox(height: 48),

              // Save Button
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Profile Updated Successfuly!"),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF83758),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    "Save",
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.montserrat(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    bool isPassword = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.montserrat(
            fontSize: 12, // Smaller label as per design
            fontWeight: FontWeight.w500,
            color: Colors.black54, // Lighter color
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: isPassword,
          style: GoogleFonts.montserrat(
            fontSize: 14,
            fontWeight: FontWeight.bold, // Bold input text
            color: Colors.black,
          ),
          decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFF83758)),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Required';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.montserrat(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              isExpanded: true,
              icon: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
              style: GoogleFonts.montserrat(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              onChanged: onChanged,
              items: items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
