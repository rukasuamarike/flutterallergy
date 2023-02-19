# AlleScan

## Inspiration
One of our team members is highly allergic to nuts, and as a result of their experience, it can be difficult to find foods they can enjoy. We wanted to develop an app for people to quickly identify any potential allergens in the food they're eating, and to make it as accessible and as simple to use as possible. Hopefully, this tool can be a benefit for millions of people with allergies around the world.

## What it does
Upon opening AlleScan, the user can enter a list of their allergies in their profile. Then, they can utilize our camera to scan the nutrition facts of a food item, and it'll highlight all the ingredients that match and return whether or not the item is safe to eat.

## How We Build It
AlleScan is built with a Flutter frontend connected to a Flask and Firebase backend. We use Flutter's camera libraries to take photos, and process them with Flask and Google cloud vision API. Finally, we utilize a Firestore database for user authentication and help users manage their allergies

## Challenges We Faced
We faced many challenges in working with new technologies, but by far our largest challenge was switching frameworks halfway through the hackathon. We were initially using React Native, but ran into many difficulties with the camera and communicating with the Firebase. In the middle of the night, we made a bold decision in switching to flutter, and we worked all through the night to finish our app.

## Accomplishments that we're proud of
Throughout the entire duration of the project, we faced challenge after challenge, but we persevered through it all. Many of us had no prior experience with the technologies used, especially working with the camera and utilizing cloud vision. We're very proud to have learned new skills, all while creating a product that we think can make a genuine impact for those with allergies.

## What's next for AlleScan
In the future, we plan to add additional features such as being able to scan pictures of food packaging without the nutrition facts, while still being able to identify its ingredients. This would require a combination of more machine learning and introducing a large dataset for comparing photos. Other features include uploading photos from the camera roll and sharing allergy profiles with friends for gatherings.
