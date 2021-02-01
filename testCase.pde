int CELLSIZE = 40;

class TestCase {
  
  int arrLength;
  int positionX, positionY;
  
  //////////////////// Constructor ////////////////////
  
  TestCase (int getLength, int getPositionX, int getPositionY) {
    arrLength = getLength;
    positionX = getPositionX;
    positionY = getPositionY;
  }
  
  int[] arr = new int[arrLength];
  
  //////////////////// Create array ////////////////////
  
  boolean isInArray(int[] newArr, int target, int useLength) {
    if(useLength == 0){ return false; }
    for(int i = 0; i < useLength; i++){
      if(newArr[i] == target){ return true; }
    }
    return false;
  }
  
  int[] initialize() {
    int[] newArr = new int[arrLength];
    int random;
    boolean isValueUsed;
    for(int i = 0; i < arrLength; i++){
      random = int(random(99)+1);
      isValueUsed = isInArray(newArr, random, i);
      while(isValueUsed) {
        random = int(random(99)+1);
        isValueUsed = isInArray(newArr, random, i);
      }
      newArr[i] = random;
    }
    return newArr;
  }
  
  //////////////////// Algorithms ////////////////////
  
  int ssI = 0;        // selection sort count I
  int ssJ = ssI + 1;  // selection sort count J 
  
  void selectionSort() {
    if(ssI < arrLength-1) {
      int min = ssI;
        if (arr[ssJ] < arr[min])
          min = ssJ;
          int temp = arr[min];
          arr[min] = arr[ssI];
          arr[ssI] = temp;
      }
      ssJ++;
      if(ssJ > arrLength -1){
        ssI++;
        ssJ = ssI + 1;
      }
   }
   
   int mid = -1,
       guess;
       
   int[] lowHigh = {0, 31};
   
   
   int binarySearch(int target) {
     if(lowHigh[1]-lowHigh[0] <= lowHigh[1]) {
       mid = lowHigh[0] + floor((lowHigh[1]-lowHigh[0])/2);       
       guess = arr[mid];
       if(guess == target) {
         return mid;
       } if(guess > target) {
         lowHigh[1] = mid-1;
       } else {
         lowHigh[0] = mid+1;
       }
     } return -1;
   }
   
  //////////////////// Show ////////////////////
  
  void show(){
    for(int i = 0; i < arrLength; i++){
      if(arr[i] == target && targetIsFound == true && frameCount >= 498) {
        fill(blue);
      } else if(arr[i] == target && frameCount >= 498) {
        fill(red);
      } else if(i == ssI || i == ssJ || i == mid){
        fill(green);
      } else {
        fill(white);
      }
      square(positionX + CELLSIZE*i, positionY, CELLSIZE);
      fill(black);
      text(arr[i], positionX + CELLSIZE*i + CELLSIZE/2, positionY + CELLSIZE-14);
    }
  }
}
