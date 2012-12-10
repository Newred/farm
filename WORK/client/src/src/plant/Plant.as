package plant
{
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.filters.GlowFilter;
	import flash.net.URLRequest;
	
	public class Plant extends Sprite
	{
		private var x1:int = 0;
		private var y1:int = 0;
		private var x2:int = 100;
		private var y2:int = 54;
		
		private var ID:uint;
		private var image:Bitmap;
		private var level:int = 0;
		private var type:String;
		private var bmContainer:Sprite;
		
		public function Plant(xx:int, yy:int)
		{
			x = xx;
			y = yy;
			drawPlant();
			createListener();
			createImageContainer();
		}
		
		private function drawPlant():void
		{
			graphics.beginFill(0x000000,0.2);
			graphics.lineTo(x2/2, -y2/2);
			graphics.lineTo(x2, 0);
			graphics.lineTo(x2/2, y2/2);
			graphics.lineTo(x1,y1);
			graphics.endFill();
		}
		
		private function createListener():void
		{
			//addEventListener(MouseEvent.MOUSE_OVER, mouseover);
			//addEventListener(MouseEvent.MOUSE_OUT, mouseout);
			//addEventListener(MouseEvent.MOUSE_MOVE, mousemove);
		}
		
		private function createImageContainer():void
		{
			bmContainer = new Sprite();
			addChild(bmContainer);
			bmContainer.mouseEnabled = false;
			bmContainer.mouseChildren = false;
		}
		
		public function mouseover():void{
			filters = [new GlowFilter(0xFFCC44)];
		}
		
		public function mouseout():void{
			filters = null ;
		}
		
		public function setID(id:int):void{
			ID = id;
		}
		
		public function getID():uint{
			return ID;
		}
		
		public function addImage(bm:Bitmap, _type:String):void{

			if(image && image.parent)
				removeImage();
		
			image   = bm ;
			image.y = height - bm.height - 27;
			
			type = _type;
			if(level < 5) level ++;
			bmContainer.addChild(image);
		}
		
		public function removeImage():void{
			while(bmContainer.numChildren){
				bmContainer.removeChildAt(0);
			}
		}
		public function isLevel():Boolean{
			return (level) ? true : false ; 
		}
		public function getLevel():int{
			return level;
		}
		public function getType():String{
			return type;
		}
		public function levelUP(max:int = 5):void{
			if(level < max) level ++;	
		}
		public function clearType():void
		{
			level = 0;
			removeImage();
			image = null;
		}
		
	}
}