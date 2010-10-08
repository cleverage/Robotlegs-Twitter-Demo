package
{
  import com.cleverage.robotlegstwitter.RobotlegsTwitterContext;
  import com.cleverage.robotlegstwitter.views.SearchForm;
  import com.cleverage.robotlegstwitter.views.TweetScreen;
  
  import flash.display.Sprite;
  import flash.display.StageAlign;
  import flash.display.StageScaleMode;
  import flash.events.Event;
  import flash.text.Font;
  
  [SWF(width="600", height="600", frameRate="60")]
  public class RobotlegsTwitterDemo extends Sprite
  {
    protected var context : RobotlegsTwitterContext;
    
    protected var loader : Sprite;
    protected var screen : TweetScreen;
    
    public function RobotlegsTwitterDemo()
    {
      // defaults stage attributes
      stage.align = StageAlign.TOP_LEFT;
      stage.scaleMode = StageScaleMode.NO_SCALE;

      context = new RobotlegsTwitterContext(this); 
      
      addEventListener(Event.ADDED_TO_STAGE, addToStageHandler);
    }
    
    public function showLoader() : void
    {
      if (!loader)
      {
        loader = new Sprite();
        loader.graphics.beginFill(0xff0000);
        loader.graphics.drawRect(0, 0, 500, 200);
        loader.graphics.endFill();
      }
      
      addChild(loader);
    }
    
    public function removeLoader() : void
    {
      removeChild(loader);
    }
    
    protected function addToStageHandler(e : Event) : void
    {
      removeEventListener(Event.ADDED_TO_STAGE, addToStageHandler);
      
      var form : SearchForm = new SearchForm();
      addChild(form);
      
      var screen : TweetScreen = new TweetScreen();
      addChild(screen);
    }
  }
}