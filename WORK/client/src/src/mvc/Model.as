package mvc
{
	
	import event.GameEvent;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	
	import plant.Plant;
	
	import ui.Button;
	import ui.ButtonClear;
	import ui.TypePlant;
	
	public class Model extends Sprite
	{
		private var bg:Bitmap;
		private var landXY:Object = {};
		private var landContainer:Sprite = new Sprite();
		private var landArray:Array = new Array();
		private var type:TypePlant = new TypePlant(); // всплывающее окно выбора нового растения
		private var btnClear:ButtonClear = new ButtonClear("собрать");
		private var oPicture:Object = new Object(); 
		
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
		public function setPicture(bm:Bitmap, typeP:String, levelP:int):void
		{
			trace("запись в кеш: type/level "+typeP+"/"+levelP);
			 oPicture[typeP+"/"+levelP] = bm;
		}
		public function getPictures():Object{
			return oPicture;
		}
		
		
		public function getLandXY():Object{
			return landXY;
		}
		
		
		public function setLand(plant:Plant):void{	
			landArray.push(plant);
			landContainer.addChild(plant);
			toView("addPlant","","");
		}
		public function getLand():Plant{
			return landArray[landArray.length-1];
		}
		public function getLandArray():Array{
			return landArray;
		}
	
		public function moveLand(landX:int, landY:int):void{
			landXY["x"] = landX;
			landXY["y"] = landY;
			toView("moveLand","",landXY);
		}
		
		public function setButtonMode(bool:Boolean):void{
			buttonMode = bool;
			toView("buttonMode","","");
		}
		public function getButtonMode():Boolean{
			return buttonMode ;
		}
		
		public function viewTypePlant():void{
			//addChildAt(tp,0);
			toView("typePlant","",{"type":type});
		}
		public function getTypePlant():TypePlant{
			return type ;
		}
		public function addImagePlant(_bm:Bitmap, ind:int, _type:String, _level:int):void{
			landArray[ind].addImage(_bm, _type, _level);
		}
		public function addCleaner():void{
			toView("addClearPlant","",{"btn":btnClear});
		}
		public function getClearBtn():ButtonClear{
			return btnClear;
		}
		
		public function setText(data:String):void
		{
			toView("setText",data,"");
		}
		
		
		
		
		
		
		
		private function toView(func:String, window:String, param:Object):void{
			dispatchEvent(new GameEvent(func,false,false,window,param));
		}
	}
}