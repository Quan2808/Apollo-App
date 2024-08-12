import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  final String message;
  final String gifPath;

  const LoadingScreen({
    Key? key,
    this.message = 'Please wait...',
    this.gifPath = 'assets/logos/loading.gif',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white, // Nền trắng
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      gifPath,
                      width: 190, // Kích thước hình GIF
                      height: 190,
                    ),
                    // CircularProgressIndicator được đặt sau hình GIF để đè lên
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Center(
                        child: SizedBox(
                          width: 200, // Kích thước vòng tròn to hơn để đè lên GIF
                          height: 200,
                          child: CircularProgressIndicator(
                            strokeWidth: 6.0, // Độ dày của đường viền loading
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.black), // Màu sắc của loading
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  message,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13, // Kích thước nhỏ hơn cho message
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
