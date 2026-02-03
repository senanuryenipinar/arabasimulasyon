float arabaX = -200;
float arabaY = 260;

boolean dortluAcik = true; // Dörtlü sinyali açık
int yanipSonmeSuresi = 500; // milisaniye
int sonDegisimZamani = 0;
boolean isikAcik = false;

void setup() {
  size(900, 500);
  smooth();
}

void draw() {
  drawSky();
  drawMountains();
  drawRoad();
  drawClouds();
  drawCar(arabaX, arabaY);

  // Araba hareketi
  arabaX += 2;
  if (arabaX > width) {
    arabaX = -200;
  }

  // Dörtlü sinyal zaman kontrolü
  if (millis() - sonDegisimZamani > yanipSonmeSuresi) {
    isikAcik = !isikAcik;
    sonDegisimZamani = millis();
  }
}


void drawSky() {
  background(135, 206, 235);
}


void drawMountains() {
  fill(120, 180, 120);
  triangle(100, 400, 300, 150, 500, 400);
  triangle(400, 400, 600, 170, 800, 400);
  triangle(650, 400, 850, 180, 1050, 400);
}


void drawClouds() {
  fill(255);
  noStroke();
  ellipse(150, 100, 60, 60);
  ellipse(180, 100, 80, 60);
  ellipse(210, 100, 60, 60);

  ellipse(500, 80, 70, 70);
  ellipse(540, 80, 90, 70);
  ellipse(580, 80, 70, 70);
}


void drawRoad() {
  fill(50);
  rect(0, 300, width, 200);

  stroke(255);
  strokeWeight(4);
  for (int i = 0; i < width; i += 40) {
    line(i, 400, i + 20, 400);
  }
}


void drawCar(float x, float y) {
  noStroke();

  // Gövde
  fill(66, 135, 245);
  rect(x, y, 200, 40, 10);
  rect(x + 40, y - 30, 120, 30, 10);

  // Camlar
  fill(200);
  rect(x + 50, y - 25, 30, 20, 5);
  rect(x + 120, y - 25, 30, 20, 5);

  // Tekerlekler
  fill(30);
  ellipse(x + 40, y + 40, 40, 40);
  ellipse(x + 160, y + 40, 40, 40);

  // Jantlar
  fill(180);
  ellipse(x + 40, y + 40, 20, 20);
  ellipse(x + 160, y + 40, 20, 20);

 
  if (dortluAcik && isikAcik) {
    fill(255, 140, 0); // turuncu ışık

    // Ön sinyaller
    ellipse(x + 10, y + 10, 10, 10);
    ellipse(x + 190, y + 10, 10, 10);

    // Arka sinyaller
    ellipse(x + 10, y + 40, 10, 10);
    ellipse(x + 190, y + 40, 10, 10);
  }
}
