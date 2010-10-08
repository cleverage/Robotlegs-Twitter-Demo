package com.cleverage.robotlegstwitter.views
{
  import com.cleverage.robotlegstwitter.events.FormEvent;
  import com.cleverage.robotlegstwitter.events.SearchEvent;
  
  import flash.events.Event;
  
  import org.robotlegs.mvcs.Mediator;
  
  public class SearchFormMediator extends Mediator
  {
    [Inject]
    public var form : SearchForm;
    
    public function SearchFormMediator()
    {
      super();
    }
    
    override public function onRegister() : void
    {
      trace("Search form registering");
      form.addEventListener(FormEvent.SUBMIT, loginFormSubmitHandler);
    }
    
    override public function onRemove() : void
    {
      trace("Search form removing");
    }
    
    protected function loginFormSubmitHandler(e : FormEvent) : void
    {
      dispatch(new SearchEvent(SearchEvent.SEARCH, form.keyword.text));
    }
  }
}