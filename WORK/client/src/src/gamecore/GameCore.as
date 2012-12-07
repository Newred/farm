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
		private var container:Sprite = new Sprite();
		private var bMousePress:Boolean;

		private var bLessX:int;
		private var bLessY:int;
		
		private var oldX:int;
		private var oldY:int;
		
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
			//addEventListener(MouseEvent.CLICK, mouseclick);
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
		
		protected function mouseup(e:MouseEvent):void
		{
			bMousePress = false;
			trace("mouseup");
			
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
			bLessX = mouseX - container.x;
			bLessY = mouseY - container.y;
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