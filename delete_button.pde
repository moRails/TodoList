// delete a task

class DeleteButton
{
  int posX, posY, index;
  boolean priority;
  DeleteButton(int x, int y, int i)
  {
    posX = x;
    posY = y;
    index= i;
    priority = false;
  }

  void dessine()
  { 
    if (isInside())
    {
      fill(200, 0, 0);
    } else
    {
      fill(100);
    }
    rect(posX, posY, 10, 10);
    priorityCheck();
  }

  int getIndex()
  {
    return index;
  }
  
  void setIndex()
  {
     index -= 1; 
  }

  void setPosY(int newPosY)
  {
    posY = newPosY;
  }
  boolean isInside()
  {
    if (mouseX > posX  && mouseX < posX + 10 && mouseY > posY && mouseY < posY + 10)
    {
      return true;
    } else
    {
      return false;
    }
  }
  
  void priorityCheck()
  {  
      pushStyle();
      noStroke();
      if(priority)
      {
         fill(0, 200, 0); 
      }else
      {
         fill(255); 
      }
      ellipse(posX - 12, posY + 5, 10, 10);
      popStyle();
  }
  
  void isInsidePriority()
  {
    if(dist(mouseX, mouseY, posX-12, posY + 5) < 10)
    {
       priority =! priority; 
    }
  }
}

