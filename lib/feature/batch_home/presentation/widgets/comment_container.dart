import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

Widget commentContainer() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey, width: 0.2),
      ),
      child: Column(
        children: [
          // Profile Row (Profile picture, Name, Farm name)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                // Profile picture
                const CircleAvatar(
                  radius: 20,
                  child: Icon(Icons.person),
                ),

                const SizedBox(
                  width: 10,
                ),
                // Name and Farm name
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Styled.text('মোঃ বারেক ওভামা').fontSize(16),
                    Row(
                      children: [
                        Styled.text('হাজী এগ্রো ফার্ম')
                            .fontSize(14)
                            .textColor(Colors.grey),
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(
                          Icons.verified,
                          color: Colors.orange,
                          size: 15,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.grey,
            thickness: 0.2,
          ),
          // Comments Row
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Styled.text('Lorem ipsum dolor sit amet consectetur...')
                    .fontSize(12)
                    .textColor(Colors.grey),
              ],
            ),
          ),
          const Divider(
            color: Colors.grey,
            thickness: 0.2,
          ),

          // Total Like comment and view count with icon
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.favorite_border_outlined,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Styled.text('26k').fontSize(12),
                  ],
                ),
                Row(
                  children: [
                    GestureDetector(
                      child: const Icon(
                        Icons.comment_outlined,
                        color: Colors.grey,
                      ),
                      onTap: () {},
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Styled.text('20k').fontSize(12),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.remove_red_eye_outlined,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Styled.text('500k').fontSize(12),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
