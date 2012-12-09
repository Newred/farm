package mvc
{
	
	import event.GameEvent;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	
	import plant.Plant;
	
	public class Model extends Sprite
	{
		private var bg:Bitmap;
		private var landXY:Object = {};
		private var plantContainer:Sprite = new Sprite();
		private var plantArray:Array = new Array();
		
		public function Model(){
			trace("Model ok");
		}
		
		public function setBG(_bg:Bitmap):void{ 
			bg = _bg ;
			toView("getBG","","");
		}	
		public function getBG():Bitmap{
			return bg;
		}
		public function getLandXY():Object{
			return landXY;
		}
		
		
		public function setPlant(plant:Plant):void{
			
			plantArray.push(plant);
			plantContainer.addChild(plant);
			toView("addPlant","","");
		}
		public function getPlant():Plant{
			return plantArray[length-1];
		}
		
		
		public function moveLand(landX:int, landY:int):void
		{
			landXY["x"] = landX;
			landXY["y"] = landY;
			toView("moveLand","",landXY);
		}
		
		private function toView(func:String, window:String, param:Object):void{
			dispatchEvent(new GameEvent(func,false,false,window,param));
		}
	}
}