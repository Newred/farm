package connection
{
	import flash.display.Sprite;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.Socket;

	public class Connection extends Sprite
	{
		private var toController:Function;
		private var socket:Socket;
		
		public function Connection(outData:Function)
		{
			toController = outData;
			createListener();
		}
		
		public function toServer(data:String):void
		{
			socket.writeUTF(data);
			//socket.writeByte(0);
			socket.flush();
		}
		
		public function closeCon():void
		{
			socket.close();
			socket.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, securityError);
			socket.removeEventListener(ProgressEvent.SOCKET_DATA, socketdata);
			//socket = null;
		}
		
		private function createListener():void
		{
			socket = new Socket("localhost",9876);
			socket.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityError);
			socket.addEventListener(IOErrorEvent.IO_ERROR, ioerror);
			socket.addEventListener(ProgressEvent.SOCKET_DATA, socketdata);
		}
		
		protected function socketdata(e:ProgressEvent):void
		{
			//trace("socketdata");
			try{
			var str:String = socket.readUTF();
			toController(str);
			}catch(e:SecurityErrorEvent){};
		}
		
		protected function securityError(e:SecurityErrorEvent):void
		{
			trace("securityError");
		}
		
		protected function ioerror(e:IOErrorEvent):void
		{
			
		}
				
	}
}