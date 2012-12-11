package ui
{
	import flash.display.MovieClip;
	import flash.display.Shader;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.filters.BlurFilter;
	import flash.filters.GlowFilter;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	public class Button extends MovieClip
	{

		private var sp1:Shape;
		private var sp2:Shape;
		private var sp3:Shape;
		private var tf:TextField;
		
		public function Button(label:String = "label")
		{
			tf = new TextField();
			tf.text = label;
			var tfr:TextFormat = new TextFormat(null,null,null,null,null,null,null,null,"center"); 

			tf.setTextFormat(tfr);
			tf.selectable = false;
			tf.mouseEnabled = false;
			tf.y = 5; 
			tf.width = 84; // fix 
			tf.height = 20; // fix 
			init();
		}
		
		public function enableBtn(bool:Boolean):void
		{
			if(bool){
				createListener();
				alpha = 1;
			}else{
				removeListener();
				alpha = 0.5;
			}
		}
		
		private function init():void
		{
			createFrame();
			createListener();
			
		}
		
		private function createListener():void
		{
			buttonMode = true ;
			addEventListener(MouseEvent.MOUSE_OVER, mouseover);
			addEventListener(MouseEvent.MOUSE_OUT, mouseout);
			addEventListener(MouseEvent.MOUSE_DOWN, mousedown);
			addEventListener(MouseEvent.MOUSE_UP, mouseout);
		}
		private function removeListener():void
		{
			buttonMode = false;
			removeEventListener(MouseEvent.MOUSE_OVER, mouseover);
			removeEventListener(MouseEvent.MOUSE_OUT, mouseout);
			removeEventListener(MouseEvent.MOUSE_DOWN, mousedown);
			removeEventListener(MouseEvent.MOUSE_UP, mouseout);
		}
		
	
		private function createFrame():void
		{
			sp1 = new Shape();// st
			createBtnState(sp1, 0x007700, 0xCCCCCC);
			sp2 = new Shape();// over
			createBtnState(sp2, 0xEE9900, 0xDDEEDD, 0xFFFFFF);
			sp3 = new Shape();// down
			createBtnState(sp3, 0x557700, 0xAABBAA);
		
			sp2.visible = false;
			sp3.visible = false;
			addChild(tf);
		}
		
		private function createBtnState(sp:Shape, colorBG:int, color:int, filtercolor:int = 0):void
		{
			sp.graphics.beginFill(color,1);
			sp.graphics.drawRect(-2,-2,84,34);
		
			sp.graphics.beginFill(colorBG,1);
			sp.graphics.drawRect(0,0,80,30);
			
			sp.graphics.beginFill(color,1);
			sp.graphics.drawRect(2,2,76,26);
			
			sp.graphics.endFill();
			addChild(sp);
			/*if(filtercolor != 0)
				sp.filters = [new GlowFilter(filtercolor)];*/
		}
		
		protected function mousedown(event:MouseEvent):void
		{
			if(sp1.visible) sp1.visible = false;
			if(sp2.visible) sp2.visible = false;
			if(!sp3.visible) sp3.visible = true;
		}
		
		protected function mouseout(event:MouseEvent):void
		{
			if(!sp1.visible) sp1.visible = true;
			if(sp2.visible) sp2.visible = false;
			if(sp3.visible) sp3.visible = false;
		}
		
		protected function mouseover(event:MouseEvent):void
		{
			if(sp1.visible) sp1.visible = false;
			if(!sp2.visible) sp2.visible = true;
			if(sp3.visible) sp3.visible = false;
		}
		
	}
}