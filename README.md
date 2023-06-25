# CarAPP Overlay

This is a tool that automatically creates an overlay for the CarAPP on the QF001 (ROCO K706) Head Unit.

## Usage

### 1. Preparation
You must have JRE and JDK installed, link below:

JDK: [https://www.oracle.com/java/technologies/javase-jdk14-downloads.html](https://www.oracle.com/java/technologies/javase-jdk14-downloads.html)

JRE: [https://www.java.com/en/download/](https://www.java.com/en/download/)

### 2. Download
On the top right corner of this GitHub page, click on the green Code button and then click Download ZIP. Then extract that anywhere.

### 3. Modifying text & translations
If you want to change the strings in the default, English language, open the [`default-resources/res/values/strings.xml`](https://github.com/patriksh/QF001CarAppOverlay/blob/master/default-resources/res/values/strings.xml) and find a string you want to translate.
Copy it, and paste it to the new [`resources/res/values/strings.xml`](https://github.com/patriksh/QF001CarAppOverlay/blob/master/resources/res/values/strings.xml).
Then you can change its text.

If you want to change strings in another language, repeat the same process, but first you have to make a folder for the appropriate language in the `resources/res/values/strings.xml` folder.
If you were to, for example, change strings in the Croatian translation, you'd put your `strings.xml` inside `resources/res/values-hr/strings.xml`.

### 4. Modifying images
If you want to modify images, find them in the [`default-resources/res/drawable*` folders](https://github.com/patriksh/QF001CarAppOverlay/blob/master/default-resources/res/values/strings.xml), create the appropriate folder in the `resources/res/` folder, and put your modified image there.

### 5. Compilation & installation
Click on `compile.bat` and it will automatically compile and sign an overlay APK for you.

After that you can install it by running `installer.bat` and following the instructions.
