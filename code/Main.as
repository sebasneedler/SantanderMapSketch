package
{
    import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import CollisionTest;
	import flash.text.TextField;
    public class Main extends MovieClip
    {
		
		public var gameOver:GameOver_mc;
		public var correctAnswers:uint = 0;
		public var incorrectAnwer:uint = 0;
		
		private var _incorrectAnswerText:TextField;
		
		//dropZone
		private var _dropZoneBucaramanga_mc:MovieClip;
		private var _dropZoneMatanza_mc:MovieClip;
		private var _dropZoneMalaga_mc:MovieClip;
		private var _dropZoneSanGil_mc:MovieClip;
		private var _dropZoneSocorro_mc:MovieClip;
		private var _dropZoneVelez_mc:MovieClip;
		private var _dropZoneCimitarra_mc:MovieClip;
		private var _dropZoneBarrancabermeja_mc:MovieClip;
		
		//item
		private var _itemBucaramanga_mc:ItemBucaramanga_mc;
		private var _itemMatanza_mc:ItemMatanza_mc;
		private var _itemMalaga_mc:ItemMalaga_mc;
		private var _itemSanGil_mc:ItemSanGil_mc;
		private var _itemSocorro_mc:ItemSocorro_mc;
		private var _itemVelez_mc:ItemVelez_mc;
		private var _itemCimitarra_mc:ItemCimitarra_mc;
		private var _itemBarrancabermeja_mc:ItemBarrancabermeja_mc;
		
		//const
		private const ITEM_X_LEFT:uint = 25;
		private const ITEM_X_RIGHT:uint = 700;
		private const MAX_ANSWER:uint = 8;
		private const ERRORES_TEXT:String = "Errores: ";
		
		private var _collitionTest:CollisionTest = new CollisionTest();
		
        public function Main()
        {
			_incorrectAnswerText = ErrorTxt;
			_incorrectAnswerText.text = ERRORES_TEXT + incorrectAnwer;
			

			
			stage.addEventListener(Event.ENTER_FRAME, showGameOver);
			
			//dropZone instance name
			_dropZoneBucaramanga_mc = dropZoneBucaramanga_mc;
			_dropZoneMatanza_mc = dropZoneMatanza_mc;
			_dropZoneMalaga_mc = dropZoneMalaga_mc;
			_dropZoneSanGil_mc = dropZoneSanGil_mc;
			_dropZoneSocorro_mc = dropZoneSocorro_mc;
			_dropZoneVelez_mc = dropZoneVelez_mc;
			_dropZoneCimitarra_mc = dropZoneCimitarra_mc;
			_dropZoneBarrancabermeja_mc = dropZoneBarrancabermeja_mc;
			
			//item instance 
			_itemBarrancabermeja_mc = new ItemBarrancabermeja_mc(this,_dropZoneBarrancabermeja_mc);
			_itemBucaramanga_mc = new ItemBucaramanga_mc(this, _dropZoneBucaramanga_mc);
			_itemCimitarra_mc = new ItemCimitarra_mc(this, _dropZoneCimitarra_mc);
			_itemMalaga_mc = new ItemMalaga_mc(this, _dropZoneMalaga_mc);
			_itemMatanza_mc = new ItemMatanza_mc(this, _dropZoneMatanza_mc);
			_itemSanGil_mc = new ItemSanGil_mc(this, _dropZoneSanGil_mc);
			_itemSocorro_mc = new ItemSocorro_mc(this, _dropZoneSocorro_mc);
			_itemVelez_mc = new ItemVelez_mc(this, _dropZoneVelez_mc);
			
			//item position
			_itemBarrancabermeja_mc.setFirstPosition(ITEM_X_LEFT, 5);
			_itemBucaramanga_mc.setFirstPosition(ITEM_X_LEFT, 185);
			_itemCimitarra_mc.setFirstPosition(ITEM_X_LEFT, 275);
			_itemMalaga_mc.setFirstPosition(ITEM_X_LEFT, 395);
			_itemMatanza_mc.setFirstPosition(ITEM_X_RIGHT, 5);
			_itemSanGil_mc.setFirstPosition(ITEM_X_RIGHT, 95);
			_itemSocorro_mc.setFirstPosition(ITEM_X_RIGHT, 205);
			_itemVelez_mc.setFirstPosition(ITEM_X_RIGHT,325);
			
			//item Stage.addChild()
			stage.addChild(_itemBarrancabermeja_mc);
			stage.addChild(_itemBucaramanga_mc);
			stage.addChild(_itemCimitarra_mc);
			stage.addChild(_itemMalaga_mc);
			stage.addChild(_itemMatanza_mc);
			stage.addChild(_itemSanGil_mc);
			stage.addChild(_itemSocorro_mc);
			stage.addChild(_itemVelez_mc);
			
			//showGameOver();
			
			/* dropZoneMatanza_mc.addEventListener(MouseEvent.CLICK, dropZoneClick);
			 dropZoneBucaramanga_mc.addEventListener(MouseEvent.CLICK, dropZoneClick);*/
			 
			/* _dropZoneBucaramanga_mc.addEventListener(MouseEvent.MOUSE_DOWN, onShapeDownHandler);
			 _dropZoneBucaramanga_mc.addEventListener(MouseEvent.MOUSE_UP, onShapeUpHandler);
			 
			 _dropZoneMatanza_mc.addEventListener(MouseEvent.MOUSE_DOWN, onShapeDownHandler);
			 _dropZoneMatanza_mc.addEventListener(MouseEvent.MOUSE_UP, onShapeUpHandler);*/
			 
        }
		
		private function showGameOver(e:Event):void
		{
			_incorrectAnswerText.text = ERRORES_TEXT + incorrectAnwer;
			if (correctAnswers>=MAX_ANSWER)
			{
				gameOver = new GameOver_mc();
				gameOver.x = 0;
				gameOver.y = 0;
				stage.addChild(gameOver);
				stage.removeEventListener(Event.ENTER_FRAME, showGameOver);
			}
		}
		
	/*	private function removeItem(movieClip:MovieClip):void
		{
			stage.removeChild(movieClip);
		}*/

/*		public function dropZoneClick(event:MouseEvent):void
		{
			if (dropZoneBucaramanga_mc.hitTestPoint(event.stageX,event.stageY))
			{
				trace("Bucaramanga" + iBucaramanga++);
			}
			
			if (dropZoneMatanza_mc.hitTestPoint(event.stageX,event.stageY))
			{
				trace("Matanza" + iMatanza++);
			}
			
		}*/
		
		
/*		private function onShapeUpHandler(e:MouseEvent):void 
		{
			// stop drag
			MovieClip(e.target).stopDrag();
		}
		
		private function onShapeDownHandler(e:MouseEvent):void 
		{
			// start drag
			MovieClip(e.target).startDrag();
		}*/
    }
}