TestCase test = new TestCase(32, 10, 10);

int target;
boolean targetIsFound = false;

color white = color(255,255,255);
color black = color(0,0,0);
color green = color(0,255,0);
color red = color(255,0,0);
color blue = color(0,0,255);

void setup(){
  size(1300,60);
  frameRate(60);
  textSize(16);
  textAlign(CENTER);
  
  test.arr = test.initialize();
  target = test.arr[int(random(32))];
}

void draw(){
  background(white);
  test.show();
  
  if(frameCount < 498){
    test.selectionSort();
  } else if(!targetIsFound && frameCount%60 == 0) {
    targetIsFound = (test.binarySearch(target) > -1) ? true : false;
  }
}
