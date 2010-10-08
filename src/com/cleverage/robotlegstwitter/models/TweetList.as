package com.cleverage.robotlegstwitter.models
{
  import com.cleverage.robotlegstwitter.events.TweetEvent;
  import com.cleverage.robotlegstwitter.events.TweetListEvent;
  
  import org.robotlegs.mvcs.Actor;
  
  public class TweetList extends Actor
  {
    protected var _tweets : Vector.<Tweet>;
    
    public function TweetList()
    {
      super();
      tweets = new Vector.<Tweet>();
    }
    
    public function clear() : void
    {
      tweets = new Vector.<Tweet>();
      dispatch(new TweetListEvent(TweetListEvent.CLEARED));
    }
    
    public function addTweet(tweet : Tweet) : void
    {
      tweets.push(tweet);      
      dispatch(new TweetEvent(TweetEvent.ADDED, tweet));
    }
    
    public function addTweets(list : Array) : void
    {
      var tweet : Tweet;
      for each(tweet in list)
      {
        addTweet(tweet);
      }
      
      dispatch(new TweetListEvent(TweetListEvent.CHANGED));
    }

    public function get tweets():Vector.<Tweet>
    {
      return _tweets;
    }

    public function set tweets(value:Vector.<Tweet>):void
    {
      _tweets = value;
    }

  }
}