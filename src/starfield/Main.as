package starfield 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.events.KeyboardEvent;
	import flash.utils.Timer;
	
	import starfield.StarfieldHUD;
	import starfield.StarController;
	
	[SWF(width='640',height='480',backgroundColor="0x000000",frameRate='60')]
	public class Main extends Sprite
	{
		public var hud:StarfieldHUD;
		private var sc:StarController;
		
		public var updateTimer:Timer;
		
		
		public function Main():void
		{
			if (stage) 
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		public function init(e:Event=null):void
		{
			/*
			 * Setup our update timer
			 */
			updateTimer = new Timer(25);
			updateTimer.addEventListener(TimerEvent.TIMER, update);
			updateTimer.start();
			
			/*
			 * Setup our starfield
			 */
			sc = new StarController();
			
			addChild(sc);
			
			/*
			 * Setup our HUD
			 */
			hud = new StarfieldHUD();
			
			hud.x = 10;
			hud.y = 10;
			
			hud.setStars(sc.stars());
			
			addChild(hud);
			
			/*
			 * Add listener for key presses
			 */
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
		}
		
		public function update(e:Event):void
		{
			sc.update();
		}
		
		private function keyDownHandler(e:KeyboardEvent):void
		{
			switch(e.keyCode)
			{
				// Up Arrow
				case 38:
					sc.increaseStars();
					hud.setStars(sc.stars());
					break;
				// Down Arrow
				case 40:
					sc.decreaseStars();
					hud.setStars(sc.stars());
					break;
				default:
					break;
			}
		}
	}
}