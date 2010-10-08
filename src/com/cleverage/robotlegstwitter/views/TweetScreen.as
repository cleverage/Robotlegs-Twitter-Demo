package com.cleverage.robotlegstwitter.views
{
  import com.cleverage.robotlegstwitter.models.Tweet;
  
  import flash.display.DisplayObject;
  import flash.display.Sprite;
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
      container = new Sprite();
      addChild(container);
      setInterval(function() : void { container.x -= 20 }, 100);
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
      var index : uint = 0;
      
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
      var child : DisplayObject;
      var index : int = 0;
      for (index = 0; index < container.numChildren; index++)
      {
        child = container.getChildAt(index);
        trace(index, child);
        if (child is TweetView)
        {
          trace("child is TweetView");
          container.removeChild(child);
          child = null;
        }
      }
    }

    public function get index() : int
    {
      return _index;
    }

    public function set index(value : int):void
    {
      _index = value;
    }
  }
}