package com.cleverage.robotlegstwitter.events
{
  import flash.events.Event;
  
  public class TweetListEvent extends Event
  {
    static public const CLEAR : String = "TweetListEvent.CLEAR";
    static public const CLEARED : String = "TweetListEvent.CLEARED";
    static public const CHANGED : String = "TweetListEvent.CHANGED";
    
    
    public function TweetListEvent(type:String)
    {
      super(type, true, true);
    }
    
    override public function clone() : Event
    {
      return new TweetListEvent(type);
    }
  }
}