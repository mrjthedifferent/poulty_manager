import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '/feature/home/widgets/slider.dart';
import '/gen/assets.gen.dart';
import '/interface/image_text.dart';

class HomeFragments extends StatelessWidget {
  const HomeFragments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Assets.images.henVideo.image(),
        const SizedBox(
          height: 2,
        ),
        const HomeSlider().padding(all: 4),
        [
          CreateGridItem(
            image: Assets.images.hen.image(
              height: 50,
              width: 50,
            ),
            text: Styled.text('ব্যাচ লিস্ট'),
            onPressed: () {},
          ),
          CreateGridItem(
            image: Assets.images.amarTaka.image(
              height: 50,
              width: 50,
            ),
            text: Styled.text('আমার টাকা'),
            onPressed: () {},
          ),
          CreateGridItem(
            image: Assets.images.khabarerMojud.image(
              height: 50,
              width: 50,
            ),
            text: Styled.text('খামারি ঘর'),
            onPressed: () {},
          ),
          CreateGridItem(
            image: Assets.images.inbox.image(
              height: 50,
              width: 50,
            ),
            text: Styled.text('ইনবক্স'),
            onPressed: () {},
          ),
        ].grid(
          primary: false,
          shrinkWrap: true,
        ),
        List.generate(
            12,
            (index) => CreateGridItem(
                  image: Assets.images.khamarGhor.image(
                    height: 50,
                    width: 50,
                  ),
                  text: Styled.text('ব্যাচ লিস্ট $index'),
                  onPressed: () {},
                )).grid(
          primary: false,
          shrinkWrap: true,
        ),
        List.generate(
            8,
            (index) => CreateGridItem(
                  image: Assets.images.dealerList.image(
                    height: 50,
                    width: 50,
                  ),
                  text: Styled.text('ব্যাচ লিস্ট $index'),
                  onPressed: () {},
                )).grid(
          primary: false,
          shrinkWrap: true,
        ),
      ],
    );
  }
}
