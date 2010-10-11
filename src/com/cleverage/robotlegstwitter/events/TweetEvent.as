package com.cleverage.robotlegstwitter.events
{
  import com.cleverage.robotlegstwitter.models.Tweet;
  
  import flash.events.Event;
  
  public class TweetEvent extends Event
  {
    static public const ADDED : String = "TweetEvent.ADDED";
    
    protected var _tweet : Tweet;
    
    public function TweetEvent(type:String, tweet : Tweet)
    {
      super(type, true, true);
      this.tweet = tweet;
    }
    
    override public function clone() : Event 
    {
      return new TweetEvent(type, tweet);
    }

    public function get tweet():Tweet
    {
      return _tweet;
    }

    public function set tweet(value:Tweet):void
    {
      _tweet = value;
    }

  }
}