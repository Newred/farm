package mvc
{
	import event.GameEvent;
	
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import plant.Plant;
	
	import ui.Button;
	
	//import ui.TypePlant;
	
	public class View extends Sprite
	{
		private var model:Model;
		private var controller:Controller;
		private var target:Stage;

		private var container:Sprite;
		private var uicontainer:Sprite;
		private var btnLevelUp:Button;

		
		public function View(_model:Model, _controller:Controller, _target:Stage)
		{
			model 		= _model ;
			controller 	= _controller;
			target 		= _target;
			
			init();
		}
		
		private function init():void
		{
			createContainers();
			createBtn();
			createListener();
			
			
			controller.init(target); // stage for global mouse 
		}
		
		private function createContainers():void
		{
			container = new Sprite();
			container.name = "background";
			target.addChild(container);
			
			uicontainer = new Sprite();
			target.addChild(uicontainer);
		}
		
		private function createListener():void
		{
			btnLevelUp.addEventListener(MouseEvent.CLICK, levelUpClick);
			model.getTypePlant().addEventListener("choose", choose);
			model.addEventListener("getBG", getBG);
			model.addEventListener("moveLand", moveLand);
			model.addEventListener("addPlant", addPlant);
			model.addEventListener("typePlant", typePlant);
		}
		
		private function createBtn():void
		{
			btnLevelUp = new Button("рост +1");
			btnLevelUp.x = 550;
			btnLevelUp.y = 10;
			uicontainer.addChild(btnLevelUp);
		}
		
		private function getBG(e:GameEvent):void
		{
			container.addChildAt(model.getBG(),0);
		}
		
		private function choose(e:GameEvent):void
		{
			trace("выбрали "+e.window);
			controller.choosePlant(e.window);
		}
		
		private function levelUpClick(e:MouseEvent):void
		{
			controller.levelUP();
		}
		
		private function moveLand(e:GameEvent):void
		{
			container.x = e.param["x"];
			container.y = e.param["y"];
		}
		
		private function addPlant(e:GameEvent):void
		{
			container.addChild(model.getLand());
		}
		
		private function typePlant(e:GameEvent):void
		{
			//container.addChild();
			e.param.type.x = mouseX -40;
			e.param.type.y = mouseY -60;
			uicontainer.addChild(e.param.type);
		}
	}
}