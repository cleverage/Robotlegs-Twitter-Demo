package com.cleverage.robotlegstwitter.views
{
  import com.cleverage.robotlegstwitter.events.SearchEvent;
  import com.cleverage.robotlegstwitter.events.TweetListEvent;
  import com.cleverage.robotlegstwitter.models.TweetList;
  
  import flash.events.EventDispatcher;
  import flash.events.TextEvent;
  import flash.net.URLRequest;
  import flash.net.navigateToURL;
  
  import org.osmf.utils.URL;
  import org.robotlegs.mvcs.Mediator;
  
  public class TweetScreenMediator extends Mediator
  {
    [Inject]
    public var screen : TweetScreen;
    
    [Inject]
    public var list : TweetList;
    
    public function TweetScreenMediator()
    {
      super();
    }
    
    override public function onRegister() : void
    {
      trace("tweet screen registered");
      eventMap.mapListener(eventDispatcher, TweetListEvent.CHANGED, tweetListChangedHandler);
      
      screen.addEventListener(TextEvent.LINK, tweetLinkClickedHandler, true);
    }
    
    override public function onRemove() : void
    {
      trace("tweet screen removed");
    }
    
    protected function tweetLinkClickedHandler(e : TextEvent) : void
    {
      if (e.text.match(/^http:\/\/twitter.com\/([a-z0-9_]+)/i))
      {
        var login : String = /^http:\/\/twitter.com\/([a-z0-9_]+)/i.exec(e.text)[1];
        dispatch(new SearchEvent(SearchEvent.SEARCH, "@" + login));
      }
      else
      {
        navigateToURL(new URLRequest(e.text));
      }
    }
    
    protected function tweetListChangedHandler(e : TweetListEvent) : void
    {
      screen.clear()
      screen.tweets = list.tweets; 
    }
  }
}