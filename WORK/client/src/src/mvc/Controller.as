package mvc
{
	import event.GameEvent;
	
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;

	public class Controller extends Sprite
	{
		private var model:Model;
		private var bMouseDown:Boolean = false;

		private var oldStage:Object = {};

		public function Controller(_model:Model)
		{
			model = _model;
		}
		
		public function init(target:Stage):void
		{
			loadbg();
			createListener(target);
		}
		
		private function loadbg():void
		{
			var loader:Loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, bgComplite);
			loader.load(new URLRequest("lib/BG.jpg"));
		}
		private function bgComplite(e:Event):void
		{
			e.target.loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, bgComplite);
			model.setBG(e.target.content as Bitmap);
		}
		
		private function createListener(target:Stage):void
		{
			target.addEventListener(MouseEvent.MOUSE_MOVE, mouseMove);
			target.addEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
			target.addEventListener(MouseEvent.MOUSE_UP, mouseUp);
		}
		
		private function mouseMove(e:MouseEvent):void
		{
			if(bMouseDown)
			{
				// дать координату нажатия
				model.moveLand(e.stageX - oldStage.x, e.stageY - oldStage.y);
			}
		}
		
		private function mouseDown(e:MouseEvent):void
		{
			bMouseDown = true;
			oldStage.x = e.localX ;
			oldStage.y = e.localY ;
			//trace("e.stg e.loc mouse "+e.stageX+" "+e.localX+" "+mouseX);
		}
		
		private function mouseUp(e:MouseEvent):void
		{
			bMouseDown = false;
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
	}
}