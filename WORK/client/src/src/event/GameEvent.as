package event
{
	import flash.events.Event;
	
	public class GameEvent extends Event
	{
		public var window:String;
		public var param:Object;
		public function GameEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false, 
								  window:String="window", param:Object="param")
		{
			super(type, bubbles, cancelable);
			this.window = window;
			this.param = param;
		}
	}
}