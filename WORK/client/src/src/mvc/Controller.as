package mvc
{
	import event.GameEvent;
	
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLRequest;

	public class Controller
	{
		private var model:Model = new Model();

		public function Controller(_model:Model)
		{
			model = _model;
		}
		
		public function fromView(key:String, value:String):void
		{
			switch(key)
			{
				case "run":
					initApp();// запустить приложение.
					break;
			}
		}
		private function initApp():void
		{
			var loaderGB:Loader = new Loader();
			loaderGB.contentLoaderInfo.addEventListener(Event.COMPLETE, takeimage);
			loaderGB.load(new URLRequest("lib/BG.jpg"));
		}
		private function takeimage(e:Event):void
		{
			e.target.loader.removeEventListener(Event.COMPLETE, takeimage);
			model.setBG(e.target.content as Bitmap);
		}
	
	}
}