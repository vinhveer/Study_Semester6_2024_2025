import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

AuthResponse? reponse;
String? email; // Biến toàn cục để lưu email

class PageAuthUser extends StatefulWidget {
  const PageAuthUser({super.key});

  @override
  State<PageAuthUser> createState() => _PageAuthUserState();
}

class _PageAuthUserState extends State<PageAuthUser> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign in"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
                child: Container()
            ),

            // Create a Email sign-in/sign-up form
            SupaEmailAuth(
                onSignInComplete: (response) {
                  reponse = response;
                  Navigator.of(context).pop();
                },
                onSignUpComplete: (response) {
                  if (response.user != null) {
                    // Lưu email trước khi chuyển trang
                    email = response.user!.email;
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const PageVerifyOTP(),
                      ),
                    );
                  }
                },
                metadataFields: [
                  // Creates an additional TextField for string metadata, for example:
                  // {'username': 'exampleUsername'}
                  MetaDataField(
                    prefixIcon: const Icon(Icons.person),
                    label: 'Username',
                    key: 'username',
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Please enter something';
                      }
                      return null;
                    },
                  ),

                  BooleanMetaDataField(
                    key: 'terms_agreement',
                    isRequired: true,
                    checkboxPosition: ListTileControlAffinity.leading,
                    richLabelSpans: [
                      const TextSpan(
                          text: 'I have read and agree to the '),
                      TextSpan(
                        text: 'Terms and Conditions',
                        style: const TextStyle(
                          color: Colors.blue,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // do something, for example: navigate("terms_and_conditions");
                          },
                      ),
                    ],
                  ),
                ]),

            Expanded(
                child: Container()
            ),

          ],
        ),
      ),
    );
  }
}

class PageVerifyOTP extends StatefulWidget {
  const PageVerifyOTP({super.key});

  @override
  State<PageVerifyOTP> createState() => _PageVerifyOTPState();
}

class _PageVerifyOTPState extends State<PageVerifyOTP> {
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey<ScaffoldMessengerState>();
  bool _isLoading = false;

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text("Verify OTP"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Vui lòng nhập mã OTP đã được gửi đến email của bạn",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            if (email != null)
              Text(
                "Email: $email",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            const SizedBox(height: 30),
            OtpTextField(
              numberOfFields: 6,
              borderColor: const Color(0xFF512DA8),
              showFieldAsBox: true,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here           
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) async {
                setState(() {
                  _isLoading = true;
                });

                try {
                  // Xác minh OTP với Supabase
                  reponse = await Supabase.instance.client.auth.verifyOTP(
                    email: email ?? '',  // Sử dụng email đã lưu
                    token: verificationCode,
                    type: OtpType.signup,  // Loại xác thực là đăng ký
                  );

                  if (reponse?.user != null) {
                    // Nếu xác thực thành công, chuyển đến trang thông tin khách hàng
                    if (!mounted) return;
                    _showSnackBar("Xác thực thành công!");
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const PageThongTinKhachHang(),
                      ),
                    );
                  } else {
                    // Nếu không thành công
                    if (!mounted) return;
                    _showSnackBar("Xác thực không thành công, vui lòng thử lại!");
                  }
                } catch (e) {
                  if (!mounted) return;
                  _showSnackBar("Lỗi: ${e.toString()}");
                } finally {
                  if (mounted) {
                    setState(() {
                      _isLoading = false;
                    });
                  }
                }
              }, // end onSubmit
            ),
            const SizedBox(height: 20),
            if (_isLoading)
              const CircularProgressIndicator(),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () async {
                // Gửi lại OTP
                try {
                  await Supabase.instance.client.auth.resend(
                    type: OtpType.signup,
                    email: email,
                  );
                  if (!mounted) return;
                  _showSnackBar("Đã gửi lại mã OTP, vui lòng kiểm tra email của bạn!");
                } catch (e) {
                  if (!mounted) return;
                  _showSnackBar("Lỗi khi gửi lại mã OTP: ${e.toString()}");
                }
              },
              child: const Text("Gửi lại mã OTP"),
            ),
          ],
        ),
      ),
    );
  }
}

class PageThongTinKhachHang extends StatefulWidget {
  final VoidCallback? onCompleted;

  const PageThongTinKhachHang({
    super.key,
    this.onCompleted,
  });

  @override
  State<PageThongTinKhachHang> createState() => _PageThongTinKhachHangState();
}

