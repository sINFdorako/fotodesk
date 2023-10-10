import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingRows extends StatelessWidget {
  const LoadingRows({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5, // Adjust as needed
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // Mimicking checkbox
                Container(
                  width: 24.0, // Checkbox size
                  height: 24.0, // Checkbox size
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 16,
                ),
                // Mimicking image
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Container(
                      width: double.infinity,
                      height: 100.0, // Assuming height of the image
                      color: Colors.white,
                    ),
                  ),
                ),
                // Mimicking file name
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 20.0,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                // Mimicking file size
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 20.0,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                // Mimicking last modified date
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 20.0,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                // Mimicking file type
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 20.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
