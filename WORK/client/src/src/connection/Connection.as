package connection
{
	import flash.display.Sprite;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.Socket;

	public class Connection extends Sprite
	{
		private var toController:Function;
		private var socket:Socket;
		
		public function Connection(func:Function)
		{
			toController = func;
			//toController("вижу");
			createListener();
		}
		
		public function createListener():void
		{
			socket = new Socket("localhost",9876);
			socket.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityError);
			socket.addEventListener(ProgressEvent.SOCKET_DATA, socketdata);
			
		}
		
		protected function socketdata(e:ProgressEvent):void
		{
			trace("socketdata");
		}
		
		protected function securityError(e:SecurityErrorEvent):void
		{
			trace("securityError");
		}
	}
}