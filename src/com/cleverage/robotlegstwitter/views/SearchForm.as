package com.cleverage.robotlegstwitter.views
{
  import com.cleverage.robotlegstwitter.events.FormEvent;
  import com.cleverage.robotlegstwitter.events.SearchEvent;
  
  import flash.display.Sprite;
  import flash.events.Event;
  import flash.events.MouseEvent;
  import flash.text.TextField;
  import flash.text.TextFieldType;
  import flash.text.TextFormat;
  
  public class SearchForm extends Sprite
  {
    protected var _keyword : TextField;
    
    protected var trigger : Sprite;
    
    public function SearchForm()
    {
      super();
      addEventListener(Event.ADDED_TO_STAGE, addToStageHandler);
    }
    
    protected function addToStageHandler(e : Event) : void
    {
      removeEventListener(Event.ADDED_TO_STAGE, addToStageHandler);
      
      keyword = new TextField();
      keyword.type = TextFieldType.INPUT;
      
      addChild(keyword);
      
      trigger = new Sprite();
      // drawing
      trigger.graphics.beginFill(0x00ff00);
      trigger.graphics.drawRect(0, 0, 200, 50);
      trigger.graphics.endFill();
      trigger.x = keyword.x + keyword.width + 20; 
      addChild(trigger);
      
      trigger.addEventListener(MouseEvent.CLICK, triggerClickHandler);
    }
    
    protected function triggerClickHandler(e : MouseEvent) : void
    {
      if (keyword.text == "")
        return;
      
      dispatchEvent(new FormEvent(FormEvent.SUBMIT));
    }

    public function get keyword():TextField
    {
      return _keyword;
    }

    public function set keyword(value:TextField):void
    {
      _keyword = value;
    }

  }
}