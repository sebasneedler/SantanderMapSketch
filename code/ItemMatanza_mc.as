package
{
	import flash.display.MovieClip;
	import CollisionTest;
	import flash.events.MouseEvent;

	public class ItemMatanza_mc extends MovieClip
	{
		
		public var assignedDropZone:MovieClip;
		private var _mainReference:Main;
		private var _collisionTest:CollisionTest;
		private var _dropZoneWidth:Number;
		private var _dropZoneHeight:Number;
		private var _xPosition:uint;
		private var _yPosition:uint;
		
		public function ItemMatanza_mc(main:Main,dropZone:MovieClip) 
		{
			assignedDropZone = dropZone;
			_mainReference = main;
			_dropZoneWidth = assignedDropZone.width;
			_dropZoneHeight = assignedDropZone.height;
			
			this.width = _dropZoneWidth / 2;
			this.height = _dropZoneHeight / 2;
			
			_collisionTest = new CollisionTest();
			
			this.addEventListener(MouseEvent.MOUSE_UP, onShapeUpHandler);
			this.addEventListener(MouseEvent.MOUSE_DOWN, onShapeDownHandler);
				
			
			trace("Instance");
		}
		
		public function setFirstPosition(xPosition:uint, yPosition:uint):void
		{
			_xPosition = xPosition;
			_yPosition = yPosition;
			resetPosition();
		}
		
		private function resetPosition():void
		{
			this.x = _xPosition;
			this.y = _yPosition;
		}
		
		private function onShapeUpHandler(e:MouseEvent):void 
		{
			// stop drag
			MovieClip(e.target).stopDrag();
			if (_collisionTest.complex(this,assignedDropZone))
			{
				trace("Colission " + this.name+" and " + assignedDropZone.name);
				assignedDropZone.play();
				_mainReference.correctAnswers++;
				stage.removeChild(this);
				
			}
			else 
			{
				_mainReference.incorrectAnwer++
				resetPosition();
				
			}
			
		}
		
		private function onShapeDownHandler(e:MouseEvent):void 
		{
			// start drag
			MovieClip(e.target).startDrag();
		}
		
	}

}