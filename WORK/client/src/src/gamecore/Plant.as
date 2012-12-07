package gamecore
{
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLRequest;
	
	public class Plant extends Sprite
	{
		private var bm:Bitmap;
		private var type:String;
		private var level:int = 1;
		private var unixtime:Number;
		
		public function Plant(_type:String)
		{
			type = _type ;
			init();
		}
		
		public function levelup():void
		{
			if(level<5) 
			{
				level ++ ;
				loadPicture();
			}
		}
		
		private function init():void
		{
			loadPicture();
			createData();
		}
		
		private function loadPicture():void
		{
			var loaderPic:Loader = new Loader();
			loaderPic.contentLoaderInfo.addEventListener(Event.COMPLETE, takeImage);
			//trace("lib/"+type+"/"+level+".png");
			loaderPic.load(new URLRequest("lib/"+type+"/"+level+".png"));
		}
		
		private function takeImage(e:Event):void
		{
			e.target.loader.removeEventListener(Event.COMPLETE, takeImage);
			bm = e.target.content as Bitmap;
			addChild(bm);
		}
		
		private function createData():void
		{
			var data:Date = new Date();
			unixtime = data.time ;
		}
	}
}