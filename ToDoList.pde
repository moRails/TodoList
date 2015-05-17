import controlP5.*;
ControlP5 cp5;

String textValue = "";
StringList taskList;
ArrayList<DeleteButton> delBt = new ArrayList<DeleteButton>();
void setup()
{
  size(450, 450);

  PFont font = createFont("arial", 20);
  taskList = new StringList();

  cp5 = new ControlP5(this);

  cp5.addTextfield("new task")
    .setPosition(20, 20)
      .setSize(200, 40)
        .setFont(font)
          .setFocus(true)
            .setColor(color(255, 0, 0))
              ;

  cp5.addBang("ADD")
    .setPosition(240, 20)
      .setSize(80, 40)
        .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
          ;

  cp5.addBang("save")
    .setPosition(390, 20)
      .setSize(40, 40)
        .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
          ;
  //-- Init the task list with the previous tasks        
  String lines[] = loadStrings("todo.txt");
  String imp[]   = loadStrings("important.txt");
  for (int i = 0; i < lines.length; i++)
  {
    String newTask;
    newTask = lines[i];
    taskList.append(newTask);
    int ind = taskList.size();
    boolean initImportant;
    if(imp[i].equals("i"))
    {
       initImportant = true; 
    }else
    {
      initImportant = false;
    }
    
    delBt.add(new DeleteButton(20, 100 + (ind * 20), ind, initImportant));
  }
  println(taskList.size());
  println("-------------------");
}


void draw()
{
  background(255);
  line (20, 90, 430, 90);
  for (int i = 0; i < taskList.size (); i++)
  {
    delBt.get(i).dessine();
    text(taskList.get(i), 40, 130 + (i *20));
  }
}

void mousePressed()
{
  for (int i = 0; i < delBt.size (); i++)
  {
    delBt.get(i).isInsidePriority();
    if ( delBt.get(i).isInside())
    {
      delBt.remove(i);
      for (int j = i; j < delBt.size (); j++)
      {
        delBt.get(j).setIndex();
        int newIndex = delBt.get(j).getIndex();
        delBt.get(j).setPosY(100 + ( newIndex * 20));
      }
      taskList.remove(i);
    }
  }
}

public void ADD() {
  String newTask;
  newTask = cp5.get(Textfield.class, "new task").getText();
  taskList.append(newTask);
  println(taskList);
  int ind = taskList.size();
  delBt.add(new DeleteButton(20, 100 + (ind * 20), ind, false));
  cp5.get(Textfield.class, "new task").clear();
}

public void save()
{
  //-- Save the tasks
  String[] todoSave = taskList.array();
  saveStrings("todo.txt", todoSave);
  //-- Save if the task is important
  int sizeOftaskList = taskList.size(); 
  String[] important = new String[sizeOftaskList];
  for (int i = 0; i < sizeOftaskList; i++)
  {
      if(delBt.get(i).isItImportant())
      {
        important[i] = "i";
      }else
      {
        important[i] = "n";
      }
  }
  saveStrings("important.txt",important);
}
