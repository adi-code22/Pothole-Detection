
# POTHOLE DETECTION FRAMEWORK

## Problem Statement

### Imagine that the Government have resources to have drones deployed to survey roads on a regular basis. The pictures captured by these drones will have to be sent to a central data repository, where using computer vision, the system will identify potholes that need immediate attention and send a trigger to the Executive Engineer of the respective district, Chief Engineer of PWD Kerala and the Minister of PWD. The solution should also be able to prioritize the need of attention that is required. . The challenge for the participants is twofold. (a) Develop an Al algorithm which can detect potholes from drone pictures of roads. They should be able to generate training and test data for this themselves. (6) Design a data architecture to implement this solution, assuming the Government will have readily deployable drones.

## Solution

1. ### Data acquisition and preparation
2. ### Model training and evaluation
3. ### Model deployment for realtime detection
4. ### Notifying the authorities

<p>&nbsp;</p>

## 1. Data acquisition and preparation
### Pothole data/images taken from Kaggle and used 3D software to rotate and multiply images

<p>&nbsp;</p>


## 2. Model training and evaluation
<img align="left" alt="GIF" src="https://github.com/adi-code22/Pothole-Detection/blob/main/assets/git_img/teachable.PNG?raw=true" width="600"/>

### Fine tuned the model using Teachable Machine framework, a Conolutional Neural Network model was used considering its efficiency in Image Classification.

- Epoch: 50
- Batch size: 16
- Training rate: 0.001
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>


## 3. Model deployment for realtime detection






<img align="left" alt="GIF" src="https://github.com/adi-code22/Pothole-Detection/blob/main/assets/git_img/hole.PNG?raw=true" height="500" width="270"/>         
<img align="left" alt="GIF" src="https://github.com/adi-code22/Pothole-Detection/blob/main/assets/git_img/no%20pothole.PNG?raw=true" height="500" width="270"/>



### Validation Screen

CNN model was then integrated into the Flutter app using the [tflite](https://pub.dev/packages/tflite) package

- Now it detects potholes along with its severity.
- Pothole location is also noted by the software.
- The image can be fed from either the camera or gallery
- The framework also supports image input from surveilance cameras, drones or any other source as image format.\



<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;

## 4. Notifying the authorities



<img align="left" alt="GIF" src="https://github.com/adi-code22/Pothole-Detection/blob/main/assets/git_img/no%20location.PNG?raw=true" height="500"/>
<img align="left" alt="GIF" src="https://github.com/adi-code22/Pothole-Detection/blob/main/assets/git_img/mail.jpeg?raw=true" height="500"/>
  
  
  
  ### Timely notifications send to concerned authorities

- Pothole locations are stored into the DB.
- Local authorities are intimated with specific images and location of potholes.
- Confidence of ML model can be mapped to severity of the pothole.

  
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>


### Built With

* [![Flutter][Flutter]][Flutter-url]
* [![Tensorflow][Tensorflow]][Tensorflow-url]
* [![Firebase][Firebase]][Firebase-url]






<!-- GETTING STARTED -->
## Getting Started

This is an example of how you may give instructions on setting up your project locally.
To get a local copy up and running follow these simple example steps.

### Prerequisites

This is an example of how to list things you need to use the software and how to install them.
* flutter

Assuming that you have Flutter installed in your System and either AVD or a smartphone with USB debugging is available;

### Installation

1. Clone the repo
   ```sh
   git clone https://github.com/adi-code22/Pothole-Detection.git
   ```
2. Direct to root folder and run flutter project
   ```sh
   flutter run
   ```


<p align="right">(<a href="#top">back to top</a>)</p>



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE.md` for more information.

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- CONTACT -->
## Contact

Your Name - Adityakrishnan [adityakrishnanp007@gmail.com]

Twitter [@AdityakrishnanP](https://twitter.com/AdityakrishnanP)

Project Link: [https://github.com/adi-code22/Pothole-Detection](https://github.com/adi-code22/Pothole-Detection)

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/adi-code22/AgroMed-App.svg?style=for-the-badge
[contributors-url]: https://github.com/adi-code22/AgroMed-App/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/adi-code22/AgroMed-App.svg?style=for-the-badge
[forks-url]: https://github.com/adi-code22/AgroMed-App/network/members
[stars-shield]: https://img.shields.io/github/stars/adi-code22/AgroMed-App.svg?style=for-the-badge
[stars-url]: https://github.com/adi-code22/AgroMed-App/stargazers
[issues-shield]: https://img.shields.io/github/issues/adi-code22/AgroMed-App.svg?style=for-the-badge
[issues-url]: https://github.com/adi-code22/AgroMed-App/issues
[license-shield]: https://img.shields.io/github/license/adi-code22/AgroMed-App.svg?style=for-the-badge
[license-url]: https://github.com/adi-code22/AgroMed-App/blob/main/LICENSE.md
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://www.linkedin.com/in/adityakrishnan007/
[product-screenshot]: assets/git_images/first.PNG
[solution]: assets/git_images/solution.PNG
[scan]: assets/git_images/scanMonument.PNG
[speak]: assets/git_images/speakNa.PNG
[card]: assets/git_images/trawell%2Bmarket.PNG
[locate]: assets/git_images/suggestplan%2Blocate.PNG
[Flutter]: https://img.shields.io/badge/Flutter-000000?style=for-the-badge&logo=flutter&logoColor=blue
[Flutter-url]: https://flutter.dev/
[React.js]: https://img.shields.io/badge/React-20232A?style=for-the-badge&logo=react&logoColor=61DAFB
[React-url]: https://reactjs.org/
[Tensorflow]: https://img.shields.io/badge/Tensorflow-35495E?style=for-the-badge&logo=tensorflow&logoColor=orange
[Tensorflow-url]: https://www.tensorflow.org/
[Firebase]: https://img.shields.io/badge/Firebase-563D7C?style=for-the-badge&logo=firebase&logoColor=green
[Firebase-url]: https://firebase.google.com/
[ExpressJS]: https://img.shields.io/badge/ExpressJS-4A4A55?style=for-the-badge&logo=express&logoColor=FF3E00
[ExpressJS-url]: https://expressjs.com/
[Laravel.com]: https://img.shields.io/badge/Laravel-FF2D20?style=for-the-badge&logo=laravel&logoColor=white
[Laravel-url]: https://laravel.com
[Bootstrap.com]: https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white
[Bootstrap-url]: https://getbootstrap.com
[JQuery.com]: https://img.shields.io/badge/jQuery-0769AD?style=for-the-badge&logo=jquery&logoColor=white
[JQuery-url]: https://jquery.com 



