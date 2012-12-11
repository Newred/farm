package mvc
{
	import connection.Connection;
	
	import event.GameEvent;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	
	import plant.Plant;
	
	import ui.TypePlant;

	public class Controller extends Sprite
	{
		private var model:Model;
		private var bMouseDown:Boolean = false;

		private var oldStage:Object = {}; // magic temp object
		private var xx:int; //разница между положением бекграунад и нажатием мышки
		private var yy:int;
		private var lastPressed:int = 0;
		private var lastType:String = "";
		private var lastLevel:int = 1;

		private var conToServer:Connection;
		private var security:Boolean = false;
		
		public function Controller(_model:Model)
		{
			model = _model;
		}
		
		public function init(target:Stage):void
		{
			loadbg();
			createListener(target);
			createPlant();
			//createConnection();
		}
		
		public function choosePlant( _type:String, _id:String=""):void
		{
			// проверить или изображение есть в библиотеке.
			var obj:Object = model.getPictures();

			if(_id == ""){
				_id = lastPressed.toString();
				oldStage[_id] = new Array(_type, lastLevel);
				
			}
			
			if( obj[oldStage[_id][0]+"/"+oldStage[_id][1]] != obj["undefined"])
			{
				trace("choosePlant: Изображения есть");
				var bd:BitmapData = obj[oldStage[_id][0]+"/"+oldStage[_id][1]].bitmapData.clone();
				var bm:Bitmap = new Bitmap(bd);
				model.addImagePlant(bm, int(_id), oldStage[_id][0]);
			}else{
				trace("choosePlant: Изображения нет");
				lastType = _type;
				lastLevel = 1;
				loadPic(lastPressed.toString(),lastType);
			}
		}
		
		/*public function loadedPlant(id:String):void
		{
			//model.addImagePlant("bm", id);
		}*/
		
		public function levelUP():void
		{
			trace("level up");
			var arr:Array = model.getLandArray(); // получить список полей.
			var types:String;
			var levels:int;
			
			for(var i:int = 0 ; i< arr.length; i++){
				
				if(arr[i].getLevel() > 0 && arr[i].getLevel() < 5){

					var obj:Object 	= model.getPictures();
					
					types 			= arr[i].getType();
					levels 			= arr[i].getLevel();
					
					trace(i+" types "+types+"/level+1 "+(levels+1));
					
					if(obj[types+"/"+(levels+1)]){
					// загрузить картинку с хранилища.
						var bd:BitmapData = obj[types+"/"+(levels+1)].bitmapData.clone();
						var bm:Bitmap = new Bitmap(bd);
						
						model.addImagePlant(bm, int(i), types);
					
					}else{
						oldStage[i] = new Array(types,(levels+1));
						loadPic(i.toString(), oldStage[i][0], oldStage[i][1]);
					}
					
				}
			}
		}

		
		public function clearPlant():void
		{
			trace("удаление ");
			model.getLandArray()[lastPressed].clearType();
		}
		
		public function fromServer(data:String):void
		{
			//toDisplay("C: fromserver "+data);
			
			if(data == "hello"){
				toServer("info");
			}else{
				toDisplay(data);
				var xml:XML = XML(data);
				//toDisplay(xml);
				toDisplay("999");
			}
				
		}
		
		private function toDisplay(data:String):void{
			model.setText(data);
		}
		
		private function toServer(data:String):void
		{
			conToServer.toServer(data);
		}
		
		
		public function createConnection():void
		{
			if(conToServer) conToServer = null;
			conToServer = new Connection(fromServer);
		}
		
		
		private function loadbg():void
		{
			var context:LoaderContext = new LoaderContext();
			//context.applicationDomain = ApplicationDomain.currentDomain;
			context.checkPolicyFile = true; 
			
			var loader:Loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, bgComplete);
			loader.load(new URLRequest("lib/BG.jpg"),context);
		}
		private function bgComplete(e:Event):void
		{
			e.target.loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, bgComplete);
			model.setBG(e.target.content as Bitmap);
		}