class _PageThongTinKhachHangState extends State<PageThongTinKhachHang> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _tenKhachHangController = TextEditingController();
  final TextEditingController _soDienThoaiController = TextEditingController();
  final TextEditingController _diaChiController = TextEditingController();

  bool _isLoading = false;
  bool _isInitializing = true;
  String? _userId;

  @override
  void initState() {
    super.initState();
    _loadCustomerData();
  }

  @override
  void dispose() {
    _tenKhachHangController.dispose();
    _soDienThoaiController.dispose();
    _diaChiController.dispose();
    super.dispose();
  }

  // Hiển thị thông báo
  void _showSnackBar(String message, {bool isError = false}) {
    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.green,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  // Nạp dữ liệu khách hàng nếu đã tồn tại
  Future<void> _loadCustomerData() async {
    try {
      // Lấy ID của người dùng hiện tại
      final currentUser = Supabase.instance.client.auth.currentUser;
      if (currentUser == null) {
        if (mounted) {
          _showSnackBar("Không tìm thấy thông tin đăng nhập!", isError: true);
        }
        setState(() {
          _isInitializing = false;
        });
        return;
      }

      _userId = currentUser.id;

      // Truy vấn thông tin khách hàng từ Supabase
      final response = await Supabase.instance.client
          .from('KhachHang')
          .select()
          .eq('id', _userId as Object)
          .maybeSingle();

      // Nếu có dữ liệu, điền vào form
      if (response != null && mounted) {
        setState(() {
          _tenKhachHangController.text = response['tenKhachHang'] ?? '';
          _soDienThoaiController.text = response['soDienThoai'] ?? '';
          _diaChiController.text = response['diaChi'] ?? '';
        });
      }
    } catch (e) {
      if (mounted) {
        _showSnackBar("Lỗi khi tải thông tin: ${e.toString()}", isError: true);
      }
    } finally {
      if (mounted) {
        setState(() {
          _isInitializing = false;
        });
      }
    }
  }

  // Gửi thông tin khách hàng
  Future<void> _submitThongTinKhachHang() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        if (_userId == null) {
          _showSnackBar("Không tìm thấy thông tin người dùng!", isError: true);
          return;
        }

        // Chuẩn bị dữ liệu để lưu vào bảng KhachHang
        final customerData = {
          'id': _userId,
          'tenKhachHang': _tenKhachHangController.text.trim(),
          'diaChi': _diaChiController.text.trim(),
          'soDienThoai': _soDienThoaiController.text.trim(),
          'created_at': DateTime.now().toIso8601String(),
        };

        // Cập nhật thông tin vào bảng KhachHang trong Supabase
        final response = await Supabase.instance.client
            .from('KhachHang')
            .upsert(customerData)
            .select();

        if (!mounted) return;

        _showSnackBar("Cập nhật thông tin thành công!");

        // Gọi callback nếu được cung cấp
        if (widget.onCompleted != null) {
          widget.onCompleted!();
        }

        // Optional: Chuyển đến trang chính sau khi cập nhật thành công
        // Navigator.of(context).pushReplacementNamed('/home');

      } catch (e) {
        if (!mounted) return;
        _showSnackBar("Lỗi khi cập nhật thông tin: ${e.toString()}", isError: true);
      } finally {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Thông tin khách hàng"),
      ),
      body: _isInitializing
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Vui lòng cung cấp thông tin cá nhân",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              // Tên khách hàng
              TextFormField(
                controller: _tenKhachHangController,
                decoration: const InputDecoration(
                  labelText: 'Tên khách hàng',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Vui lòng nhập tên khách hàng';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Số điện thoại
              TextFormField(
                controller: _soDienThoaiController,
                decoration: const InputDecoration(
                  labelText: 'Số điện thoại',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone),
                  hintText: '0xxxxxxxxx',
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Vui lòng nhập số điện thoại';
                  }
                  // Kiểm tra định dạng số điện thoại Việt Nam
                  if (!RegExp(r'^(0[3|5|7|8|9])+([0-9]{8})$').hasMatch(value.trim())) {
                    return 'Số điện thoại không hợp lệ';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Địa chỉ
              TextFormField(
                controller: _diaChiController,
                decoration: const InputDecoration(
                  labelText: 'Địa chỉ',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.home),
                ),
                maxLines: 2,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Vui lòng nhập địa chỉ';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),

              // Button Submit
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _submitThongTinKhachHang,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundColor: Colors.white,
                    disabledBackgroundColor: Colors.grey,
                  ),
                  child: _isLoading
                      ? const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2.0,
                      )
                  )
                      : const Text(
                    'Lưu thông tin',
                    style: TextStyle(fontSize: 18),
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