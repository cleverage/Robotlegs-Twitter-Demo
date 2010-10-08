package com.cleverage.robotlegstwitter
{
  import com.cleverage.robotlegstwitter.commands.PerformSearchCommand;
  import com.cleverage.robotlegstwitter.commands.UpdateTweetListModelCommand;
  import com.cleverage.robotlegstwitter.events.SearchEvent;
  import com.cleverage.robotlegstwitter.events.SearchResultEvent;
  import com.cleverage.robotlegstwitter.models.Tweet;
  import com.cleverage.robotlegstwitter.models.TweetList;
  import com.cleverage.robotlegstwitter.services.Twitter;
  import com.cleverage.robotlegstwitter.views.ContextViewMediator;
  import com.cleverage.robotlegstwitter.views.SearchForm;
  import com.cleverage.robotlegstwitter.views.SearchFormMediator;
  import com.cleverage.robotlegstwitter.views.TweetScreen;
  import com.cleverage.robotlegstwitter.views.TweetScreenMediator;
  
  import flash.display.DisplayObjectContainer;
  
  import flashx.textLayout.events.UpdateCompleteEvent;
  
  import org.robotlegs.mvcs.Context;
  
  public class RobotlegsTwitterContext extends Context
  {
    public function RobotlegsTwitterContext(contextView:DisplayObjectContainer=null, autoStartup:Boolean=true)
    {
      super(contextView, autoStartup);
    }
    
    override public function startup() : void
    {
      trace("Application is starting up");
      
      commandMap.mapEvent(SearchEvent.SEARCH, PerformSearchCommand, SearchEvent);
      commandMap.mapEvent(SearchResultEvent.RESULTS, UpdateTweetListModelCommand, SearchResultEvent);
      
      mediatorMap.mapView(RobotlegsTwitterDemo, ContextViewMediator);
      mediatorMap.mapView(SearchForm, SearchFormMediator);
      mediatorMap.mapView(TweetScreen, TweetScreenMediator);
      
      injector.mapSingleton(TweetList);
      injector.mapSingleton(Twitter);
      
      super.startup();
    }
  }
}