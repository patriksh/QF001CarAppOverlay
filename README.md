# CarAPP Overlay

This is a tool that automatically creates an overlay for the CarAPP on the QF001 (ROCO K706) Head Unit.

## Disclaimer
You MUST have JRE and JDK installed, link below:

JDK: [https://www.oracle.com/java/technologies/javase-jdk14-downloads.html](https://www.oracle.com/java/technologies/javase-jdk14-downloads.html)

JRE: [https://www.java.com/en/download/](https://www.java.com/en/download/)


# Download
On the top right corner of this GitHub page, click on Clone or Download, and then click Download ZIP. Then extract that anywhere.


# Theming Instructions
If you never themed before, these are called overlays. They get "overlaid" on top of your existing application and when the app calls for these resources, 
they take from the overlay first, then the base app.

What you have to do is to take the resources from [this](https://github.com/patriksh/QF001CarAppOverlay/tree/master/default-resources) link and edit those pictures. 
If you're editing in a folder named `drawable-hdpi-v4`, make sure that the folder in `resources/res` has that folder and named correctly, with the file. 

Do not put in unedited files because bloating up the overlay is not ideal.

Once you're done, follow these next steps to compile.


# Instructions
Make sure Java is installed and then you are able to make changes to the `resources/res/` folder for image and text changes.

When you are done, click on `compile.bat` and it will automatically compile and sign an overlay APK for you!

To install, run `installer.bat` and follow instructions.
