package com.cleverage.robotlegstwitter.events
{
  import flash.events.Event;
  
  public class FormEvent extends Event
  {
    static public const SUBMIT : String = "FormEvent.SUBMIT";
    
    public function FormEvent(type:String)
    {
      super(type, true, true);
    }
    
    override public function clone() : Event
    {
      return new FormEvent(type);
    }
  }
}