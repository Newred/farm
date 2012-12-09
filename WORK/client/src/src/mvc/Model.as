package mvc
{
	
	import event.GameEvent;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class Model extends Sprite
	{
		private var bg:Bitmap;
		private var landXY:Object = {};
		
		public function Model()
		{
			trace("Model ok2");
		}
		
		public function setBG(_bg:Bitmap):void
		{ 
			bg = _bg ;
			toView("getBG","","");
		}
		
		public function getBG():Bitmap
		{ 
			return bg;
		}
		
		public function getLandXY():Object
		{
			return landXY;
		}
		public function moveLand(landX:int, landY:int):void
		{
			landXY["x"] = landX;
			landXY["y"] = landY;
			toView("moveLand","",landXY);
		}
		
		private function toView(func:String, window:String, param:Object):void
		{
			dispatchEvent(new GameEvent(func,false,false,window,param));
		}
	}
}