package gamecore
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	public class Plantation extends Sprite
	{
		private var  bFreePlant:Boolean = false;
		private var lastItem:Plant;
		private var WIDTH:int = 98;
		private var HEIGHT:int = 54;

		private var xx:int;

		private var yy:int;
		public function Plantation()
		{
			super();
		}
		
		public function addBG(bg:Bitmap):void
		{
			addChild(bg);
		}
		
		public function addPlant(plant:Plant):void
		{
			addChild(plant);
			lastItem = plant;
			lastItem.mouseEnabled = false;
			bFreePlant = true;
		}
		
		public function mousemove():void
		{
			var XXX:int = 120;
			var YYY:int = 406;
			
			/*if(bFreePlant)
			{
				lastItem.x = mouseX + parent.x;
				lastItem.y = mouseY + parent.y;
			}*/
			
			
			if(bFreePlant)
			{
				xx = mouseX + parent.x ;
				yy = mouseY + parent.y ;
				
				lastItem.x = int(xx/WIDTH) * WIDTH;
				lastItem.y = int(yy/HEIGHT) * HEIGHT;
				xx = xx%WIDTH;
				yy = yy%HEIGHT;
				
				if(xx < 28 && yy < 9)
				{
					lastItem.x -= WIDTH/2;
					lastItem.y -= HEIGHT/2;
				}
				if(xx > 74 && yy > 37) 
				{
					lastItem.x += WIDTH/2;
					lastItem.y += HEIGHT/2;
				}
				
				if(xx < 28 && yy > 37)
				{
					lastItem.x -= WIDTH/2;
					lastItem.y += HEIGHT/2;
				}
				if(xx > 74 && yy < 28) 
				{
					lastItem.x += WIDTH/2;
					lastItem.y -= HEIGHT/2;
				}
			}
			// вычесть  размеры 60*60 ячейки
		}
		
		public function hasFreePlant():Boolean
		{
			return bFreePlant;
		}
		
		public function setFree():void
		{
			bFreePlant = false;
			lastItem = null;
		}
	}
}