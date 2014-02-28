package starfield
{
	public class Star
	{
		private var _angle:Number;
		private var _cos:Number;
		private var _sin:Number;
		
		public var x:Number;
		public var y:Number;
		public var speed:Number;
		public var distance:Number;
		
		public function Star():void
		{
			init();
		}
		
		public function init():void
		{
			_angle = Math.random() * (Math.PI*2);
			_cos = Math.cos(_angle);
			_sin = Math.sin(_angle);
			
			speed = 1.00324 + Math.random() * 0.01;
			distance = Math.random() * 240;
		}
		
		public function move():void
		{
			distance *= speed;
			x = 320 + _cos * (distance * 1);
			y = 240 + _sin * (distance * 1);
			
			// if out of screen init it
			if (x <= 0 || x > 640 ||
				y <= 0 || y > 480)
			{
				init();
			}
		}
	}
}