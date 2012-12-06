package mvc
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.text.TextField;
	
	public class View extends Sprite
	{
		private var model:Model;
		private var controller:Controller;
		private var target:Stage;
		
		private var uicontainer:Sprite = new Sprite();
		private var gamecontainer:Sprite = new Sprite();
		
		public function View(_model:Model, _controller:Controller, _target:Stage)
		{
			model 		= _model ;
			controller 	= _controller;
			target 		= _target;
			// создать UI окно.
			// создать окно поля.
			controller.fromView("run","");
		}
		
		public function createTf():void
		{
			var tf:TextField = new TextField();
		}
	}
}