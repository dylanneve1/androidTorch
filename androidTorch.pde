import ketai.camera.*;
import ketai.cv.facedetector.*;
import ketai.data.*;
import ketai.net.*;
import ketai.net.bluetooth.*;
import ketai.net.nfc.*;
import ketai.net.nfc.record.*;
import ketai.net.wifidirect.*;
import ketai.sensors.*;
import ketai.ui.*;

KetaiCamera cam;

PImage newImage;

boolean flashOn = false;
boolean firstPress = true;

void setup()
{
  size(displayWidth, displayHeight, P2D);
  orientation(PORTRAIT);
  cam = new KetaiCamera(this, width, height, 60);
}

void draw()
{
  background(#212121);
  if (cam.isStarted())
  {
    textAlign(CENTER);
    textSize(displayWidth*0.05);
    text("Tap to turn torch on/off", displayWidth/2, displayHeight/2);
  } else {
    cam.start();
  }
  if (mousePressed == true)
  {
    if (firstPress == true) {
      if (flashOn == true) {
        cam.disableFlash();
        firstPress = false;
        flashOn = false;
      } else if (flashOn == false) {
        cam.enableFlash();
        firstPress = false;
        flashOn = true;
      }
    }
  }
}

void mouseReleased()
{
  firstPress = true;
}

void onCameraPreviewEvent()
{
  cam.read();
}