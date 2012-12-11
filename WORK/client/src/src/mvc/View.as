package mvc
{
	import event.GameEvent;
	
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
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
		private var btnConnect:Button;
		private var tf:TextField;

		
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
			btnLevelUp.addEventListener(MouseEvent.CLICK, btnLevelUpClick);
			btnConnect.addEventListener(MouseEvent.CLICK, btnConnectClick);
			model.getTypePlant().addEventListener("choose", choose);
			model.addEventListener("getBG", getBG);
			model.addEventListener("moveLand", moveLand);
			model.addEventListener("addPlant", addPlant);
			model.addEventListener("typePlant", typePlant);
			model.addEventListener("addClearPlant", addClearPlant);
			model.addEventListener("setText", setText);
		}
		
		private function createBtn():void
		{
			btnLevelUp = new Button("рост +1");
			btnLevelUp.x = 550;
			btnLevelUp.y = 10;
			uicontainer.addChild(btnLevelUp);
			
			btnConnect = new Button("подключение");
			btnConnect.x = 450;
			btnConnect.y = 10;
			uicontainer.addChild(btnConnect);
			
			tf = new TextField();
			tf.x = 10;
			tf.y = 10;
			tf.width = 250;
			tf.height = 200;
			uicontainer.addChild(tf);
			tf.text = "init";
			tf.background = true;
			tf.selectable = false;
			tf.mouseWheelEnabled = true;
			tf.alpha = 0.8;
			tf.wordWrap = true;
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
		
		private function btnLevelUpClick(e:MouseEvent):void
		{
			controller.levelUP();
		}
		
		private function btnConnectClick(e:MouseEvent):void
		{
			controller.createConnection();
			btnConnect.enableBtn(false);
			btnConnect.removeEventListener(MouseEvent.CLICK, btnConnectClick);
			
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
		
		private function addClearPlant(e:GameEvent):void
		{
			e.param.btn.x = mouseX;
			e.param.btn.y = mouseY;
			uicontainer.addChild(e.param.btn);
		}
		
		private function setText(e:GameEvent):void
		{
			tf.appendText("\n"+e.window);
		}
	}
}