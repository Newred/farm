package
{
	import flash.display.Sprite;
	import flash.display.Stage;
	
	import mvc.Controller;
	import mvc.Model;
	import mvc.View;
	
	[SWF(width="640",height="480",frameRate="60",backgroundColor="#85E9F3")]
	public class FarmVille extends Sprite
	{
		public function FarmVille()
		{
			var model:Model = new Model();
			var controller:Controller = new Controller(model);
			var view:View = new View(model, controller, stage);
		}
	}
}