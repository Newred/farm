package ui
{
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	
	public class GameUI extends Sprite
	{

		private var btn1:Button;
		private var btn2:Button;
		private var btn3:Button;
		
		public function GameUI()
		{
			init();
		}
		
		private function init():void
		{
			btn1 = new Button("клевер");
			btn2 = new Button("подсолнух");
			btn3 = new Button("картофель");
			for(var i:uint = 0 ; i < 3; i++)
			{
				this["btn"+(i+1)].x = 160 + i*110 ;
				this["btn"+(i+1)].y = 420; 
				addChild(this["btn"+(i+1)]);
			}
		}
	}
}