package util
{
	
	public class CoordinateConvector
	{
		private var obj:Object = {};
		public function CoordinateConvector()
		{
			var zeroX:int = 239; // +57 // +57
			var zeroY:int = 372; // -30 // +30
			
			
			for(var i:uint = 0 ; i < 9; i++)
			{
				var X:int = (zeroX + i * -57) + (Math.floor(i/3)*228);
				var Y:int = (zeroY + i * 30) - (Math.floor(i/3)*60);
				obj[i] = X+","+Y;
				obj["x"+X] = X;
				obj["y"+Y] = Y;
				
				
				obj[X+","+Y] = i;
			}
		}
		
		public function convertXYtoPlantID(xx:int, yy:int):String{
			return obj[xx+","+yy];
		}
		
		public function converPlantIDtoX(id:int):int{
			return obj["x"+id];
		}
		public function converPlantIDtoY(id:int):int{
			return obj["y"+id];
		}
	}
}