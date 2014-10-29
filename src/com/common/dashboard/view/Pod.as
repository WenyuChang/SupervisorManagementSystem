package com.common.dashboard.view
{
	import com.common.dashboard.events.PodStateChangeEvent;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import mx.charts.BubbleChart;
	import mx.containers.HBox;
	import mx.containers.Panel;
	import mx.controls.Button;
	import mx.controls.Label;
	import mx.controls.Text;
	import mx.controls.TextInput;
	import mx.events.DragEvent;

	// Drag events.
	[Event(name="dragStart", type="mx.events.DragEvent")]
	[Event(name="dragComplete", type="mx.events.DragEvent")]
	// Resize events.
	[Event(name="minimize", type="com.common.dashboard.events.PodStateChangeEvent")]
	[Event(name="maximize", type="com.common.dashboard.events.PodStateChangeEvent")]
	[Event(name="restore", type="com.common.dashboard.events.PodStateChangeEvent")]

	public class Pod extends Panel
	{
		public static const MINIMIZED_HEIGHT:Number = 22;
		public static const WINDOW_STATE_DEFAULT:Number = -1;
		public static const WINDOW_STATE_MINIMIZED:Number = 0;
		public static const WINDOW_STATE_MAXIMIZED:Number = 1;
		
		public var windowState:Number;
		public var index:Number;
		
		private var controlsHolder:HBox;
		
		private var minimizeButton:Button;
		private var maximizeRestoreButton:Button;
		public var overdateButton:Button = new Button();
		public var last7Button:Button = new Button();
		public var alltaskButton:Button = new Button();
		public var searchLabel:Label = new Label();
		public var searchText:TextInput = new TextInput();
		public var hasBtn:Boolean = false;
		
		private var dragStartMouseX:Number;
		private var dragStartMouseY:Number;
		private var dragStartX:Number;
		private var dragStartY:Number;
		private var dragMaxX:Number;
		private var dragMaxY:Number;
		
		private var _showControls:Boolean;
		private var _showControlsChanged:Boolean;
		
		private var _maximize:Boolean;
		private var _maximizeChanged:Boolean;
		
		public function Pod()
		{
			super();
			doubleClickEnabled = true;
			setStyle("titleStyleName", "podTitle");
			
			windowState = WINDOW_STATE_DEFAULT;
			horizontalScrollPolicy = "off";
		}
		
		private function addEventListeners():void
		{
			titleBar.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDownTitleBar);
			titleBar.addEventListener(MouseEvent.DOUBLE_CLICK, onClickMaximizeRestoreButton);
//			titleBar.addEventListener(MouseEvent.CLICK, onClickTitleBar);
			
//			minimizeButton.addEventListener(MouseEvent.CLICK, onClickMinimizeButton);
			maximizeRestoreButton.addEventListener(MouseEvent.CLICK, onClickMaximizeRestoreButton);
			
			addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			
			if (!controlsHolder)
			{
				controlsHolder = new HBox();
				controlsHolder.setStyle("paddingRight", getStyle("paddingRight"));
				controlsHolder.setStyle("horizontalAlign", "right");
				controlsHolder.setStyle("verticalAlign", "middle");
				controlsHolder.setStyle("horizontalGap", 3);
				rawChildren.addChild(controlsHolder);
			}
			
//			if(!minimizeButton)
//			{
//				minimizeButton = new Button();
//				minimizeButton.width = 14;
//				minimizeButton.height = 14;
//				minimizeButton.styleName = "minimizeButton";
//				controlsHolder.addChild(minimizeButton);
//			}
			if (hasBtn)
			{
				searchLabel.text="Search:";
				searchLabel.height = 18;
				searchLabel.width = 50;
				searchLabel.styleName = "overdateButton";
				controlsHolder.addChild(searchLabel);
				
				
				searchText.width = 150;
				searchText.height = 18;
				searchText.styleName = "overdateButton";
				controlsHolder.addChild(searchText);
				
				alltaskButton.label = "All Task";
				alltaskButton.width = 80;
				alltaskButton.height = 16;
				alltaskButton.styleName = "overdateButton";
				controlsHolder.addChild(alltaskButton);
				
				last7Button.label = "High Priority Task";
				last7Button.width = 120;
				last7Button.height = 16;
				last7Button.styleName = "overdateButton";
				controlsHolder.addChild(last7Button);
				
				overdateButton.label = "Overdate Task";
				overdateButton.width = 100;
				overdateButton.height = 16;
				overdateButton.styleName = "overdateButton";
				controlsHolder.addChild(overdateButton);
			}
			
			if (!maximizeRestoreButton)
			{
				maximizeRestoreButton = new Button();
				maximizeRestoreButton.width = 16;
				maximizeRestoreButton.height = 16;
				maximizeRestoreButton.styleName = "maximizeRestoreButton";
				controlsHolder.addChild(maximizeRestoreButton);
			}
			addEventListeners();
		}
		
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
		{
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			
			controlsHolder.y = titleBar.y;
			controlsHolder.width = unscaledWidth-5;
			controlsHolder.height = titleBar.height;
			
			titleTextField.width = titleBar.width - getStyle("paddingLeft") - getStyle("paddingRight");
		}
		
		private function onClickMinimizeButton(event:MouseEvent):void
		{
			dispatchEvent(new PodStateChangeEvent(PodStateChangeEvent.MINIMIZE));
			minimize();
		}
		
		public function minimize():void
		{
			setStyle("borderSides", "left top right");
			windowState = WINDOW_STATE_MINIMIZED;
			height = MINIMIZED_HEIGHT;
			showControls = true;
		}
		
		private function onClickMaximizeRestoreButton(event:MouseEvent):void
		{
			showControls = true;
			if (windowState == WINDOW_STATE_DEFAULT)
			{
				dispatchEvent(new PodStateChangeEvent(PodStateChangeEvent.MAXIMIZE));
				// Call after the event is dispatched so the old state is still available.
				maximize();
			}
			else/*  IF (WINDOWSTATE == WINDOW_STATE_DEFAULT) */
			{
				dispatchEvent(new PodStateChangeEvent(PodStateChangeEvent.RESTORE));
				// Set the state after the event is dispatched so the old state is still available.
				windowState = WINDOW_STATE_DEFAULT;
				maximizeRestoreButton.selected = false;
			}
		}
		
		public function maximize():void
		{
			windowState = WINDOW_STATE_MAXIMIZED;
			
			_maximize = true;
			_maximizeChanged = true;
		}
		
		private function onClickTitleBar(event:MouseEvent):void
		{
			if (windowState == WINDOW_STATE_MINIMIZED)
			{
				// Add the bottom border back in case we were minimized.
				setStyle("borderSides", "left top right bottom");
				onClickMaximizeRestoreButton(event);
			}
		}
	
		private function onMouseDown(event:Event):void
		{
			// Moves the pod to the top of the z-index.
			parent.setChildIndex(this, parent.numChildren - 1);
		}
		
		private function onMouseDownTitleBar(event:MouseEvent):void
		{
			if (windowState == WINDOW_STATE_DEFAULT) // Only allow dragging if we are in the default state.
			{
				dispatchEvent(new DragEvent(DragEvent.DRAG_START));
				dragStartX = x;
				dragStartY = y;
				dragStartMouseX = parent.mouseX;
				dragStartMouseY = parent.mouseY;
				dragMaxX = parent.width - width;
				dragMaxY = parent.height - height;
				
				// Use the stage so we get mouse events outside of the browser window.
				stage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
				stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			}
		}
		
		private function onMouseMove(e:MouseEvent):void
		{
			// Make sure we don't go off the screen on the right.
			var targetX:Number = Math.min(dragMaxX, dragStartX + (parent.mouseX - dragStartMouseX));
			// Make sure we don't go off the screen on the left.
			x = Math.max(0, targetX);
			
			// Make sure we don't go off the screen on the bottom.
			var targetY:Number = Math.min(dragMaxY, dragStartY + (parent.mouseY - dragStartMouseY));
			// Make sure we don't go off the screen on the top.
			y = Math.max(0, targetY);
		}
		
		private function onMouseUp(event:MouseEvent):void
		{
			dispatchEvent(new DragEvent(DragEvent.DRAG_COMPLETE));
			
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
			stage.removeEventListener(MouseEvent.MOUSE_UP, onMouseUp);
		}
			
		public function set showControls(value:Boolean):void
		{
			_showControls = value;
			_showControlsChanged = true;
			invalidateProperties();
		}
		
		override protected function commitProperties():void
		{
			super.commitProperties();
			
			if (_showControlsChanged)
			{
				controlsHolder.visible = _showControls;
				_showControlsChanged = false;
			}
			
			if (_maximizeChanged)
			{
				maximizeRestoreButton.selected = _maximize;
				_maximizeChanged = false;
			}
		}
	}
}