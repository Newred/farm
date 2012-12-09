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
	
	import plant.Plant;

	public class Controller extends Sprite
	{
		private var model:Model;
		private var bMouseDown:Boolean = false;

		private var oldStage:Object = {};

		private var xx:int;

		private var yy:int;

		public function Controller(_model:Model)
		{
			model = _model;
		}
		
		public function init(target:Stage):void
		{
			loadbg();
			createListener(target);
			createPlant();
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

/*==========================================
=============== Mouse control ==============
==========================================*/
		
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
				xx = e.stageX - oldStage.x;
				yy = e.stageY - oldStage.y
				//trace("xx "+xx+" yy"+yy);
				if(xx < 640 - 1565) xx = 640 - 1565;
				if(yy < 480 - 908)  yy = 480 - 908;
				if(xx > 0) xx = 0;
				if(yy > 0) yy = 0;
				model.moveLand(xx,yy);
			}
		}
		
		private function mouseDown(e:MouseEvent):void
		{
			bMouseDown = true;
			oldStage.x = e.localX ;
			oldStage.y = e.localY ;
			//trace("e.stg e.loc mouse "+e.stageX+" "+e.localX+" "+mouseX);
			buttonMode = true;
		}
		
		private function mouseUp(e:MouseEvent):void
		{
			bMouseDown = false;
		}	
		
/*==========================================
=============== end Mouse control ==========
==========================================*/		
		
		private function createPlant():void
		{
			// сделать 1 поле
			model.setPlant(new Plant(100,100));
			// Сделать 9 полей
		}
		
		
		
		
		
		
	}
}