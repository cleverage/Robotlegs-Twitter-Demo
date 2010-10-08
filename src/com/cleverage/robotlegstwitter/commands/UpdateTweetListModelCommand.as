package com.cleverage.robotlegstwitter.commands
{
  import com.cleverage.robotlegstwitter.events.SearchResultEvent;
  import com.cleverage.robotlegstwitter.models.TweetList;
  
  import org.robotlegs.mvcs.Command;
  
  public class UpdateTweetListModelCommand extends Command
  {
    [Inject]
    public var dispatched : SearchResultEvent;
    
    [Inject]
    public var model : TweetList;
    
    public function UpdateTweetListModelCommand()
    {
      super();
    }
    
    override public function execute() : void
    {
      trace("updating model");
      model.clear();
      model.addTweets(dispatched.results);
    }
  }
}