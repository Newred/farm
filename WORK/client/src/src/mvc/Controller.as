package mvc
{
	public class Controller
	{
		private var model:Model = new Model();
		public function Controller(_model:Model)
		{
			model = _model;
		}
		
		public function fromView(key:String, value:String):void
		{
			switch(key)
			{
				case "run":
					initApp();// запустить приложение.
					break;
			}
		}
		
		private function initApp():void
		{
			// создать соединение.
			// установить текстовое поле на верхний слой
			// установить bg
		}
	}
}