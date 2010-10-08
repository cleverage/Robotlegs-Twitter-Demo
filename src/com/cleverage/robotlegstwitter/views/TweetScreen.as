package com.cleverage.robotlegstwitter.views
{
  import com.cleverage.robotlegstwitter.models.Tweet;
  
  import flash.display.Sprite;
  
  public class TweetScreen extends Sprite
  {
    protected var _tweets : Vector.<Tweet>;
    protected var _index : int;
    
    public function TweetScreen()
    {
      super();
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
      for each (current in value)
      {
        view = new TweetView();
        view.tweet = current;
        addChild(view);
        view.y = ++index * 50;
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