void save() {
  //File[] files = selection.listFiles();  
  ArrayList<Float> Stonesaves=new ArrayList<Float>();//一時保存
  float stonesave=0;
  for (int i=0; i<Stones.size(); i++) {
    if (stonesave!=Stones.get(i).get(5)) {
      stonesave=Stones.get(i).get(5);
      Stonesaves.add(stonesave);
    }
  }

  for (int j=0; j<Stonesaves.size(); j++) {
    float R=Stonesaves.get(j)/zoom/2.0;//半径
    float h=2.0;//厚さ
    if (R<=2) {
      h=R;
    }
    float r=(pow(R, 2) + pow(h, 2)) / (h * 2);//曲率半径
    float f=r/(1.5-1);//焦点距離
    beginRecord(SVG, "StoneData/#"+(j+1)+", 凸, 直径"+R*2+"mm, 焦点距離"+f+"mm, 厚さ"+h+"mm, 曲率半径"+r+"mm.svg");
    pushMatrix();
    scale(scaling);
    for (int i=0; i<Stones.size(); i++) {
      float a=Stones.get(i).get(5);
      float b=Stonesaves.get(j);
      if (a==b) {
        stroke(0);
        strokeWeight(1);
        noFill();
        ellipse(Stones.get(i).get(0), Stones.get(i).get(1), px(Stones.get(i).get(5)), px(Stones.get(i).get(5)));
      }
    }
    popMatrix();
    endRecord();
  }

  beginRecord(SVG, "StoneData/底面パターン.svg");
  pushMatrix();
  scale(scaling);
  for (int i=0; i<Stones.size(); i++) {
    if (Stones.get(i).get(4)!=-1.0) {
      pattern(Stones.get(i).get(0), Stones.get(i).get(1), px(Stones.get(i).get(5)), COLOR, int(Stones.get(i).get(4)));
    }
  }
  popMatrix();
  endRecord();


  beginRecord(SVG, "StoneData/印刷設定 屈折率1.50, 層厚さ0.035mm.svg");
  pushMatrix();
  scale(scaling);
  noFill();
  noStroke();
  rect(0, 0, width, height);
  popMatrix();
  endRecord();

  beginRecord(SVG, "StoneData/枠.svg");
  pushMatrix();
  scale(scaling);
  noFill();
  stroke(255);
  float maxx=-10;
  float minx=10000;
  float maxy=-10;
  float miny=10000;
  for (int i=0; i<Stones.size(); i++) {
    if (maxx<Stones.get(i).get(0)) {
      maxx=Stones.get(i).get(0);
      println(maxx);
    }
    if (minx>Stones.get(i).get(0)) {
      minx=Stones.get(i).get(0);
    }
    if (maxy<Stones.get(i).get(1)) {
      maxy=Stones.get(i).get(1);
    }
    if (miny>Stones.get(i).get(1)) {
      miny=Stones.get(i).get(1);
    }
  }
  rect(minx-px(40), miny-px(40), maxx-minx+px(80), maxy-miny+px(80));
  popMatrix();
  endRecord();
  file=0;
  println(Stones);
}
