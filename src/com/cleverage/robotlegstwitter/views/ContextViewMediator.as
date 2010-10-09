package com.cleverage.robotlegstwitter.views
{
  import com.cleverage.robotlegstwitter.RobotlegsTwitterContext;
  import com.cleverage.robotlegstwitter.events.SearchEvent;
  import com.cleverage.robotlegstwitter.events.SearchResultEvent;
  
  import org.robotlegs.mvcs.Mediator;
  
  public class ContextViewMediator extends Mediator
  {
    [Inject]
    public var view : RobotlegsTwitterDemo;
    
    public function ContextViewMediator()
    {
      super();
    }
    
    override public function onRegister() : void
    {
      trace("context view up and running");
      eventMap.mapListener(eventDispatcher, SearchEvent.START, searchStartedHandler);
      eventMap.mapListener(eventDispatcher, SearchResultEvent.RESULTS, searchCompleteHandler);
      eventMap.mapListener(eventDispatcher, SearchEvent.ERROR, errorHandler);
    }
    
    protected function errorHandler(e : SearchEvent) : void
    {
      
    }
    
    protected function searchStartedHandler(e : SearchEvent) : void
    {
      view.showLoader();
    }
    
    protected function searchCompleteHandler(e : SearchResultEvent) : void
    {
      view.removeLoader(); 
    }
  }
}