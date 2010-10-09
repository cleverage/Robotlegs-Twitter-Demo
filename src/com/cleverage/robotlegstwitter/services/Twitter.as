package com.cleverage.robotlegstwitter.services
{
  import com.cleverage.robotlegstwitter.events.SearchEvent;
  import com.cleverage.robotlegstwitter.events.SearchResultEvent;
  import com.cleverage.robotlegstwitter.models.Tweet;
  
  import flash.events.Event;
  import flash.events.IOErrorEvent;
  import flash.net.URLLoader;
  import flash.net.URLRequest;
  import flash.net.URLRequestMethod;
  import flash.net.URLVariables;
  
  import org.robotlegs.mvcs.Actor;
  
  public class Twitter extends Actor
  {
    public function Twitter()
    {
      super();
    }
    
    public function searchFor(keyword : String) : void
    {
      var loader : URLLoader = new URLLoader();
      loader.addEventListener(Event.COMPLETE, searchCompleteHandler);
      loader.addEventListener(IOErrorEvent.IO_ERROR, errorHandler);
      
      var target : URLRequest = new URLRequest("http://search.twitter.com/search.atom");
      target.method = URLRequestMethod.POST;
      target.data = new URLVariables();
      target.data.q  = keyword;
      
      loader.load(target);
      dispatch(new SearchEvent(SearchEvent.START));
    }
    
    protected function errorHandler(e : IOErrorEvent) : void
    {
      dispatch(new SearchEvent(SearchEvent.ERROR));
    }
    
    protected function searchCompleteHandler(e : Event) : void
    {
      var results : XML = new XML(e.target.data as String);
      var tweet : Tweet;
      var tweets : Array = [];
      var atom : Namespace = new Namespace("http://www.w3.org/2005/Atom");
       
      for each(var node : XML in results..atom::entry)
      {
        tweet = new Tweet();
        tweet.fromAtomEntry(node, atom);
        tweets.push(tweet);
      }
      
      dispatch(new SearchResultEvent(SearchResultEvent.RESULTS, tweets));
    }
    
    protected function unload(loader : URLLoader) : void
    {
      loader.removeEventListener(Event.COMPLETE, searchCompleteHandler);
      loader.removeEventListener(IOErrorEvent.IO_ERROR, errorHandler);
      loader.close();
      loader = null;
    }
  }
}