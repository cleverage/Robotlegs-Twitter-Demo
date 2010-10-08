package com.cleverage.robotlegstwitter.events
{
  import flash.events.Event;
  
  public class SearchResultEvent extends Event
  {
    public var results : Array;
    
    static public const RESULTS : String = "SearchResultEvent.RESULTS";
    
    public function SearchResultEvent(type:String, results : Array = null)
    {
      super(type, true, true);
      
      this.results = results;
    }
  }
}