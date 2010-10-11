package com.cleverage.robotlegstwitter.events
{
  import flash.events.Event;
  
  public class SearchResultEvent extends Event
  {
    protected var _results : Array;
    
    static public const RESULTS : String = "SearchResultEvent.RESULTS";
    
    public function SearchResultEvent(type:String, results : Array = null)
    {
      super(type, true, true);
      
      this.results = results;
    }
    
    override public function clone() : Event
    {
      return new SearchResultEvent(type, results);
    }

    public function get results():Array
    {
      return _results;
    }

    public function set results(value:Array):void
    {
      _results = value;
    }

  }
}