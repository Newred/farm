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
		
		public function Plant(xx:int, yy:int)
		{
			x = xx;
			y = yy;
			drawPlant();
			createListener();
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
			addEventListener(MouseEvent.MOUSE_OVER, mouseover);
			addEventListener(MouseEvent.MOUSE_OUT, mouseout);
		}
		
		private function mouseover(e:MouseEvent):void{
			filters = [new GlowFilter(0xFFCC44)];
		}
		
		private function mouseout(e:MouseEvent):void{
			filters = null ;
		}
		
		public function setID(id:int):void{
			ID = id;
		}
		
		public function getID():uint{
			return ID;
		}
		
		public function addImage(bm:Bitmap, _type:String):void{
			trace(this.width);
			trace(this.height);
			
			trace(bm.width);
			trace(bm.height);
			
			if(image && image.parent)
				removeChild(image);
			
			image   = bm ;
			image.y = -27;
			
			type = _type;
			level = 1;
			addChild(image);
		}
		public function removeImage():void{
			removeChild(image);
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
		public function LevelUP(max:int):void{
			if(level < max) level ++;	
		}
		
	}
}