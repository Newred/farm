package plant
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.filters.GlowFilter;
	
	public class Plant extends Sprite
	{
		private var x1:int = 0;
		private var y1:int = 0;
		private var x2:int = 98;
		private var y2:int = 54;
		public function Plant(xx:int, yy:int)
		{
			x = xx;
			y = yy;
			drawPlant();
			createListener();
		}
		
		private function drawPlant():void
		{
			graphics.beginFill(0xFFFFFF,1);
			graphics.lineTo(x2/2, -y2/2);
			graphics.lineTo(x2, 0);
			graphics.lineTo(x2/2, y2/2);
			graphics.lineTo(x1,y1);
			graphics.endFill();
		}
		
		private function createListener():void
		{
			addEventListener(MouseEvent.MOUSE_OVER, mouseover);
			addEventListener(MouseEvent.MOUSE_OUT, mouseout);
		}
		
		private function mouseover(e:MouseEvent):void
		{
			filters = [new GlowFilter(0xFFFFFF)];
		}
		
		private function mouseout(e:MouseEvent):void
		{
			filters = null ;
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
	}
}