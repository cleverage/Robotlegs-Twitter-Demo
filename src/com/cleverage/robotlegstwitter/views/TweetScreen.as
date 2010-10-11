package com.cleverage.robotlegstwitter.views
{
  import com.cleverage.robotlegstwitter.models.Tweet;
  import com.greensock.TweenLite;
  import com.greensock.easing.Back;
  
  import flash.display.DisplayObject;
  import flash.display.Sprite;
  import flash.events.Event;
  import flash.events.KeyboardEvent;
  import flash.ui.Keyboard;
  import flash.utils.setInterval;
  import flash.utils.setTimeout;
  
  public class TweetScreen extends Sprite
  {
    protected var container : Sprite;
    protected var _tweets : Vector.<Tweet>;
    protected var _index : int;
    
    public function TweetScreen()
    {
      super();

      addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
    }

    public function get tweets() : Vector.<Tweet>
    {
      return _tweets;
    }

    public function set tweets(value : Vector.<Tweet>):void
    {
      _tweets = value;
      index = 0; // reset index
      
      var current : Tweet;
      var view : TweetView;

      for each (current in tweets)
      {
        view = new TweetView();
        view.tweet = current;
        view.x = container.numChildren > 0 
          ? container.getChildAt(container.numChildren - 1).x + container.getChildAt(container.numChildren - 1).width  
          : 0;
        container.addChild(view);
      }
    }
    
    public function clear() : void
    {
      while (container.numChildren > 0)
      {
        container.removeChildAt(container.numChildren - 1);
      }
    }

    public function get index() : int
    {
      return _index;
    }

    public function set index(value : int):void
    {
      var posX : Number = - (value * 630);
      TweenLite.to(container, 1, {x: posX, ease: Back.easeOut});
      
      _index = value;
    }
    
    protected function addedToStageHandler(e : Event) : void
    {
      removeEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
      
      // tweets container
      container = new Sprite();
      addChild(container);
      
      // keyboard listeners
      stage.addEventListener(KeyboardEvent.KEY_UP, keyUppedHandler);
    }
    
    protected function keyUppedHandler(e : KeyboardEvent) : void
    {
      if (e.keyCode == Keyboard.LEFT)
      {
        if (index == 0)
        {
          index = tweets.length - 1;
        }
        else
        {
          index --;
        }
      }
      else if (e.keyCode == Keyboard.RIGHT) 
      {
        if (index == (tweets.length - 1))
        {
          index = 0;
        }
        else
        {
          index ++;
        }
      }
    }
  }
}