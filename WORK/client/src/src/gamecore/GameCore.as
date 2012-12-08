package gamecore
{
	import event.GameEvent;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class GameCore extends Sprite
	{
		public static const PLANT:String = "plant";
		private var WIDTH:int = 640;
		private var HEIGHT:int = 480;
		private var plantscore:Plantation = new Plantation();
		private var bMousePress:Boolean;

		private var bLessX:int;
		private var bLessY:int;
		
		private var oldX:int;
		private var oldY:int;
		
		public function GameCore()
		{
			init();
		}
		
		public function add(sp:Plantation):void
		{
			plantscore = sp ;
			addChild(plantscore);
		}
		
		private function init():void
		{
			createListener();
			addChild(plantscore);
		}
		
		private function createListener():void
		{
			addEventListener(MouseEvent.MOUSE_DOWN, mousedown);
			addEventListener(MouseEvent.MOUSE_UP, mouseup);
			addEventListener(MouseEvent.MOUSE_MOVE, mousemove);
			addEventListener(MouseEvent.MOUSE_OUT, mouseout);
			//addEventListener(MouseEvent.CLICK, mouseclick);
		}	
		
		protected function mousemove(e:MouseEvent):void
		{
			if(bMousePress)
			{
				plantscore.x = mouseX - bLessX;
				plantscore.y = mouseY - bLessY;
				if(plantscore.x > 0) plantscore.x = 0 ;
				if(plantscore.y > 0) plantscore.y = 0 ;
				if(plantscore.x < WIDTH-plantscore.width) plantscore.x = WIDTH - plantscore.width;
				if(plantscore.y < HEIGHT-plantscore.height) plantscore.y = HEIGHT - plantscore.height;
			}
			if(plantscore.hasFreePlant())
			{
				plantscore.mousemove();
			}
		}
		protected function mouseout(e:MouseEvent):void
		{
			bMousePress = false;
		}
		protected function mouseup(e:MouseEvent):void
		{
			bMousePress = false;
			if( oldX == mouseX &&
				oldY == mouseY )
			{
				// обработать как клик.
				dispatchView();
			}
				
		}
		
		protected function mousedown(e:MouseEvent):void
		{
			bMousePress = true;
			bLessX = mouseX - plantscore.x;
			bLessY = mouseY - plantscore.y;
			oldX = mouseX;
			oldY = mouseY;
		}

		protected function mouseclick(e:MouseEvent):void
		{
			trace("mouseclick");
		}		
		
		private function dispatchView():void
		{
			dispatchEvent(new GameEvent(PLANT));
		}
	}
}