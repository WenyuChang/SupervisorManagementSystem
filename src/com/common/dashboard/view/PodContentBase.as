package com.common.dashboard.view
{
	import mx.collections.ArrayCollection;
	import mx.containers.HBox;
	import mx.containers.VBox;
	import mx.events.FlexEvent;
	
	public class PodContentBase extends VBox
	{
		[Bindable]
		public var properties:XML;
		
		function PodContentBase()
		{
			super();
		}
		
		public function set arrData(arr:ArrayCollection):void
		{
			
		}
		
		public function clearData():void
		{
			
		}
	}
}