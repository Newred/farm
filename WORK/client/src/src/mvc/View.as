package mvc
{
	import event.GameEvent;
	
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	import gamecore.GameCore;
	import gamecore.Plant;
	import gamecore.Plantation;
	
	import ui.GameUI;
	
	public class View extends Sprite
	{
		private var model:Model;
		private var controller:Controller;
		private var target:Stage;
		
		private var uicontainer:GameUI 			= new GameUI();
		private var maincontainer:GameCore 		= new GameCore();
		private var plantation:Plantation 		= new Plantation();

		private var tf:TextField;
		
		public function View(_model:Model, _controller:Controller, _target:Stage)
		{
			model 		= _model ;
			controller 	= _controller;
			target 		= _target;
			
			createUI();
			createListener();
			
			controller.fromView("run","");
		}
		
		public function createUI():void
		{
			maincontainer.add(plantation);
			target.addChild(maincontainer);
			target.addChild(uicontainer);
			uicontainer.mouseEnabled = false;
			tf 	= new TextField();
			tf.autoSize = "left" ;
			tf.text 	= "text3";
			_trace("****");

			target.addChild(tf);
		}
		
		private function createListener():void
		{
			model.addEventListener(Model.MEVENT, modelGameEvent);
			maincontainer.addEventListener(GameCore.PLANT, needPlant);
			uicontainer.addEventListener(GameUI.TYPEPLANT, selectedPlant);
		}
		
		private function needPlant(e:GameEvent):void
		{
		//	trace("добавить плант");
			if(!plantation.hasFreePlant())
				uicontainer.visibleBtn(mouseX, mouseY);
			else plantation.setFree();
		}
		
		private function selectedPlant(e:GameEvent):void
		{
			uicontainer.visibleBtn(mouseX, mouseY); // visible false;
			// загрузить картинку.
			controller.fromView("loadPicture", e.param);
			// привязать её к мышке.
			
			// положить при клике в GameCore
		}
		
		private function modelGameEvent(e:GameEvent):void
		{
			_trace("mge");
			if(e.window == "loadBG")
			{
				plantation.addChild(model.getChildAt(0));
				_trace("bg");
			}
			if(e.window == "loadPlant")
			{	
				_trace("loadPlant "+model.getChildAt(0));
				model.getChildAt(0).x = mouseX;
				model.getChildAt(0).y = mouseY;
				plantation.addPlant(model.getChildAt(0) as Plant);	
			}
		}
		
		private function _trace(str:String):void
		{
			tf.appendText("\n"+str.toString());
			if(tf.length > 80)
				tf.text = tf.text.substr(50);
		}
		
	}
}