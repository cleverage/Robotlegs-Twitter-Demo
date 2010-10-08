package com.cleverage.robotlegstwitter.commands
{
  import com.cleverage.robotlegstwitter.events.SearchEvent;
  import com.cleverage.robotlegstwitter.services.Twitter;
  
  import org.robotlegs.mvcs.Command;
  
  public class PerformSearchCommand extends Command
  {
    [Inject]
    public var dispatched : SearchEvent;
    
    [Inject]
    public var service : Twitter;
    
    public function PerformSearchCommand()
    {
      super();
    }
    
    override public function execute() : void
    {
      trace("Search for", dispatched.keyword);  
      service.searchFor(dispatched.keyword);
    }
  }
}