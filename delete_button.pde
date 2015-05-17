// delete a task

class DeleteButton
{
  int posX, posY, index;
  DeleteButton(int x, int y, int i)
  {
    posX = x;
    posY = y;
    index= i;
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
}

