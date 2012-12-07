package ui
{
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	
	public class GameUI extends Sprite
	{
		private var btn1:Button;
		private var btn2:Button;
		private var btn3:Button;
		private var btnContainer:Sprite = new Sprite();
		
		public function GameUI()
		{
			init();
		}
		
		private function init():void
		{
			btnContainer = new Sprite();
			addChild(btnContainer);
			btn1 = new Button("клевер");
			btn2 = new Button("подсолнух");
			btn3 = new Button("картофель");
			for(var i:uint = 0 ; i < 3; i++)
			{
				this["btn"+(i+1)].x = 0;
				this["btn"+(i+1)].y = 10 + 40*i; 
				btnContainer.addChild(this["btn"+(i+1)]);
			}
			btnContainer.visible = false;
		}
		
		public function visibleBtn(_mouseX:int, _mouseY:int, _visible:Boolean):void
		{
			btnContainer.x = _mouseX ;
			btnContainer.y = _mouseY ;
			btnContainer.visible = _visible ;
		}
	}
}