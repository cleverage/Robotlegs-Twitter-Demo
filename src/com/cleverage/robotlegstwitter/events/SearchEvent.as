package com.cleverage.robotlegstwitter.events
{
  import flash.events.Event;
  
  public class SearchEvent extends Event
  {
    static public const START : String = "SearchEvent.START";
    static public const SEARCH : String = "SearchEvent.SEARCH";
    static public const ERROR : String = "SearchEvent.ERROR";
    
    
    protected var _keyword : String;
    
    public function SearchEvent(type:String, keyword : String = null)
    {
      super(type, true, true);
      this.keyword = keyword;
    }
    
    override public function clone() : Event
    {
      return new SearchEvent(type, keyword);  
    }

    public function get keyword():String
    {
      return _keyword;
    }

    public function set keyword(value:String):void
    {
      _keyword = value;
    }

  }
}