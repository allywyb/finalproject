import controlP5.*;
ControlP5 cp5;
Accordion accordion;

int r=5;
int g=225;
int b=255;
int alpha=95;


Table table;
int id;
String species;


int i=1;
Bar[]bs;
int[] num; //表内数据
int sum=0;//数据总和
String[] names;

int[] pmss;
int ms,value;
int pms;
int t;
int[] ts;

float wid=1;
float hgt=2;





void setup() {


    //table = loadTable("data.csv", "header");
    table = loadTable("data1.csv", "header");
    int countNum=table.getRowCount();  
    
    num= new int[countNum];
    names= new String[countNum];
    pmss= new int[10];
    ts= new int[countNum];
   
    int i1=0;
    for (TableRow row : table.rows()) {
    num[i1] = row.getInt("数据");
      println(num[i1]);
   
    names[i1] =row.getString("年份");
    println(names[i1]);
    
     i1+=1;
    
  }
  for(int isum=0;isum<num.length;isum++){
  sum=sum+num[isum];
  }
  println(sum);


  
  
  size(1000, 800);

  bs=new Bar[countNum];//bs Bar类型 countNum个数
  float unit=width/float(bs.length+1); 
  for (int i=0; i<bs.length; i++) {
    bs[i]=new Bar(unit*(i+1), height*0.8, height* num[i]/sum, names[i],ts[i]);//(xpos,ypos,ht_target,ss)
  }
  
  gui();
  
  //int pms = frameCount;   
  //initiate();

}
    
    
void draw() {
   if (value == 0) { 
    background(255);
     ms = millis(); //计时


  stroke(r,g,b,alpha);
  strokeWeight(3);
  line(0, height*0.8, width, height*0.8);//底部线
  
  
   } else {  
   
    pms= millis()-ms;
    println(pms);
   background(255);
   pmss[0]= pms;


  int index2=pmss[0]/500;
 

if (index2<=bs.length-1){
  index2=min(index2, bs.length-1);//比较大小
  println(index2);
  bs[index2].trigger();    //每个柱子依次动起来 moving=true
}else{

}


  for (int i=0; i<bs.length; i++) {
    bs[i].update();
    bs[i].display();//每个元素出现
  }

  stroke(r,g,b,alpha);//方形线
  strokeWeight(3);
  line(0, height*0.8, width, height*0.8);//底部线
  
 }
 
 //saveFrame("project-######.png");
}
///


class Bar {

  float xpos;
  float ypos;
  float wd;
  float ht;
  float ht2;
  float ht_target;
  float ht_spd;
  boolean moving=false;  //为true时才开始动，参考下面的 trigger 命令
  String name;

  Bar(float xx, float yy, float ht_t, String ss,int tt) {
    xpos=xx;
    ypos=yy;
    tt=t;
    wd=20;
    ht=0;
    ht_target=ht_t;//
    ht_spd=0;
    ht2=0;

    name=ss;
  }

  void trigger() {
    moving=true;
    t=0;
   
  }
    void trigger2() {
    moving=false;
    t=0;
   
  }
  

  void update() {
   if (keyPressed){
    ht2=0;
   }
    
    if (moving) {
      t++;
      float acc=(ht_target-ht)*0.01;
      ht_spd+=acc;//=0
      ht+=ht_spd;////
      ht_spd*=0.9;
      ht2=ht;
      if (t>100){
      moving=false;
      ht=0;
      ht_spd=0;
      t=0;
    }
    }

  }

  void display() {
    noStroke();
    fill(r,g,b,alpha);
    rect(xpos-wd*wid/2, ypos-ht2*hgt, wd*wid, ht2*hgt);//ht=0  

    fill(r,g,b,alpha);
    textSize(wd);
    textAlign(CENTER, TOP);
    text(name, xpos, ypos+wd);
  }
}

void keyPressed() {  
  if (value == 0) {
    value = 1;
  } else {
    value = 0;
  }
}
