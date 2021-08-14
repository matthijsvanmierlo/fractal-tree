/**
Program to sketch a recursive fractal tree...
Author: Matthijs van Mierlo
Date: 8/14/2021
*/

void setup(){
  size(1500, 1000);
  background(#F0EAB5);
  noLoop();
}

void keyPressed(){
 System.out.println("NEXT");
 clear();
 redraw();
 // Uncomment line below if you want to save individual frames on keyPressed()
 // saveFrame("fractal-tree-####.jpg");
}

void drawTree()
{
  strokeWeight(10);
  line(width / 2, height, width / 2, height - height / 5);
  translate(width / 2, height - height / 5);
  // Angles start at 0.0 rad position and positive angles go clockwise
  // Start the tree angle at the NORTH (-PI / 2) position
  drawTreeHelper(0, 0, 1, 10, - PI / 2);
}

void drawTreeHelper(float startX, float startY, int iter, int maxIter, float angle){
  if(iter < maxIter){
    // Calculate new angles and start positions for recursive calls
    float rightBranchAngle = angle - PI / 6;
    float leftBranchAngle = angle + PI / 6;
    float randomChangeR = map(random(1), 0, 1, -PI / 10, PI / 10);
    float randomChangeL = map(random(1), 0, 1, -PI / 10, PI / 10);
    rightBranchAngle += randomChangeR;
    leftBranchAngle += randomChangeL;
    float lineLength = map(iter, 1, maxIter, width / 10, 5);
    float lineThickness = map(iter, 1, maxIter, 9, 1);
    float newStartX1 = startX + cos(leftBranchAngle) * lineLength;
    float newStartY1 = startY + sin(leftBranchAngle) * lineLength;
    float newStartX2 = startX + cos(rightBranchAngle) * lineLength;
    float newStartY2 = startY + sin(rightBranchAngle) * lineLength;
    // Drawing and recursive calls here...
    // Draw L branch
    strokeWeight(lineThickness);
    stroke(0);
    line(startX, startY, newStartX1, newStartY1);
    drawTreeHelper(newStartX1, newStartY1, iter + 1, maxIter, leftBranchAngle);
    // Draw R branch
    strokeWeight(lineThickness);
    stroke(0);
    line(startX, startY, newStartX2, newStartY2);
    drawTreeHelper(newStartX2, newStartY2, iter + 1, maxIter, rightBranchAngle);
  }
}

void draw(){
  background(#F0EAB5);
  drawTree();
}
