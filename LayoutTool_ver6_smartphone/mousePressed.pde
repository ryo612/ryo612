void mousePressed() {
  if (Fy<mouseY&&mouseY<Fy+Fh) {
    if (Fx<mouseX&&mouseX<Fx+Fw) {
      file=1;//save
    } else if (Fx+Fw<mouseX&&mouseX<Fx+Fw*2) {
      file=2;//output
    }
  }

  //pattern
  /*if (Py<mouseY&&mouseY<Py+Ph*2) {
   if (Px<mouseX&&mouseX<Px+Pw*7) {  */

  //pattern
  for (int j=0; j<2; j++) {
    for (int i=0; i<7; i++) {
      if (Px+Pw*i<mouseX&&mouseX<Px+Pw*i+Pw) {
        if (Py+Ph*j<mouseY&&mouseY<Py+Ph*j+Ph) {
          selectCol=i+j*7;
        }
      }
    }
  }

  if (tool==0) {
    for (int i=0; i<Stones.size(); i++) {//選択されたかの判定
      if (Stones.get(i).get(0)-px(Stones.get(i).get(5))/2.0<mouseX&&mouseX<Stones.get(i).get(0)+px(Stones.get(i).get(5))/2.0) {
        if (Stones.get(i).get(1)-px(Stones.get(i).get(5))/2.0<mouseY&&mouseY<Stones.get(i).get(1)+px(Stones.get(i).get(5))/2.0) {
          pick=i;
        }
      }
    }
  }

  if (Dx<mouseX&&mouseX<Dx+Dw) {
    if (Dy<mouseY&&mouseY<Dy+Dh) {
      if (tool==3) {
        StoneFill();
      }
    }
  }


  /*float dM;//マウス座標との距離
   float dS;//ストーン座標との距離
   stroke(0);
   pressX=Mouses.get(0).get(0);//初期位置
   pressY=Mouses.get(0).get(1);
   for (int i=0; i<Mouses.size()-1; i++) {
   boolean CD=true;
   if (Mouses.get(i).get(0)>0&&Mouses.get(i+1).get(1)>0) {
   if (Mouses.get(i+1).get(3)==1.0) {
   dM=dist(pressX, pressY, Mouses.get(i+1).get(0), Mouses.get(i+1).get(1));
   if (dM>px(lensD+0.2)) {
   
   for (int j=0; j<Stones.size(); j++) {//他の全ての石との当たり判定
   dS=dist(Stones.get(j).get(0), Stones.get(j).get(1), Mouses.get(i+1).get(0), Mouses.get(i+1).get(1));
   if (dS<px(lensD)) {
   CD=false;
   }
   }
   
   if (CD==true) {//他の石と被らなければ，石の座標を登録
   noFill();
   ellipse(Mouses.get(i+1).get(0), Mouses.get(i+1).get(1), px(lensD), px(lensD));
   ArrayList<Float> Stone=new ArrayList<Float>();//一時保存
   Stone.add(Mouses.get(i+1).get(0));
   Stone.add(Mouses.get(i+1).get(1));
   Stone.add(Mouses.get(i+1).get(2));//描画順
   Stone.add(0.0);//選択チェック
   Stone.add(float(selectCol));//石の種類
   Stones.add(Stone);
   }
   }
   }
   }
   }
   }
   }*/
}
