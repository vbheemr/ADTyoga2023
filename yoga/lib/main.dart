import 'package:firebase_database/firebase_database.dart';

import 'YogaInfoList.dart';
import 'splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // pushDataToFirebase();
  runApp(const MyApp());
}

List<YogaInfoList> yogaList = [
  YogaInfoList(
      "Surya Namaskar",
      "Sun Salutation",
      "Surya Namaskar is a dynamic sequence of postures that combines movement, stretching, and breathing exercises. It is a complete body workout that helps to energize the body and mind.",
      "Surya Namaskar consists of a series of 12 poses that flow together in a sequence. It involves movements such as stretching, bending, folding, and lunging, coordinated with inhaling and exhaling. The sequence typically starts and ends with a standing posture, with each pose transitioning smoothly into the next."),
  YogaInfoList(
    "Sukhasana",
    "The Easy or Pleasant Posture",
    "Sukhasana is a simple cross-legged sitting posture that promotes comfort, relaxation, and a meditative state of mind.",
    "Sit on the floor or a mat with your legs crossed. Rest your hands on your knees or thighs. Keep your spine straight and relax your shoulders. Close your eyes and focus on your breath. You can also use this posture as a base for other seated asanas and meditation practices.",
  ),
  YogaInfoList(
    "Gaumukhasana",
    "The Cow Head Posture",
    "Gaumukhasana is a seated posture that stretches the shoulders, chest, and hips. It helps to improve flexibility and release tension in these areas.",
    "Sit on the floor with your legs extended in front of you. Bend your left leg and place your left foot next to your right hip. Then, bend your right leg and place your right foot on top of your left thigh, near your left hip. Your knees should be stacked on top of each other. Extend your left arm overhead and bend it at the elbow, bringing your left hand behind your back. Extend your right arm to the side and bend it at the elbow, bringing your right hand behind your back. Try to clasp your hands together or use a strap to connect them. Hold the pose for a few breaths and then switch sides.",
  ),
  YogaInfoList(
    "Ardhamatsyendrasana",
    "The Spinal Half-Twist Posture",
    "Ardhamatsyendrasana is a seated twisting posture that helps to improve spinal flexibility, digestion, and detoxification.",
    "Sit on the floor with your legs extended in front of you. Bend your right knee and place your right foot on the outside of your left thigh, near your left knee. Keep your left leg extended and foot flexed. Place your left hand on your right knee, and your right hand on the floor behind your back, supporting your spine. Inhale and lengthen your spine, and exhale as you twist to the right, looking over your right shoulder. Hold the pose for a few breaths and then switch sides.",
  ),
  YogaInfoList(
    "Nataprarthanasana",
    "The Kneeling Prayer Posture",
    "Nataprarthanasana is a kneeling posture that promotes grounding, inner reflection, and opening of the heart center.",
    "Kneel on the floor with your knees hip-width apart and your toes pointing backward. Place your palms together in a prayer position in front of your chest. Lengthen your spine and relax your shoulders. Close your eyes and focus on your breath. Hold the pose for a few breaths, feeling a sense of stability and connection to the earth.",
  ),
  YogaInfoList(
    "Bhujangasana",
    "The Cobra Posture",
    "Bhujangasana is a prone backbend posture that helps to strengthen the spine, open the chest, and improve posture.",
    "Lie on your stomach with your legs extended behind you and the tops of your feet pressing into the floor. Place your hands under your shoulders, keeping your elbows close to your body. Inhale and slowly lift your chest off the ground, using your back muscles and keeping your lower body grounded. Straighten your arms as much as comfortable and lift your gaze upward. Hold the pose for a few breaths, maintaining a gentle stretch in your spine.",
  ),
  YogaInfoList(
    "Padmasana",
    "The Lotus Posture",
    "Padmasana is a seated posture that is commonly used for meditation and pranayama practices. It promotes stability, groundedness, and a calm mind.",
    "Sit on the floor with your legs extended in front of you. Bend your right knee and place your right foot on top of your left thigh, near your left hip. Then, bend your left knee and place your left foot on top of your right thigh, near your right hip. Your knees should be stacked on top of each other. Rest your hands on your knees or thighs. Keep your spine straight and relax your shoulders. Close your eyes and focus on your breath.",
  ),
  YogaInfoList(
    "Ekpadasana",
    "The One Leg Posture",
    "Ekpadasana is a standing posture that requires balance and stability. It helps to strengthen the legs, improve concentration, and develop body awareness.",
    "Stand tall with your feet hip-width apart. Shift your weight onto your left foot and lift your right foot off the ground, bending your knee. Place the sole of your right foot against your left inner thigh, with your toes pointing toward the floor. Find your balance and bring your palms together in front of your chest in a prayer position. Focus your gaze on a fixed point to help with balance. Hold the pose for a few breaths and then switch sides.",
  ),
  YogaInfoList(
    "Garudasana",
    "The Eagle Posture",
    "Garudasana is a standing posture that requires balancing and twisting movements. It helps to improve focus, concentration, and stability.",
    "Stand tall with your feet hip-width apart. Bend your knees slightly and lift your left foot off the ground, crossing it over your right leg. Hook your left foot behind your right calf if possible. Extend your arms in front of you and cross your right arm over your left arm, bending at the elbows. Press your palms together, or if possible, hook your right arm around your left arm so that your palms meet. Hold the pose for a few breaths and then switch sides.",
  ),
  YogaInfoList(
    "Sahaj Kantha Bhavasanas (SKB)",
    "Postures of Head and Neck",
    "SKB refers to a series of gentle neck and head movements that help to relieve tension, improve circulation, and promote relaxation in the neck and shoulder region.",
    "Sit comfortably with your spine straight. Relax your shoulders and bring your awareness to your neck and head. Gently move your head in various directions, such as forward and backward, side to side, and in circular motions. Be mindful of any tension or discomfort and adjust the movements accordingly. Perform these movements slowly and with awareness, focusing on the sensations in your neck and head.",
  ),
  YogaInfoList(
    "Paschimottanasana",
    "The Posterior Stretch",
    "Paschimottanasana is a seated forward bend posture that helps to stretch the entire back of the body, including the spine, hamstrings, and calves. It promotes flexibility, relaxation, and a sense of surrender.",
    "Sit on the floor with your legs extended in front of you. Inhale and raise your arms overhead, lengthening your spine. Exhale and slowly fold forward from your hips, reaching your hands toward your feet. If possible, hold onto your feet or ankles. Relax your neck and let your head hang heavy. With each breath, try to deepen the stretch and relax further into the pose.",
  ),
  YogaInfoList(
    "Sarvangasana",
    "The Shoulder Stand",
    "Sarvangasana is an inverted posture that involves balancing the entire body on the shoulders and upper arms. It helps to improve blood circulation, stimulate the thyroid gland, and strengthen the core muscles.",
    "Lie on your back with your arms alongside your body, palms facing down. Inhale and lift your legs off the ground, using your abdominal muscles to support the movement. Place your hands on your lower back for stability and support. Lift your hips and lower back off the ground, bringing your legs perpendicular to the floor. Keep your neck relaxed and gaze toward your toes. Hold the pose for a few breaths, gradually increasing the duration as you build strength.",
  ),
  YogaInfoList(
    "Vakrasana",
    "The Curve Posture",
    "Vakrasana is a seated twisting posture that helps to stretch and tone the spine, improve digestion, and stimulate the abdominal organs.",
    "Sit on the floor with your legs extended in front of you. Bend your right knee and place your right foot on the outside of your left thigh, near your left knee. Keep your left leg extended and foot flexed. Place your left hand on your right knee and your right hand on the floor behind your back, supporting your spine. Inhale and lengthen your spine, and exhale as you twist to the right, looking over your right shoulder. Hold the pose for a few breaths and then switch sides.",
  ),
  YogaInfoList(
    "Chakrasana",
    "The Wheel Posture",
    "Chakrasana is a backbend posture that resembles a wheel shape. It helps to improve spinal flexibility, strengthen the arms and legs, and invigorate the body and mind.",
    "Lie on your back with your knees bent and feet hip-width apart. Place your hands beside your head, fingertips pointing toward your shoulders. Press your palms and feet firmly into the ground. Inhale and lift your head, shoulders, and hips off the ground, coming into a bridge pose. Exhale and press into your hands and feet to lift your chest toward the ceiling, arching your back. Keep your neck relaxed and gaze toward the floor or backward if comfortable. Hold the pose for a few breaths, then slowly lower your body back to the ground.",
  ),
  YogaInfoList(
    "Parvatasana",
    "The Mountain Posture",
    "Parvatasana is a simple standing posture that helps to stretch and strengthen the arms, shoulders, and spine. It promotes stability, focus, and a sense of upliftment.",
    "Stand tall with your feet hip-width apart. Inhale and raise your arms overhead, interlocking your fingers and extending your index fingers upward. Exhale and press your palms toward the ceiling as you lengthen your spine. Keep your shoulders relaxed and gaze forward. Hold the pose for a few breaths, feeling a sense of strength and elevation.",
  ),
  YogaInfoList(
    "Pavanamuktasana",
    "The Air Free Posture",
    "Pavanamuktasana is a reclining posture that involves drawing the knees toward the chest, compressing the abdomen, and gently massaging the digestive organs. It helps to improve digestion, release trapped gases, and relieve lower back tension.",
    "Lie on your back with your legs extended. Inhale and bring your right knee toward your chest, clasping your hands around it. Exhale and gently pull your knee closer to your chest, feeling a stretch in your lower back and hip. Hold the pose for a few breaths, then release your right leg and switch to the left leg.",
  ),
  YogaInfoList(
    "Ushtrasana",
    "The Camel Posture",
    "Ushtrasana is a deep backbend posture that opens the chest, stretches the front of the body, and strengthens the back muscles. It helps to improve posture, expand lung capacity, and boost energy levels.",
    "Kneel on the floor with your knees hip-width apart. Place your hands on your lower back, fingers pointing downward. Inhale and lift your chest upward, arching your back and pushing your hips forward. If comfortable, reach your hands back and grasp your heels. Keep your neck relaxed and gaze upward or backward. Hold the pose for a few breaths, then slowly release your hands, bring your chest forward, and return to a kneeling position.",
  ),
  YogaInfoList(
    "Talasana",
    "The Palm Tree Posture",
    "Talasana is a standing posture that involves stretching the entire body, especially the arms, shoulders, and sides. It helps to increase flexibility, improve posture, and enhance body awareness.",
    "Stand tall with your feet hip-width apart. Inhale and raise your arms overhead, interlocking your fingers and extending your index fingers upward. Exhale and stretch your body upward, lengthening your spine and reaching toward the ceiling. Keep your shoulders relaxed and gaze forward. Hold the pose for a few breaths, feeling a sense of expansion and upward energy.",
  ),
];

void pushDataToFirebase() async {
  DatabaseReference reference = FirebaseDatabase.instance
      .refFromURL("https://adtyoga-f8e60-default-rtdb.firebaseio.com");

  List<Map<String, dynamic>> yogaDataList = [];

  for (int i = 0; i < yogaList.length; i++) {
    YogaInfoList yogaInfo = yogaList[i];

    Map<String, dynamic> yogaData = {
      'id': i + 1,
      'yNameHindi': yogaInfo.hindiNameOfAasan,
      'yNameEnglish': yogaInfo.englishNameOfAasan,
      'about': yogaInfo.about,
      'howToDo': yogaInfo.howToDo,
    };

    yogaDataList.add(yogaData);
  }

  Map<String, dynamic> data = {'yoga': yogaDataList};

  await reference.set(data).then((_) {
    print('Data pushed to Firebase successfully!');
  }).catchError((error) {
    print('Failed to push data to Firebase: $error');
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool loading = true;
  bool ifLoggedIn = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yoga App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF0F2985),
        disabledColor: Colors.black,
      ),
      home: const SplashScreen(),
    );
  }
}
