/*
DDF 2016
 get data from a CSV file and use it to draw something and export as PDF
 */

import processing.pdf.*;

int[] data;

void setup() {
  size(1900, 780);
  String[] stringFromdata = loadStrings("PNW.txt");                             // load our file into a string array
  data= int(split (stringFromdata[0], ','));
  // split the String to items using ',' as deliminato                                                                                 
  // cast the strings into an int array data[]
  beginRecord(PDF, "output.pdf");  // Start recording to the file

  for (int i = 0; i<data.length; i++) {
    for (int x = 0; x<data[i]; x++) { 
      stroke(0);
      int start;
      if (i > 0) {
        int begin = 0;        
        for (int t = 0; t < i; t++) {
          begin = begin + data[t];
        }
        start = begin+x;
        println(start);
      } else {
        start = x;
      }
      stroke(0);
      line(start, 0, start, height);// draw circles based on the numbers in the file
        if(x == data[i]-1){
        stroke(255);
        line(start, 0, start, height);
      }
    }
    endRecord();
  }
}


void draw() {
}