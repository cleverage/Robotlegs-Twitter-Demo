package com.cleverage.robotlegstwitter.views
{
  import com.cleverage.robotlegstwitter.models.Tweet;
  import com.cleverage.robotlegstwitter.utils.AssetsManager;
  
  import flash.display.Sprite;
  import flash.events.Event;
  import flash.events.TextEvent;
  import flash.text.AntiAliasType;
  import flash.text.Font;
  import flash.text.TextField;
  import flash.text.TextFormat;
  
  import flashx.textLayout.accessibility.TextAccImpl;
  import flashx.textLayout.formats.TextAlign;
  
  public class TweetView extends Sprite
  {
    private var _content : TextField;
    protected var format : TextFormat;
    
    protected var _tweet : Tweet;
    
    [Embed(source='/assets/fonts/picoblack.ttf', fontFamily='Pico', embedAsCFF="false")]
    static public var Pico : Class;

    public function TweetView()
    {
      super();
    }

    public function get tweet():Tweet
    {
      return _tweet;
    }

    public function set tweet(value:Tweet):void
    {
      _tweet = value;
      if (!content)
      {
        content = new TextField();
        content.wordWrap = true;
        content.embedFonts = true;
        content.antiAliasType = AntiAliasType.ADVANCED;
        content.width = 600;

        addChild(content);

        format = new TextFormat();
        format.font = "Pico";
        format.align = TextAlign.LEFT;
        format.size = 20;
      }

      trace(value.content.replace(/href="([^\"]+)"/gi, 'href="event:$1"'));
      content.htmlText = value.content.replace(/href="([^\"]+)"/gi, 'href="event:$1"');
      content.setTextFormat(format);
    }

    public function get content():TextField
    {
      return _content;
    }

    public function set content(value:TextField):void
    {
      _content = value;
    }
  }
}