/*==========================================
=============== Mouse control ==============
==========================================*/
		
		private function createListener(target:Stage):void
		{
			target.addEventListener(MouseEvent.MOUSE_MOVE, mouseMove);
			target.addEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
			target.addEventListener(MouseEvent.MOUSE_UP, mouseUp);
			target.addEventListener(MouseEvent.MOUSE_OVER, mouseover);
			target.addEventListener(MouseEvent.MOUSE_OUT, mouseout);
		}
		
		private function mouseMove(e:MouseEvent):void
		{
			if(bMouseDown && e.target.name == "background")
			{
				// дать координату нажатия
				xx = e.stageX - oldStage.x;
				yy = e.stageY - oldStage.y
				//trace("xx "+xx+" yy"+yy);
				if(xx < 640 - 1565) xx = 640 - 1565;
				if(yy < 480 - 908)  yy = 480 - 908;
				if(xx > 0) xx = 0;
				if(yy > 0) yy = 0;
				model.moveLand(xx,yy);
			}
		}
		
		private function mouseDown(e:MouseEvent):void
		{
			if( e.target.name != "background") return;
			
			bMouseDown = true;
			oldStage.x = e.localX ;
			oldStage.y = e.localY ;
		}
		
		private function mouseUp(e:MouseEvent):void
		{
			bMouseDown = false;
			
			if( e.target.toString() == "[object Plant]" ){
				if(!e.target.isLevel()){
				lastPressed = e.target.getID();
				model.viewTypePlant();// задать выбор растения
				}else{
					trace(e.target.getLevel());
					if(e.target.getLevel() == 5){
						lastPressed = e.target.getID();
						model.addCleaner();
					}
				}
			}else if( e.target.toString() == "[object ButtonClear]"){
				
				//lastPressed = e.target.getID();
				clearPlant();
				model.getClearBtn().remove();
				
				}else{
				trace("else");
				if(model.getTypePlant().parent)
					model.getTypePlant().remove();
				
				if(model.getClearBtn().parent)
					model.getClearBtn().remove();
				
			}
		}	
		
		private function mouseover(e:MouseEvent):void{
			if(e.target.toString() == "[object Plant]"){
				e.target.mouseover();
			}
		}
		
		private function mouseout(e:MouseEvent):void{
			if(e.target.toString() == "[object Plant]"){
				e.target.mouseout();
			}
		}
		
/*==========================================
=============== end Mouse control ==========
==========================================*/		
		
		private function createPlant():void
		{
			var zeroX:int = 239; // +57 // +57
			var zeroY:int = 372; // -30 // +30
			
			for(var i:uint = 0 ; i < 9; i++)
			{
				var X:int = (zeroX + i * -57) + (Math.floor(i/3)*228);
				var Y:int = (zeroY + i * 30) - (Math.floor(i/3)*60);
				var pl:Plant = new Plant(X,Y);
				pl.setID(i);
				model.setLand(pl);
			}
		}
		
		private function loadPic(_ind:String, _type:String, level:int = 1):void
		{
			var context:LoaderContext = new LoaderContext();
			//context.applicationDomain = ApplicationDomain.currentDomain;
			context.checkPolicyFile = true; 
			
			var loader:Loader = new Loader();
			loader.name = _ind;
			oldStage[_ind] = new Array(_type, level);
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, pictComplete);
			loader.contentLoaderInfo.addEventListener(ErrorEvent.ERROR, pictError);
			loader.load(new URLRequest("lib/"+_type+"/"+level+".png"),context);
		}
		private function pictComplete(e:Event):void
		{
			e.target.loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, pictComplete);
			var _id:String = e.target.loader.name;
			model.setPicture(e.target.content as Bitmap, oldStage[_id][0], oldStage[_id][1]);
			choosePlant(oldStage[_id][0], _id);
		}
		
		private function pictError(e:ErrorEvent):void
		{
			trace("неправильный урл адрес картинки");
		}
	}
}