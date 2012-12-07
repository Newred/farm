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
			tf.selectable = false;
			tf.mouseEnabled = false;
			tf.y = 5; 
			tf.width = 100; // fix 
			tf.height = 20; // fix 
			init();
		}
		
		private function init():void
		{
			createFrame();
			createListener();
			buttonMode = true ;
		}
		
		private function createListener():void
		{
			addEventListener(MouseEvent.MOUSE_OVER, mouseover);
			addEventListener(MouseEvent.MOUSE_OUT, mouseout);
			addEventListener(MouseEvent.MOUSE_DOWN, mousedown);
		}
		
	
		private function createFrame():void
		{
			sp1 = new Shape();// st
			createBtnState(sp1, 0x112211, 0xCCCCCC);
			sp2 = new Shape();// over
			createBtnState(sp2, 0x112211, 0xDDEEDD, 0xFFFFFF);
			sp3 = new Shape();// down
			createBtnState(sp3, 0x112211, 0xAABBAA);
		
			sp2.visible = false;
			sp3.visible = false;
			addChild(tf);
		}
		
		private function createBtnState(sp:Shape, colorBG:int, color:int, filtercolor:int = 0):void
		{
			sp.graphics.beginFill(color,1);
			sp.graphics.drawRect(-2,-2,84,34);
			sp.graphics.beginFill(colorBG,0.6);
			sp.graphics.drawRect(0,0,80,30);
			sp.graphics.beginFill(color,0.6);
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