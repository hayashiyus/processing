import gifAnimation.*;
GifMaker gifExport;

PImage _img;
float _noiseScale;

void setup(){
    size(850, 1200);
    background(255);
    
    _img = loadImage("/Users/hayashiyus/Documents/Documents/temp_pictures/vespers.jpg");
    _img.resize(width, height);
    _noiseScale = 0.005;
    
    frameRate(50);
    gifExport = new GifMaker(this, "export1.gif");
    gifExport.setRepeat(0);
    gifExport.setQuality(10);
    gifExport.setDelay(20);
}

void draw(){
    for (int i = 0; i < 1000; i++){
        float x = random(_img.width);
        float y = random(_img.height);
        color col = _img.get(int(x), int(y));
        float noiseFactor1 = noise(x*_noiseScale, y*_noiseScale);
        float noiseFactor2 = noise(x*_noiseScale, y*_noiseScale);
        float lineAngle = noiseFactor1 * 20;
        float lineLength = noiseFactor2 * 20;
        
        pushMatrix();
            translate(x, y);
            rotate(noiseFactor1 * radians(180));
            stroke(col);
            strokeWeight(6);
            line(0, 0, lineAngle, lineLength);
        popMatrix();
    }
  if(frameCount <= 50*3){
    gifExport.addFrame();
  } else {
    gifExport.finish();
  }
}

/*
void keyPressed(){
    if (keyCode == ENTER){
        saveFrame("generative.png");
    }
    if (keyCode == BACKSPACE){
        setup();
    }
}
*/
