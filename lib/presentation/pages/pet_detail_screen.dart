import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_adoption_app/core/const/color_const.dart';
import 'package:pet_adoption_app/core/const/font_const.dart';
import 'package:pet_adoption_app/core/const/media_const.dart';
import 'package:pet_adoption_app/di/locator.dart';
import 'package:pet_adoption_app/domain/entities/pet.dart';
import 'package:pet_adoption_app/presentation/bloc/pet_detail_bloc.dart';
import 'package:pet_adoption_app/presentation/widget/pet_detail/pet_info_section.dart';
import 'package:pet_adoption_app/presentation/common/image_zoom_page.dart';

class PetDetailScreen extends StatefulWidget {
  final Pet pet;

  const PetDetailScreen({super.key, required this.pet});

  @override
  State<PetDetailScreen> createState() => _PetDetailScreenState();
}

class _PetDetailScreenState extends State<PetDetailScreen> {
  final ConfettiController _confettiController =
      ConfettiController(duration: const Duration(seconds: 3));

  late Pet pet;
  late PetDetailsBloc bloc;

  @override
  void initState() {
    super.initState();

    pet = widget.pet;

    bloc = PetDetailsBloc(
      pet,
      getIt.get(),
      getIt.get(),
    )..onCheckOfAdoption();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PetDetailsBloc, PetDetailState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is SuccessAdoptPetDetailState) {
          _showAdoptionPopup();
        }
      },
      child: Scaffold(
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
                    PetDetailTopImageSection(pet: pet),
                    PetInfoSection(pet: pet),
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
        bottomNavigationBar: DetailScreenBottom(petDetailsBloc: bloc),
      ),
    );
  }

  void _showAdoptionPopup() {
    AwesomeDialog(
      dismissOnTouchOutside: false,
      context: context,
      dialogType: DialogType.SUCCES,
      animType: AnimType.SCALE,
      title: 'Adoption Done',
      desc: 'You\'ve now adopted ${pet.name}',
      btnOkOnPress: () {
        _confettiController.stop();
      },
    ).show();

    _confettiController.play();
  }
}

class PetDetailTopImageSection extends StatelessWidget {
  const PetDetailTopImageSection({
    super.key,
    required this.pet,
  });

  final Pet pet;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ImageZoomPage(
              imageProvider: AssetImage(
                pet.imageUrl,
              ),
              bgColor: pet.backgroundColor ?? Colors.white,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        width: double.infinity,
        color: pet.backgroundColor,
        child: SizedBox(
          height: screenHeight * 0.35,
          child: Hero(
            tag: pet.name ?? " - ",
            child: Image(
              image: AssetImage(
                pet.imageUrl ?? ImageConst.transparentCat,
              ),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}

class DetailScreenBottom extends StatelessWidget {
  final PetDetailsBloc petDetailsBloc;

  const DetailScreenBottom({
    super.key,
    required this.petDetailsBloc,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PetDetailsBloc, PetDetailState>(
      bloc: petDetailsBloc,
      builder: (context, state) {
        final isDisabled = petDetailsBloc.isDisabled();

        final showLoading = state is LoadingPetDetailState;

        return Container(
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 3),
                color: isDisabled ? Colors.grey : ColorConst.blue,
                spreadRadius: 0,
                blurRadius: 10,
              )
            ],
            color: isDisabled ? Colors.grey.shade700 : ColorConst.blue,
          ),
          child: InkWell(
            onTap: isDisabled ? null : petDetailsBloc.onAdopt,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (showLoading)
                    const CupertinoActivityIndicator(color: Colors.white)
                  else
                    Text(
                      petDetailsBloc.isAdopted() ? "Adoptted" : 'Adopt Me',
                      style: FontConst.poppins
                          .copyWith(fontSize: 14, color: ColorConst.white),
                    ),
                ],
              ),
            ),
          ),
        );
      },
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
                  style: FontConst.poppins.copyWith(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  keyText,
                  style: FontConst.poppins.copyWith(
                    fontSize: 14,
                    color: Colors.black.withOpacity(0.6),
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

class PetProfileInfo extends StatelessWidget {
  const PetProfileInfo({super.key, required this.animal});

  final Pet animal;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          animal.name.toString(),
          style: FontConst.poppins.copyWith(
            fontSize: 24,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            const Icon(
              Icons.location_on_outlined,
              color: Colors.blue,
              size: 16,
            ),
            Text(
              '${animal.distanceToUser}',
              style: FontConst.poppins.copyWith(
                color: Colors.black.withOpacity(0.6),
                fontSize: 14,
              ),
            ),
          ],
        )
      ],
    );
  }
}
