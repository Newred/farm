package mvc
{
	import event.GameEvent;
	
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	public class View extends Sprite
	{
		private var model:Model;
		private var controller:Controller;
		private var target:Stage;
		
		private var uicontainer:Sprite = new Sprite();
		private var maincontainer:Sprite = new Sprite();
		private var earthcontainer:Sprite = new Sprite();

		private var tf:TextField;
		
		public function View(_model:Model, _controller:Controller, _target:Stage)
		{
			model 		= _model ;
			controller 	= _controller;
			target 		= _target;
			
			
			createUI();
			
			model.addEventListener(Model.MEVENT, modelGameEvent);
			controller.fromView("run","");
			
		}
		
		public function createUI():void
		{
			maincontainer.addChild(earthcontainer);
			target.addChild(maincontainer);
			target.addChild(uicontainer);
			
			tf = new TextField();
			tf.autoSize = "left" ;
			tf.text = "text3";
			_trace("****");

			uicontainer.addChild(tf);
		}
		
		private function modelGameEvent(e:GameEvent):void
		{
			_trace("mge");
			if(e.window == "loadBG")
			{
				earthcontainer.addChildAt(model.getChildAt(0),0);
				_trace("bg");
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