void gui() {
  
  cp5 = new ControlP5(this);
  
    Group g11 = cp5.addGroup("color")
                .setBackgroundColor(color(0, 64))
                .setBackgroundHeight(40)
                ;
                
    
      cp5.addSlider("r")
     .setPosition(30,10)
     .setSize(100,8)
     .setRange(0,255)
     .setValue(5)
     .moveTo(g11)
    // .setLabel("颜色")
     ;
     
      cp5.addSlider("g")
     .setPosition(30,20)
     .setSize(100,8)
     .setRange(0,255)
     .setValue(225)
     .moveTo(g11)
     ;
     
      cp5.addSlider("b")
     .setPosition(30,30)
     .setSize(100,8)
     .setRange(0,255)
     .setValue(255)
     .moveTo(g11)
     ;
     
    // cp5.addSlider("alpha")
    // .setPosition(30,45)
    // .setSize(100,8)
    // .setRange(0,100)
    // .setValue(80)
    // .moveTo(g11)
    // ;
     
     Group g22 = cp5.addGroup("size")
                .setBackgroundColor(color(0, 64))
                .setBackgroundHeight(40)
                ;
                
      cp5.addSlider("wid")
     .setPosition(30,20)
     .setSize(100,20)
     .setRange(0.5,4)
     .setValue(1)
     .moveTo(g22)
     
     ;
      cp5.addSlider("hgt")
     .setPosition(30,50)
     .setSize(100,20)
     .setRange(0.5,4)
     .setValue(1)
     .moveTo(g22)
     
     ;
     
       accordion = cp5.addAccordion("acc")
                 .setPosition(40,40)
                 .setWidth(200)
                 .addItem(g11)
                 .addItem(g22)
             
                 ;
  
  accordion.open(0,1);

  accordion.setCollapseMode(Accordion.MULTI);
  


}
  
