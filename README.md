# CarAPP Overlay

This is a tool that automatically creates an overlay for the CarAPP on the QF001 (ROCO K706) Head Unit.

## Usage

### 1. Preparation
You must have JRE and JDK installed, link below:

JDK: [https://www.oracle.com/java/technologies/downloads/#jdk20-windows](https://www.oracle.com/java/technologies/downloads/#jdk20-windows)

JRE: [https://www.java.com/en/download/](https://www.java.com/en/download/)

### 2. Download
On the top right corner of this GitHub page, click on the green Code button and then click Download ZIP. Then extract that anywhere.

### 3. Modifying text & translations
If you want to change the strings in the default, English language, open the [`default-resources/res/values/strings.xml`](https://github.com/patriksh/QF001CarAppOverlay/blob/master/default-resources/res/values/strings.xml) and find a string you want to translate.
Copy it, and paste it into [`resources/res/values/strings.xml`](https://github.com/patriksh/QF001CarAppOverlay/blob/master/resources/res/values/strings.xml).
Then you can change its value.

If you want to change strings in another language, repeat the same process, but first you have to make a folder for the appropriate language in the `resources/res` folder.
If you were to, for example, modify the Croatian translation, you'd put your `strings.xml` inside `resources/res/values-hr/strings.xml`.

### 4. Modifying images
If you want to modify images, find them in the [`default-resources/res/drawable*` folders](https://github.com/patriksh/QF001CarAppOverlay/blob/master/default-resources/res/values/strings.xml), create the appropriate folder in the `resources/res/` folder, and put your new image there.

### 5. Compilation & installation
Click on `compile.bat` and it will automatically compile and sign an overlay APK for you.

After that you can install it by running `installer.bat` and following the instructions.

**Hints:**
- make sure USB debugging is turned on on your head unit, if you're unsure, do the following:
  - car settings -> factory -> enter "114477"
  - enter Android settings, go to the About page
  - tap the build number 7 times
  - developer options will now be available on the About page, open them
  - turn USB debugging on
- make sure the PC on which you're running the `install.bat` script and the headunit are on the same network
- my suggestion is to just turn on a hotspot on your phone, and connect both the PC and the head unit to it - then you can also easily find the IP in the "connected devices" in phone hotspot settings
