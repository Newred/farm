package gamecore
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	
	import flashx.textLayout.elements.ParagraphElement;
	
	public class PlantsAll extends Sprite
	{
		private var  bFreePlant:Boolean = false;
		private var lastItem:Plant
		public function PlantsAll()
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
			bFreePlant = true;
		}
		
		public function mousemove(mousex:int, mousey:int):void
		{
			if(bFreePlant)
			{
				lastItem.x = mousex;
				lastItem.y = mousey;
			}
			// вычесть  размеры 60*60 ячейки
		}
		
		public function hasFreePlant():Boolean
		{
			return bFreePlant;
		}
	}
}