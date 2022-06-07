import 'package:buildathon_main/views/fertilizerCalculator.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:tflite/tflite.dart';

class MainScreen extends StatefulWidget {
  final String title;

  const MainScreen({Key? key, required this.title}) : super(key: key);
  @override
  _DiseaseDetectionState createState() => _DiseaseDetectionState();
}

class _DiseaseDetectionState extends State<MainScreen> {
  List _outputs = [];
  XFile? _image;
  bool _loading = false;
  int _selectedIndex = 1;

  loadModel() async {
    await Tflite.loadModel(
      model: true
          ? "assets/" + widget.title.toLowerCase() + "_trained.tflite"
          : "assets/model_unquant.tflite",
      labels: true
          ? "assets/" + widget.title.toLowerCase() + "_trained.txt"
          : "assets/model_unquant.txt",
      numThreads: 1,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loading = true;

    loadModel().then((value) {
      setState(() {
        _loading = false;
      });
    });
  }

  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
        path: image.path,
        imageMean: 0.0,
        imageStd: 255.0,
        numResults: 2,
        threshold: 0.5,
        asynch: true);
    setState(() {
      _loading = false;
      _outputs = output!;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      captureImage();
    } else if (index == 2) {
      pickImage();
    } else if (index == 1) {
      Navigator.pushNamed(context, '/home');
    }
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  Future pickImage() async {
    final pick = ImagePicker();
    var image = await pick.pickImage(source: ImageSource.gallery);
    if (image == null) return null;
    setState(() {
      _loading = true;
      _image = image;
    });
    classifyImage(File(_image!.path));
  }

  captureImage() async {
    ImagePicker pick = ImagePicker();
    var image = await pick.pickImage(source: ImageSource.camera);
    if (image == null) return null;
    setState(() {
      _loading = true;
      _image = image;
    });
    classifyImage(File(_image!.path));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            widget.title,
            style: const TextStyle(
                color: Colors.green, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
          //elevation: 0,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.camera),
              label: 'Camera',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.image),
              label: 'Gallery',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.green,
          onTap: _onItemTapped,
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _loading
                    ? Container(
                        height: 300,
                        width: 300,
                      )
                    : Container(
                        margin: const EdgeInsets.all(20),
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            _image == null
                                ? Container()
                                : Image.file(
                                    File(_image!.path),
                                    // scale: 3,
                                  ),
                            const SizedBox(
                              height: 20,
                            ),
                            _image == null
                                ? Container()
                                : _outputs != null
                                    ? Column(
                                        children: [
                                          Text(
                                            _outputs[0]["label"],
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 20),
                                          ),
                                          Text(_outputs[0].toString()),
                                          //_outputs[0]["label"]=="2 banana_black_sigatoka"Text('Good')?null:
                                          Text(_outputs[0]["label"] ==
                                                  "0 rice_bacterial_leaf_blight"
                                              ? "\nNO BIOLOGICAL CONTROL\n\nChemical Control: STREPTOMYCIN SULFATE 90.0% SP, TETRACYCLINE Hydrochloride 10.0% SP\n"
                                              : _outputs[0]["label"] ==
                                                      "1 rice_brown_spot"
                                                  ? '\nBiological Method: Seeds are not Contaminated, Seed bath in hot water for 10-12 minutes\n\nChemical Control: TEBUCONAZOLE 50.0% WG, TRIFLOXYSTROBIN 25.0% WG\n'
                                                  : _outputs[0]["label"] ==
                                                          "2 rice_leaf_smut"
                                                      ? '\nBiological Method: Treatment of Seeds at 52 degree Celcius\n\nChemical Control: PICOXYSTROBIN 7.05% SC, PROPICONAZOLE 11.7% SC\n'
                                                      : _outputs[0]["label"] ==
                                                              "0 tomato_early_blight"
                                                          ? "\nBiological Control: BACILLUS SUBTILS or Copper-based FUNGICIDES\n\nChemical Control: CYMOXANIL 8.0% WP, MANCOZEB 64.0% WP\n"
                                                          : _outputs[0][
                                                                      "label"] ==
                                                                  "1 tomato_late_blight"
                                                              ? "\nBiological Control: NO BIOLOGICAL CONTROL\n\nChemical Control: MANDIPROPAMID 23.4% SC, CYMOXANIL 8.0% WP, MANCOZEB 64.0% WP, AZOXYSTROBIN 23.0% SC\n"
                                                              : _outputs[0][
                                                                          "label"] ==
                                                                      "2 tomato_healthy"
                                                                  ? " "
                                                                  : _outputs[0][
                                                                              "label"] ==
                                                                          "3 tomato_mosaic_virus"
                                                                      ? "\nBiological Control: Dry Heating seed at 70 degree Celcius\n\nChemical Control: Consider INTEGRATED APPROACH with preventive measures \n"
                                                                      : _outputs[0]["label"] ==
                                                                              "0 potato_early_blight"
                                                                          ? "\nBiological Control: BACILLUS SUBTILS or Copper based FUNGICIDES\n\nChemical Control: COPPER OXYCHLORIDE 50.0% WP, METIRAM 55.0% WG, PYRACLOSTROBIN 5.0% WG, KRESOXIM-METHYL 44.3% SC\n"
                                                                          : _outputs[0]["label"] == "1 potato_late_blight"
                                                                              ? "\nBiological Control: COPPER based FUNGICIDES \n\nChemical Control: CYMOXANIL 8.0% WP, MANCOZEB 64.0% WP, COPPER OXYCHLORIDE 50.0% WP\n"
                                                                              : _outputs[0]["label"] == "2 potato_healthy"
                                                                                  ? ''
                                                                                  : _outputs[0]["label"] == "0 pepper_bell_bactrerial_spot"
                                                                                      ? "Biological Control: Submerge seeds for 1 minute in 1.3% SODIUM HYPOCHLODITE OR HOT WATER\nChemical Control:STREPTOMYCIN SULPHATE 90.0% SP, TETRACYCLINE Hydrochloride 10.0% SP"
                                                                                      : _outputs[0]["label"] == "1 pepper_bell_healthy"
                                                                                          ? ""
                                                                                          : _outputs[0]["label"] == "0 cucumber_healthy"
                                                                                              ? ""
                                                                                              : _outputs[0]["label"] == "1 cucumber_diseased"
                                                                                                  ? "\nBiological Control: Use an insesticidal soap solution\n\nChemical Control: IMIDACLOPRID 70.0% WG, IMIDACLOPRID 48% SL, ACEPHATE 75% SP\n"
                                                                                                  : _outputs[0]["label"] == "0 banana_black_sigatoka"
                                                                                                      ? "\nBiological Control: BIO-FUNGICIDES BASED ON TRICHODERMA ATROVIRIDE\nChemical Control: CARBENDAZIM 50.0% WP, CHLOROTHALONIL 75.0% WP, PROPICONAZOLE 25.0% EC"
                                                                                                      : _outputs[0]["label"] == "1 banana_bacterial_wilt"
                                                                                                          ? "Biological Control: INCORPORATION OF GREEN MANURE\nChemical Control: Non-Viable"
                                                                                                          : _outputs[0]["label"] == "2 banana_healthy"
                                                                                                              ? ""
                                                                                                              : "")
                                        ],
                                      )
                                    : Container(child: const Text("")),
                            Column(
                              children: [
                                FlatButton(
                                    color: Colors.green[300],
                                    textColor: Colors.white,
                                    disabledColor: Colors.grey,
                                    disabledTextColor: Colors.black,
                                    padding: const EdgeInsets.fromLTRB(
                                        73, 20, 73, 20),
                                    splashColor: Colors.greenAccent,
                                    onPressed: () {
                                      if (widget.title == "Rice") {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: ((context) =>
                                                    const FertCalc(
                                                        dap: 10,
                                                        mop: 10,
                                                        urea: 10))));
                                      } else if (widget.title == "Potato") {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: ((context) =>
                                                    const FertCalc(
                                                        dap: 26,
                                                        mop: 40,
                                                        urea: 56))));
                                      } else if (widget.title == "Banana") {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: ((context) =>
                                                    const FertCalc(
                                                        dap: 0.109,
                                                        mop: 0.250,
                                                        urea: 0.175))));
                                      } else if (widget.title == "Cucumber") {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: ((context) =>
                                                    const FertCalc(
                                                        dap: 30,
                                                        mop: 17,
                                                        urea: 51))));
                                      } else if (widget.title == "Pepper") {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: ((context) =>
                                                    const FertCalc(
                                                        dap: 27,
                                                        mop: 17,
                                                        urea: 40))));
                                      } else if (widget.title == "Tomato") {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: ((context) =>
                                                    const FertCalc(
                                                        dap: 27,
                                                        mop: 17,
                                                        urea: 40))));
                                      }
                                    },
                                    child: const Text('Fertilizer Calculator')),
                                Container(
                                  height: 3,
                                ),
                                FlatButton(
                                    color: Colors.green[300],
                                    textColor: Colors.white,
                                    disabledColor: Colors.grey,
                                    disabledTextColor: Colors.black,
                                    padding: const EdgeInsets.fromLTRB(
                                        50, 20, 50, 20),
                                    splashColor: Colors.greenAccent,
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/sentmail');
                                    },
                                    child: const Text(
                                        '''Couldn't Find Your Answer!''')),
                                Container(
                                  height: 3,
                                ),
                                FlatButton(
                                    color: Colors.green[300],
                                    textColor: Colors.white,
                                    disabledColor: Colors.grey,
                                    disabledTextColor: Colors.black,
                                    padding: const EdgeInsets.fromLTRB(
                                        60, 20, 60, 20),
                                    splashColor: Colors.greenAccent,
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/location');
                                    },
                                    child:
                                        const Text('Fertilizer Store Location'))
                              ],
                            ),
                          ],
                        ),
                      ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
