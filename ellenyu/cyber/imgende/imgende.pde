import java.util.Arrays;
int LINEAR = 0;
int SELECTIVE = 1;
int MODE = LINEAR;


//Note: for code that runs one time place all code in setup.
void setup() {
  size(1200, 600);
  //0. If you want to change the size to display the image you can print the dimensions here:
  //println(img.width,img.height);

  //1. Add the cat.png file to the sketch before running.
  PImage img = loadImage("cat.png");

  //2. Write the MESSAGETOARRAY method
  //convert the string into an array of ints in the range 0-3
  String messageToEncode = "This is a message encoded using LSBSteganography. There are two modes that can be selected. This text is getting longer but is just used to make more pixels different.";
  int[]parts = messageToArray(messageToEncode);

  //3. Write the MODIFY method.
  modifyImage(img, parts);

  //save the modified image to disk.
  img.save("modifiedCat.png");
}


int [] messageToArray(String s) {
  int[]parts = new int[s.length() * 4]; //optionally include the terminating character here.
  //calculate the array
  for(int i = 0; i < s.length(); i++) {
    String binary = Integer.toBinaryString(s.charAt(i));
    while (binary.length() < 8) binary = "0" + binary;
    for (int x = 0; x < 8; x+=2) {
      String sub = binary.substring(x, x+2);
      if (sub.equals("00")) parts[4*i + x/2] = 0;
      else if (sub.equals("01")) parts[4*i + x/2] = 1;
      else if (sub.equals("10")) parts[4*i + x/2] = 2;
      else if (sub.equals("11")) parts[4*i + x/2] = 3;
    }
  }

  /**Verify the contents of the array before you do more.
   'T' -> 01010100 -> 01 01 01 00 -> 1, 1, 1, 0
   'h' -> 01101000 -> 01 10 10 00 -> 1, 2, 2, 0
   'i' -> 01101001 -> 01 10 10 01 -> 1, 2, 2, 1
   's' -> 01110011 -> 01 11 00 11 -> 1, 3, 0, 3
   ...etc.
   So your data array would look like this:
   { 1, 1, 1, 0, 1, 2, 2, 0, 1, 2, 2, 1, 1, 3, 0, 3...}
   */
  return parts;
}

void modifyImage(PImage img, int[]messageArray) {
  //load the image into an array of pixels.
  img.loadPixels();

  //You can use img.pixels[index] to access this array
  if (MODE == LINEAR) {
    //LINEAR mode :
    //Loop over the pixels in order. For each pixel:
    //-Take one array value and write it to the red channel of the pixel.
    //-When there are no more letters, write a terminating character.
    //This means 4 pixels will store 1 char value from your String.
    //The terminating character is the value 255.
    //Note: (255 is 11111111b and 11b is just 3, make the termination
    //pixel store {3,3,3,3}
  } else if (MODE == SELECTIVE) {
    //SELECTIVE MODE:
    //when the red and green end in 00, modify the last 2 bits of blue with the bit value.
    //e.g.   if the pixel is r = 1100 ,g=1100 and blue=11xy, replace the xy in the blue with the next message value.
    //To terminate the message:
    //when no more message is left to encode, change all the remaining red values that end in 00 to 01.
    //This means the number of pixels that qualify for decoding will be a multiple of 4.
  }

  //write the pixel array back to the image.
  img.updatePixels();
}
