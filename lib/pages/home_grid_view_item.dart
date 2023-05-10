import 'package:flutter/material.dart';
import '../models/home_model.dart';

class HomeGridViewItem extends StatefulWidget {
  const HomeGridViewItem({
    super.key,
    required this.model,
    required this.onPressed,
    this.noHero = false,
  });

  final HomeModel? model;
  final VoidCallback onPressed;
  final bool noHero;

  @override
  HomeGridViewItemState createState() => HomeGridViewItemState();
}

class HomeGridViewItemState extends State<HomeGridViewItem> {
  @override
  Widget build(BuildContext context) {
    List<Widget> children = <Widget>[
      ClipRect(
        clipper: _SquareClipper(),
        child: widget.noHero
            ? Image.network(widget.model?.thumbnailUrl.toString() ?? '',
                fit: BoxFit.fill)
            : Hero(
                tag: '${widget.model?.id}',
                child: Image.network(
                    widget.model?.thumbnailUrl?.toString() ?? '',
                    fit: BoxFit.fill),
              ),
      ),
      Container(
        decoration: _buildGradientBackground(),
        padding: const EdgeInsets.only(
          bottom: 16.0,
          left: 16.0,
          right: 16.0,
        ),
        child: _buildTextualInfo(widget.model),
      ),
    ];

    return InkWell(
      onTap: widget.onPressed,
      child: Card(
        child: Stack(
          fit: StackFit.expand,
          children: children,
        ),
      ),
    );
  }

  BoxDecoration _buildGradientBackground() {
    return const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        stops: <double>[0.0, 0.7, 0.7],
        colors: <Color>[
          Colors.black,
          Colors.transparent,
          Colors.transparent,
        ],
      ),
    );
  }

  Widget _buildTextualInfo(HomeModel? movieCard) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          movieCard?.title.toString() ?? '',
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16.0,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 4.0),
      ],
    );
  }
}

class _SquareClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(0.0, 0.0, size.width, size.width);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return false;
  }
}
