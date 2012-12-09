package mvc
{
	import event.GameEvent;
	
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	
	public class View extends Sprite
	{
		private var model:Model;
		private var controller:Controller;
		private var target:Stage;

		private var container:Sprite;
		
		public function View(_model:Model, _controller:Controller, _target:Stage)
		{
			model 		= _model ;
			controller 	= _controller;
			target 		= _target;
			
			init();
		}
		
		private function init():void
		{
			model.addEventListener("getBG", getBGR);
			model.addEventListener("moveLand", moveLand);
			container = new Sprite();
			target.addChild(container);
			controller.init(target);
		}
		private function getBGR(e:GameEvent):void
		{
			container.addChild(model.getBG());
		}
		
		private function moveLand(e:GameEvent):void
		{
			container.x = e.param["x"];
			container.y = e.param["y"];
		}
	}
}