package com.cleverage.robotlegstwitter.views
{
  import com.cleverage.robotlegstwitter.events.FormEvent;
  import com.cleverage.robotlegstwitter.events.SearchEvent;
  
  import flash.display.Sprite;
  import flash.events.Event;
  import flash.events.MouseEvent;
  import flash.text.AntiAliasType;
  import flash.text.TextField;
  import flash.text.TextFieldType;
  import flash.text.TextFormat;
  
  import flashx.textLayout.accessibility.TextAccImpl;
  import flashx.textLayout.formats.TextAlign;
  
  public class SearchForm extends Sprite
  {
    [Embed(source='/assets/fonts/picoblack.ttf', fontFamily='Pico', embedAsCFF="false")]
    static public const Pico : Class;
    
    static public const TEXT_COLOR_NORMAL : Number = 0x000000;
    static public const TEXT_COLOR_HOVER : Number = 0xFFFFFF;
    
    protected var _keyword : TextField;
    protected var trigger : Sprite;
    protected var label : TextField;
    protected var format : TextFormat;
    
    public function SearchForm()
    {
      super();
      addEventListener(Event.ADDED_TO_STAGE, addToStageHandler);
    }
    
    protected function addToStageHandler(e : Event) : void
    {
      removeEventListener(Event.ADDED_TO_STAGE, addToStageHandler);
      
      keyword = new TextField();
      keyword.border = true;
      keyword.width = 300;
      keyword.height = 25;
      keyword.y = 13;
      keyword.defaultTextFormat = new TextFormat(null, "20");
      keyword.type = TextFieldType.INPUT;
      keyword.text = "Keyword";
      addChild(keyword);
      
      createTriggerButton();
    }
    
    protected function createTriggerButton() : void
    {
      trigger = new Sprite();
      trigger.useHandCursor = true;
      trigger.buttonMode = true;
      trigger.mouseChildren = false;
      
      // drawing background
      trigger.graphics.beginFill(0xABABAB);
      trigger.graphics.drawRect(0, 0, 200, 50);
      trigger.graphics.endFill();
      
      trigger.graphics.lineStyle(2, 0x000000);
      trigger.graphics.drawRect(0, 0, 200, 50);
      trigger.graphics.endFill();
      
      trigger.x = keyword.x + keyword.width + 20; 
      
      // text
      label = new TextField();
      label.antiAliasType = AntiAliasType.ADVANCED;
      label.width = 200;
      label.text = "Search";
      label.embedFonts = true;
      
      format = new TextFormat();
      format.font = "Pico"
      format.size = "40";
      format.color = TEXT_COLOR_NORMAL;
      format.align = TextAlign.CENTER;
      
      label.setTextFormat(format);
      trigger.addChild(label);
      
      
      addChild(trigger);
      
      trigger.addEventListener(MouseEvent.MOUSE_OVER, triggerOverHandler);
      trigger.addEventListener(MouseEvent.MOUSE_OUT, triggerOutHandler);
      trigger.addEventListener(MouseEvent.CLICK, triggerClickHandler);      
    }
    
    protected function triggerOverHandler(e : MouseEvent) : void
    {
      format.color = TEXT_COLOR_HOVER;
      label.setTextFormat(format);
    }
    
    protected function triggerOutHandler(e : MouseEvent) : void
    {
      format.color = TEXT_COLOR_NORMAL;
      label.setTextFormat(format);
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