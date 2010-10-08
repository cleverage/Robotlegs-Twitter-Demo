package com.cleverage.robotlegstwitter.events
{
  import com.cleverage.robotlegstwitter.models.Tweet;
  
  import flash.events.Event;
  
  public class TweetEvent extends Event
  {
    static public const ADDED : String = "TweetEvent.ADDED";
    
    public var tweet : Tweet;
    
    public function TweetEvent(type:String, tweet : Tweet)
    {
      super(type, true, true);
      this.tweet = tweet;
    }
  }
}