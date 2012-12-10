package ui
{
	public class ButtonClear extends Button
	{
		public function ButtonClear(label:String="label")
		{
			super(label);
		}
		
		public function remove():void
		{
			this.parent.removeChild(this);
		}
	}
}