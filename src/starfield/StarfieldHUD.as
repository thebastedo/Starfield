package starfield
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.utils.getTimer;
	import flash.system.System;
	import flash.events.Event;

	public class StarfieldHUD extends Sprite
	{
		private const INSTRUCTIONS:String = '<center>Up Arrow to add more stars, Down Arrow to remove stars</center>';
		
		private var _instructionsText:TextField;
		private var _hudText:TextField;
		
		private var _tick:uint = 0;
		private var _prevTime:uint = getTimer();
		
		public var stars:uint = 0;
		
		public function StarfieldHUD():void
		{
			_hudText = new TextField();
			_hudText.textColor = 0xffffff;
			_hudText.x = 0;
			_hudText.y = 0;
			_hudText.autoSize = TextFieldAutoSize.LEFT;
			_hudText.text = "FPS: \nMEM: \n";
			
			addChild(_hudText);
			
			_instructionsText = new TextField();
			_instructionsText.textColor = 0xffffff;
			_instructionsText.autoSize = TextFieldAutoSize.LEFT;
			_instructionsText.x = 20;
			_instructionsText.y = 440;
			_instructionsText.htmlText = INSTRUCTIONS;
			
			addChild(_instructionsText);
			
			// have to listen to event frame for reliable frame rate counting
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		public function update(e:Event):void
		{
			++_tick;
			
			var curTime:uint = getTimer();
			var timeDiff:uint = curTime - _prevTime;
			
			if (timeDiff >= 100)
			{
				var fps:Number = _tick / timeDiff * 1000;
				_tick = 0;
				_prevTime = curTime;
				_hudText.text = "FPS: " + fps.toFixed(0) + "\nMEM: " + System.totalMemory / 1024 + " kB\nStars: " + stars + "\n";
			}
		}
		
		public function setStars(value:uint):void
		{
			stars = value;
		}
	}
}