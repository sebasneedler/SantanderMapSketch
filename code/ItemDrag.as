package
{
	import flash.display.MovieClip;
	import CollisionTest;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author ...
	 */
	public class ItemDrag extends MovieClip
	{
		public var assignedDropZone:MovieClip;
		private var _collisionTest:CollisionTest;
		
		public function ItemDrag(dropZone:MovieClip)
		{
			_collisionTest = new CollisionTest();
			assignedDropZone = dropZone;
			this.addEventListener(MouseEvent.MOUSE_UP, onShapeUpHandler);
			this.addEventListener(MouseEvent.MOUSE_DOWN, onShapeDownHandler);
		}
		
		private function onShapeUpHandler(e:MouseEvent):void 
		{
			// stop drag
			MovieClip(e.target).stopDrag();
			if (_collisionTest.complex(this,assignedDropZone))
			{
				trace("Colission "+this.name+" and "+assignedDropZone.name);
			}
			
		}
		
		private function onShapeDownHandler(e:MouseEvent):void 
		{
			// start drag
			MovieClip(e.target).startDrag();
		}
		
	}

}