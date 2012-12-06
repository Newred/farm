package mvc
{
	
	import event.GameEvent;
	
	import flash.display.Bitmap;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.Event;

	public class Model extends Sprite
	{
		public static const MEVENT:String  = "mevent"; // model event
		public var traceInfo:String; // trace info.
		public var bg:Bitmap;
		
		public function Model()
		{
			trace("Model ok");
		}
		
		public function setBG(_bm:Bitmap):void
		{
			bg = _bm ;
			addChildAt(bg,0);
			toView("loadBG", "bg");
		}
		
		private function toView(_key:String, _value:String):void
		{
			dispatchEvent(new GameEvent( MEVENT, true, false, _key, _value));
		}
	}
}