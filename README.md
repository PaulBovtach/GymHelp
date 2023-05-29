# GymHelp
- Mobile app with big database of different exercises, divided by primary muscles, mechanic etc.
- Calculator of calories for deficit, balance and surplus
### Description
- I found a big database of exercises where are muscles these exercises are for, type of exercise, level, category, equipment instruction and 2 photos of each. There is a [link](https://github.com/wrkout/exercises.json) to dataset.
- I downloaded the `exercises.json` and parsed it. It was not good to download all the images into the project so I used the library [SDWebImageSwiftUI](https://github.com/SDWebImage/SDWebImageSwiftUI)
- All exercises were divided into compound and isolation. Was added an opportunity to search one by name or to search by primary muscle group using `Picker()`
- There is an opporrtunity to count your daily calories intake needed for deficit, balance, surplus dpending on your goal. Moreover, it can count amount of proteins, fats, carbs for well-balanced diet. After counting you can copy result and paste it (for example: in notes). The formula what was used as a base is: [Harris–Benedict equation](https://en.wikipedia.org/wiki/Harris%E2%80%93Benedict_equation)
- To build this app was used SwiftUI

### How I have calculated the needs
1. Dry body mass(**DBM**)
DBM = Total body weight(**TBW**) - Fat percent
2. Basic consume(**BMR**): 
Men: BMR = 88.362 + (13.397 × DBM) + (4.799 × height cm) - (5.677 × age).
Women: BMR = 447.593 + (9.247 × DBM) + (3.098 × height cm) - (4.330 × age).
3. Thermal effect of food(**TEF**)
TEF = BMR - 10%

4.Activity ratio(**AMR**)
- Passive lifestyle - 1.2
- Moderate activity (light physical activity or exercise 1-3 times a week - 1.375
- Medium activity (classes 3-5 times a week) - 1.55
- Active people (intensive exercise, classes 6-7 times a week) - 1.725

5. Calories for deficit:
BMR × AMR + TEF - 10-20%.

6. Calories for balance:
BMR × AMR + TEF.

7. Calories for surplus: 
BMR × AMR + TEF + 10-20%.


Proteins Fats Carbs(**PFT**)
8. PFC for deficit:
- P = СМТ × 2,5.
- F = СМТ × 1.
- C = (kcal - (P×4 + F×9)) / 4

9. PFC for balance:
- P = СМТ × 1,5.
- F = СМТ × 1.
- C = (kcal - (P×4 + F×9)) / 4

10. PFC for surplus:
- P = СМТ × 1,5.
- F = СМТ × 1.
- C = (kcal - (P×4 + F×9)) / 4

> I will be very glad if you share this to your friend or even coment this. Thanks 😊

### Images

<img src="https://github.com/PaulBovtach/GymHelp/blob/main/img/img1.png" alt= “img1” width="250" height="450">
<img src="https://github.com/PaulBovtach/GymHelp/blob/main/img/img2.png" alt= “img1” width="250" height="450">
<img src="https://github.com/PaulBovtach/GymHelp/blob/main/img/img3.png" alt= “img1” width="250" height="450">
<img src="https://github.com/PaulBovtach/GymHelp/blob/main/img/img4.png" alt= “img1” width="250" height="450">








