void StoneFill2() {
  boolean CD=true;
  float dS=0;
  int plusstone=0;
  int stonesum=0;
  for (int j=0; j<Stones.size(); j++) {//他の全ての石との当たり判定
    dS=dist(Stones.get(j).get(0), Stones.get(j).get(1), mouseX, mouseY);
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
    stonesum++;
  }


  for (int i=0; i<6; i++) {
    boolean cd=true;
    float px=0;
    float py=0;
    if (i==0) {//left
      px=mouseX-px(lensD+space);
      py=mouseY;
    } else if (i==1) {//right
      px=mouseX+px(lensD+space);
      py=mouseY;
    } else if (i==2) {//upleft
      px=mouseX-px((lensD+space)/2);
      py=mouseY-px((lensD+space)/2*sqrt(3));
    } else if (i==3) {//upright
      px=mouseX+px((lensD+space)/2);
      py=mouseY-px((lensD+space)/2*sqrt(3));
    } else if (i==4) {//downleft
      px=mouseX-px((lensD+space)/2);
      py=mouseY+px((lensD+space)/2*sqrt(3));
    } else {//downright
      px=mouseX+px((lensD+space)/2);
      py=mouseY+px((lensD+space)/2*sqrt(3));
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
      stonesum++;
    }
    //println(cd+","+dS);
  }

  while (plusstone>0) {
    int plus=0;
    for (int u=0; u<plusstone; u++) {
      int p=Stones.size()-plusstone+u-plus;
      for (int i=0; i<6; i++) {
        boolean cd=true;
        float px=0;
        float py=0;

        if (i==0) {//left
          px=Stones.get(p).get(0)-px(lensD+space);
          py=Stones.get(p).get(1);
        } else if (i==1) {//right
          px=Stones.get(p).get(0)+px(lensD+space);
          py=Stones.get(p).get(1);
        } else if (i==2) {//upleft
          px=Stones.get(p).get(0)-px((lensD+space)/2);
          py=Stones.get(p).get(1)-px((lensD+space)/2*sqrt(3));
        } else if (i==3) {//upright
          px=Stones.get(p).get(0)+px((lensD+space)/2);
          py=Stones.get(p).get(1)-px((lensD+space)/2*sqrt(3));
        } else if (i==4) {//downleft
          px=Stones.get(p).get(0)-px((lensD+space)/2);
          py=Stones.get(p).get(1)+px((lensD+space)/2*sqrt(3));
        } else {//downright
          px=Stones.get(p).get(0)+px((lensD+space)/2);
          py=Stones.get(p).get(1)+px((lensD+space)/2*sqrt(3));
        }

        for (int j=0; j<Stones.size()-(i+1); j++) {
          dS=dist(Stones.get(j).get(0), Stones.get(j).get(1), px, py);
          if (dS<px(Stones.get(j).get(5)/2.0+lensD/2.0)) {
            cd=false;
          }
          if (px<Dx||Dx+Dw<px) {
            cd=false;
          }
          if (py<Dy||Dy+Dh<py) {
            cd=false;
          }
        }
        for (int j=0; j<Stones.size(); j++) {
          //if (Stones.get(j).get(0)==px&&Stones.get(j).get(1)==py) {
          if (dist(Stones.get(j).get(0), Stones.get(j).get(1), px, py)<px(Stones.get(j).get(5))) {
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
          stonesum++;
        }
        //println(cd+","+dS);
      }
    }
    plusstone=plus;
  }

  //println(Stones.size()+","+stonesum);

  float[][] nearstone=new float[6][2];
  int nearc=0;
  float[] newstone=new float[stonesum];
  float distcheck;
  float nearsum=0;
  float nearsumx=0;
  float nearsumy=0;
  boolean Cd=true; 
  float newpointx=0;
  float newpointy=0;
  //Stones.get(Stones.size()-1).set(4,5.0);
  for (int i=Stones.size()-1; i<Stones.size(); i++) {
    for (int j=0; j<Stones.size(); j++) {
      if (i!=j) {
        distcheck=dist(Stones.get(i).get(0), Stones.get(i).get(1), Stones.get(j).get(0), Stones.get(j).get(1));
        if (distcheck<=px(Stones.get(i).get(5)+space+3)) {//直径x2より距離が小さかったら
          nearstone[nearc][0]=Stones.get(j).get(0);
          nearstone[nearc][1]=Stones.get(j).get(1);
          nearc++;
          Stones.get(j).set(4, 2.0+nearc);
          Stones.get(i).set(4, 12.0);
        }
      }
    }
    println(nearc);

    for (int u=0; u<nearc; u++) {
      nearsumx+=nearstone[u][0];
      nearsumy+=nearstone[u][1];
      nearsum+=dist(Stones.get(i).get(0), Stones.get(i).get(1), nearstone[u][0], nearstone[u][1]);
    }
    //println(nearsum+","+nearc);
    for (int u=0; u<nearc; u++) {
      if (dist(Stones.get(i).get(0), Stones.get(i).get(1), nearstone[u][0], nearstone[u][1])>nearsum/nearc) {
        println(dist(Stones.get(i).get(0), Stones.get(i).get(1), nearstone[u][0], nearstone[u][1])+","+nearsum/nearc);
        newpointx=lerp(Stones.get(i).get(0),nearstone[u][0],((dist(Stones.get(i).get(0),Stones.get(i).get(1),nearstone[u][0],nearstone[u][1])-Stones.get(i).get(5))/2.0)/dist(Stones.get(i).get(0),Stones.get(i).get(1),nearstone[u][0],nearstone[u][1]));
        newpointy=lerp(Stones.get(i).get(1),nearstone[u][1],((dist(Stones.get(i).get(0),Stones.get(i).get(1),nearstone[u][0],nearstone[u][1])-Stones.get(i).get(5))/2.0)/dist(Stones.get(i).get(0),Stones.get(i).get(1),nearstone[u][0],nearstone[u][1]));
        for (int v=0; v<nearc; v++) {
          if (dist(newpointx, newpointy, nearstone[v][0], nearstone[v][1])<px(Stones.get(i).get(5)+space)) {
            Cd=false;
          }
        }
        if (Cd) {
          Stones.get(i).set(0, newpointx);
          Stones.get(i).set(1, newpointy);
        }


        //println((nearsumx/nearc)+"¥"+dist(Stones.get(i).get(0), Stones.get(i).get(1),nearstone[u][0],nearstone[u][1]));
      }
    }
  }
}
