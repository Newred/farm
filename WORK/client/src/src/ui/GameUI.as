package ui
{
	import event.GameEvent;
	
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	public class GameUI extends Sprite
	{
		public static const TYPEPLANT:String = "typeplant";
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
			btn1.name = "clover"; // id
			btn2.name = "sunflower"; 
			btn3.name = "potato"; 

			for(var i:uint = 0 ; i < 3; i++)
			{
				this["btn"+(i+1)].x = 0;
				this["btn"+(i+1)].y = 10 + 40*i; 
				btnContainer.addChild(this["btn"+(i+1)]);
			}
			btnContainer.addEventListener(MouseEvent.CLICK, btnclick);
			btnContainer.visible = false;
		}
		
		private function btnclick(e:MouseEvent):void
		{
			dispatchView(e.target.name);
		}
		
		public function visibleBtn(_mouseX:int, _mouseY:int):void
		{
			btnContainer.x = _mouseX -40 ;
			btnContainer.y = _mouseY -60;
			btnContainer.visible = !btnContainer.visible ;
		}
		
		private function dispatchView(id:String):void
		{
			dispatchEvent(new GameEvent(TYPEPLANT,false,false,"GameUI",id));
		}
	}
}