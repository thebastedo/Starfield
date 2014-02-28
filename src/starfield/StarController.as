package starfield
{
	import flash.display.Sprite;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import starfield.Star;

	public class StarController extends Sprite
	{
		private var _stars:BitmapData;
		private var _activeStars:Vector.<Star>;
		
		public function StarController():void
		{
			_activeStars = new Vector.<Star>;
			
			_stars = new BitmapData(640,480,false,0x000000);
			
			var field:Bitmap = new Bitmap(_stars);
			field.x = 0;
			field.y = 0;
			
			addChild(field);
			
			for (var i:int = 2000; i != 0; i--)
			{
				_activeStars.push(new Star());
			}
		}
		
		public function update():void
		{
			// clear it
			_stars.fillRect(_stars.rect,0x000000);
			
			var theStar:Star;
			var color:uint;
			
			if (_activeStars.length == 0)
				return;
			
			// loop through our stars and move them and draw them
			for (var i:int = _activeStars.length-1; i != 0; i--)
			{
				theStar = _activeStars[i];
				
				theStar.move();
				
				// Calculate greyscale for star
				if (theStar.distance < 25) 
				{
					color = 0x000000;
				} else if (theStar.distance < 50) {
					color = 0x111111;
				} else if (theStar.distance < 75) {
					color = 0x222222;
				} else if (theStar.distance < 100) {
					color = 0x333333;
				} else if (theStar.distance < 125) {
					color = 0x444444;
				} else if (theStar.distance < 150) {
					color = 0x555555;
				} else if (theStar.distance < 175) {
					color = 0x666666;
				} else if (theStar.distance < 200) {
					color = 0x777777;
				} else if (theStar.distance < 225) {
					color = 0x888888;
				} else if (theStar.distance < 250) {
					color = 0x999999;
				} else if (theStar.distance < 275) {
					color = 0xaaaaaa;
				} else if (theStar.distance < 300) {
					color = 0xbbbbbb;
				} else if (theStar.distance < 325) {
					color = 0xcccccc;
				} else if (theStar.distance < 350) {
					color = 0xdddddd;
				} else if (theStar.distance < 375) {
					color = 0xeeeeee;
				} else {
					color = 0xffffff;
				}
				
				_stars.setPixel(theStar.x, theStar.y, color);
			}
		}
		
		public function stars():uint
		{
			return _activeStars.length;
		}
		
		public function increaseStars(value:uint=500):void
		{
			for (var i:uint = value; i != 0; i--)
			{
				_activeStars.push(new Star());
			}
		}
		
		public function decreaseStars(value:uint=500):void
		{
			if (_activeStars.length >= value)
			{
				for (var i:uint = value; i != 0; i--)
				{
					_activeStars.pop();
				}
			} else {
				_activeStars.length = 0;
			}
		}
	}
}