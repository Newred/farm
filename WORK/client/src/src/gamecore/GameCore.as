package gamecore
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class GameCore extends Sprite
	{
		
		private var WIDTH:int = 640;
		private var HEIGHT:int = 480;
		private var container:Sprite = new Sprite();
		private var bMousePress:Boolean;

		private var bLessX:int;
		private var bLessY:int;
		
		public function GameCore()
		{
			init();
		}
		
		public function add(sp:Sprite):void
		{
			container.addChild(sp);	
		}
		
		private function init():void
		{
			createListener();
			addChild(container);
		}
		
		private function createListener():void
		{
			addEventListener(MouseEvent.MOUSE_DOWN, mousedown);
			addEventListener(MouseEvent.MOUSE_UP, mouseup);
			addEventListener(MouseEvent.MOUSE_MOVE, mousemove);
			addEventListener(MouseEvent.MOUSE_OUT, mouseup);
		}	
		
		
		protected function mousemove(e:MouseEvent):void
		{
			if(bMousePress)
			{
				container.x = mouseX - bLessX;
				container.y = mouseY - bLessY;
				if(container.x > 0) container.x = 0 ;
				if(container.y > 0) container.y = 0 ;
				if(container.x < WIDTH-container.width) container.x = WIDTH - container.width;
				if(container.y < HEIGHT-container.height) container.y = HEIGHT - container.height;
			}
		}
		
		protected function mouseup(event:MouseEvent):void
		{
			bMousePress = false;
		}
		
		protected function mousedown(event:MouseEvent):void
		{
			bMousePress = true;
			bLessX = mouseX - container.x;
			bLessY = mouseY - container.y;
		}

		/*protected function mouseout(event:MouseEvent):void
		{
			bMousePress = false;
		}*/	
	}
}