void StoneFill() {
  boolean CD=true;
  float dS=0;
  int plusstone=0;
  for (int j=0; j<Stones.size(); j++) {//他の全ての石との当たり判定
    dS=dist(Stones.get(j).get(0), Stones.get(j).get(1), mouseX, mouseY);
    //println(Stones);
    if (dS<px(Stones.get(j).get(5)/2.0+lensD/2.0+space)) {
      CD=false;
    }
  }

  if (CD) {
    noFill();
    ellipse(mouseX, mouseY, px(lensD), px(lensD));
    ArrayList<Float> Stone=new ArrayList<Float>();//一時保存
    Stone.add(float(mouseX));
    Stone.add(float(mouseY));
    Stone.add(drawCount);//描画順
    Stone.add(0.0);//選択チェック
    Stone.add(float(selectCol));//石の種類
    Stone.add(lensD);//石の直径
    Stones.add(Stone);
    drawingStone++;
  }


  for (int i=0; i<4; i++) {
    boolean cd=true;
    float px=0;
    float py=0;
    if (i==0) {//left
      px=mouseX-px(lensD+space);
      py=mouseY;
    } else if (i==1) {//right
      px=mouseX+px(lensD+space);
      py=mouseY;
    } else if (i==2) {//up
      px=mouseX;
      py=mouseY-px(lensD+space);
    } else {//down
      px=mouseX;
      py=mouseY+px(lensD+space);
    }
    for (int j=0; j<Stones.size()-(i+1); j++) {
      dS=dist(Stones.get(j).get(0), Stones.get(j).get(1), px, py);
      if (dS<px(Stones.get(j).get(5)/2.0+lensD/2.0)) {
        cd=false;
      }
    }
    if (cd) {
      noFill();
      ellipse(px, py, px(lensD), px(lensD));
      ArrayList<Float> Stone=new ArrayList<Float>();//一時保存
      Stone.add(px);
      Stone.add(py);
      Stone.add(drawCount);//描画順
      Stone.add(0.0);//選択チェック
      Stone.add(float(selectCol));//石の種類
      Stone.add(lensD);//石の直径
      Stones.add(Stone);
      drawingStone++;
      plusstone++;
    }
    //println(cd+","+dS);
  }

  while (plusstone>0) {
    int plus=0;
    for (int u=0; u<plusstone; u++) {
      int p=Stones.size()-plusstone+u-plus;
      for (int i=0; i<4; i++) {
        boolean cd=true;
        float px=0;
        float py=0;
        if (i==0) {//left
          px=Stones.get(p).get(0)-px(lensD+space);
          py=Stones.get(p).get(1);
        } else if (i==1) {//right
          px=Stones.get(p).get(0)+px(lensD+space);
          py=Stones.get(p).get(1);
        } else if (i==2) {//up
          px=Stones.get(p).get(0);
          py=Stones.get(p).get(1)-px(lensD+space);
        } else {//down
          px=Stones.get(p).get(0);
          py=Stones.get(p).get(1)+px(lensD+space);
        }
        for (int j=0; j<Stones.size()-(i+1); j++) {
          dS=dist(Stones.get(j).get(0), Stones.get(j).get(1), px, py);
          if (dS<px(Stones.get(j).get(5)/2.0+lensD/2.0)) {
            cd=false;
          }
          if(px<Dx||Dx+Dw<px){
            cd=false;
          }
          if(py<Dy||Dy+Dh<py){
            cd=false;
          }
        }
        for (int j=0; j<Stones.size(); j++) {
          if(Stones.get(j).get(0)==px&&Stones.get(j).get(1)==py){
            cd=false;
            
          }
        }
        if (cd) {
          noFill();
          ellipse(px, py, px(lensD), px(lensD));
          ArrayList<Float> Stone=new ArrayList<Float>();//一時保存
          Stone.add(px);
          Stone.add(py);
          Stone.add(drawCount);//描画順
          Stone.add(0.0);//選択チェック
          Stone.add(float(selectCol));//石の種類
          Stone.add(lensD);//石の直径
          Stones.add(Stone);
          drawingStone++;
          plus++;
        }
        //println(cd+","+dS);
      }   
    }
    plusstone=plus;
  }
}
