import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_adoption_app/core/const/const.dart';
import 'package:pet_adoption_app/presentation/pages/temp_home2.dart';
import 'package:pet_adoption_app/presentation/widgets/image_zoom_page.dart';

class AnimalDetailScreen extends StatefulWidget {
  final Animal animal;

  const AnimalDetailScreen({super.key, required this.animal});

  @override
  State<AnimalDetailScreen> createState() => _AnimalDetailScreenState();
}

class _AnimalDetailScreenState extends State<AnimalDetailScreen> {
  final ConfettiController _confettiController =
      ConfettiController(duration: const Duration(seconds: 3));

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(
              CupertinoIcons.share,
              // color: Theme.of(context).primaryColor,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ImageZoomPage(
                            imageProvider: AssetImage(
                              widget.animal.imageUrl ??
                                  'assets/images/sola.png',
                            ),
                            bgColor:
                                widget.animal.backgroundColor ?? Colors.white,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      width: double.infinity,
                      color: widget.animal.backgroundColor,
                      child: SizedBox(
                        height: screenHeight * 0.35,
                        child: Hero(
                          tag: widget.animal.name ?? " - ",
                          child: Image(
                            image: AssetImage(
                              widget.animal.imageUrl ??
                                  'assets/images/sola.png',
                            ),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                  ColoredBox(
                    color: widget.animal.backgroundColor ?? Colors.white,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 22.0,
                        vertical: 30.0,
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        children: [
                          AnimalProfileInfo(animal: widget.animal),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DetailItem(
                                color: green,
                                valueText: (widget.animal.isFemale ?? false)
                                    ? "Female"
                                    : "Male",
                                keyText: 'Sex',
                              ),
                              DetailItem(
                                color: orange,
                                valueText: '${widget.animal.age} Years',
                                keyText: 'Age',
                              ),
                              DetailItem(
                                color: blue,
                                valueText: "${widget.animal.weight} Kg",
                                keyText: 'Weight',
                              )
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              const CircleAvatar(
                                radius: 22.0,
                                backgroundImage:
                                    AssetImage('assets/images/sola.png'),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          'Maya Berkovskaya',
                                          style: TextStyle(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const Text(
                                          'May 25, 2019',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 8.0,
                                    ),
                                    const Text(
                                      'Owner',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          const Text(
                            'My job requires moving to another country. I don\'t have the opportunity to take the cat with me. I am looking for good people who will shelter Sola.  I don\'t have the opportunity to take the cat with me. I am looking for good people who will shelter Sola.  I don\'t have the opportunity to take the cat with me. I am looking for good people who will shelter Sola.  I don\'t have the opportunity to take the cat with me. I am looking for good people who will shelter Sola.  I don\'t have the opportunity to take the cat with me. I am looking for good people who will shelter Sola.  I don\'t have the opportunity to take the cat with me. I am looking for good people who will shelter Sola.  I don\'t have the opportunity to take the cat with me. I am looking for good people who will shelter Sola.  I don\'t have the opportunity to take the cat with me. I am looking for good people who will shelter Sola.',
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirectionality: BlastDirectionality
                  .explosive, // don't specify a direction, blast randomly
              shouldLoop:
                  true, // start again as soon as the animation is finished
              colors: const [
                Colors.green,
                Colors.blue,
                Colors.pink,
                Colors.orange,
                Colors.purple
              ], // manually specify the colors to be used
              // createParticlePath: drawStar, // define a custom shape/path.
            ),
          ),
        ],
      ),
      bottomNavigationBar: DetailScreenBottom(onClick: _showAdoptionPopup),
    );
  }

  void _showAdoptionPopup() {
    AwesomeDialog(
      dismissOnTouchOutside: false,
      context: context,
      dialogType: DialogType.SUCCES,
      animType: AnimType.SCALE,
      title: 'Adoption Done',
      desc: 'You\'ve now adopted ${widget.animal.name}',
      btnOkOnPress: () {
        _confettiController.stop();
        // Navigator.of(context).pop();
      },
    ).show();
    // showDialog(
    //   context: context,
    //   barrierDismissible: false,
    //   builder: (BuildContext context) {
    //     return WillPopScope(
    //       onWillPop: () => Future.value(false),
    //       child: AlertDialog(
    //         title: const Text('Adoption Confirmation'),
    //         content: Text('You\'ve now adopted ${widget.animal.name}'),
    //         actions: [
    //           TextButton(
    //             child: const Text('OK'),
    //             onPressed: () {
    //               _confettiController.stop();
    //               Navigator.of(context).pop();
    //             },
    //           ),
    //         ],
    //       ),
    //     );
    //   },
    // );

    _confettiController.play();
  }
}

class DetailScreenBottom extends StatelessWidget {
  const DetailScreenBottom({
    super.key,
    required this.onClick,
  });
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 3),
            color: blue,
            spreadRadius: 0,
            blurRadius: 10,
          )
        ],
        color: blue,
      ),
      child: InkWell(
        onTap: onClick,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Adopt Me',
                style: poppins.copyWith(fontSize: 14, color: white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailItem extends StatelessWidget {
  final Color color;
  final String valueText, keyText;
  const DetailItem({
    Key? key,
    required this.color,
    required this.valueText,
    required this.keyText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: [
          Container(
            height: 80,
            width: MediaQuery.of(context).size.width / 3 - 25,
            decoration: BoxDecoration(
              color: color.withOpacity(0.6),
            ),
            child: Stack(
              children: [
                Positioned(
                  bottom: -10,
                  right: -5,
                  child: Transform.rotate(
                    angle: 12,
                    child: SvgPicture.asset(
                      'assets/images/Paw_Print.svg',
                      color: color,
                      height: 60,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 80,
            width: MediaQuery.of(context).size.width / 3 - 25,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  valueText,
                  style: poppins.copyWith(
                      fontSize: 16, color: black, fontWeight: FontWeight.bold),
                ),
                Text(
                  keyText,
                  style: poppins.copyWith(
                    fontSize: 14,
                    color: black.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AnimalProfileInfo extends StatelessWidget {
  const AnimalProfileInfo({super.key, required this.animal});

  final Animal animal;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          animal.name?.toString() ?? " - ",
          style: poppins.copyWith(
            fontSize: 24,
            color: black,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            const Icon(
              Icons.location_on_outlined,
              color: blue,
              size: 16,
            ),
            Text(
              '${animal.distanceToUser}',
              style:
                  poppins.copyWith(color: black.withOpacity(0.6), fontSize: 14),
            ),
          ],
        )
      ],
    );
  }
}
