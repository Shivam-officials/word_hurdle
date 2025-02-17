# **Word Hurdle - A Flutter Word Game** 🎯  

## **Overview**  
Word Hurdle is a fun and engaging word puzzle game built with **Flutter** and **Provider**, following a structured **MVVM-inspired** architecture. Players must guess a hidden word within a limited number of attempts while receiving feedback on letter placement.  

## **Features**  
✅ **Word Puzzle Gameplay** – Classic word guessing mechanics.  
✅ **MVVM-Inspired Structure** – Well-organized code for easy maintenance.  
✅ **State Management with Provider** – Efficient and reactive UI updates.  
✅ **Dark Mode UI** – Sleek and modern design.  
✅ **Win/Loss Popups** – Fun victory and failure messages.  

## **Tech Stack**  
- **Framework:** Flutter  
- **State Management:** Provider  
- **Architecture:** MVVM-inspired  
- **Language:** Dart  

## **Project Structure**  
```
lib/
│── model/          # Data models
│   ├── wordle.dart # Word game logic
│
│── presentation/   # UI Components
│   ├── helper_function.dart # Utility functions for UI
│   ├── home_page/           # Main game screen
│   ├── hurdle_board/        # Word grid display
│   ├── keyboard_view/       # On-screen keyboard
│
│── provider/       # State Management
│   ├── state_provider.dart  # Holds app state using Provider
│
│── main.dart       # Entry point of the app
```

## **Installation & Running the App**  
1. Clone the repository:  
   ```sh
   git clone https://github.com/Shivam-officials/word_hurdle/word-hurdle.git
   cd word-hurdle
   ```
2. Install dependencies:  
   ```sh
   flutter pub get
   ```
3. Run the app:  
   ```sh
   flutter run
   ```

<p align="center">
  <img src="https://github.com/user-attachments/assets/9c4b37a6-e05a-458a-8431-6fd9664f2688" alt="Image 1" width="45%">
  <img src="https://github.com/user-attachments/assets/c4cb735a-436a-434f-a719-6855ef33c873" alt="Image 2" width="45%">
</p>



## **How to Play**  
1. Enter a 5-letter word guess.  
2. The app provides feedback on the guessed word:  
   - **Green** – Correct letter in the correct position.  
   - **Blue** – Correct letter but in the wrong position.  
   - **Gray** – Incorrect letter.  
3. Win the game by guessing the correct word before running out of attempts!  

## **Contributing**  
Feel free to contribute by submitting a pull request or reporting issues! 🚀  

## **License**  
[MIT License](LICENSE)  

