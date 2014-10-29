package com.common.dashboard.layout
{
	import com.common.dashboard.events.LayoutChangeEvent;
	import com.common.dashboard.view.DragHighlight;
	import com.common.dashboard.view.Pod;
	import com.common.dashboard.managers.PodLayoutManager;

	import flash.geom.Point;

	import mx.effects.Parallel;

	[Event(name="update", type="com.common.dashboard.events.LayoutChangeEvent;")]

	public class vLayout extends PodLayoutManager {
		override public function updateLayout(tween:Boolean = true):void {
			var len:Number=items.length;
			var pod:Pod;
			var col:int=-1;

			var itemWidth:int=0;
			var itemHeight:int=0;

			if (parallel != null && parallel.isPlaying)
				parallel.pause();

			if (tween) {
				parallel=new Parallel();
				parallel.duration=1000;
			}

			for (var i:Number=0; i < len; i++) {
				if (i != 0)
					col++;
				var targetX:Number=(i == 0) ? 0 : col * (Math.round(availablePodWidth / (len - 1) - (POD_GAP * (len - 2) / (len - 1))));
				var targetY:Number=(i == 0) ? 0 : Math.round(availablePodHeight / 2 - (POD_GAP / 2)) + POD_GAP;
				if (col > 0)
					targetX+=POD_GAP * col;

				pod=items[i];

				if (pod.windowState == Pod.WINDOW_STATE_MAXIMIZED) {
					if (tween) {
						addResizeAndMoveToParallel(pod, parallel, availablePodWidth, availableMaximizedPodHeight, 0, 0);
					} else {
						pod.width=availablePodWidth;
						pod.height=availableMaximizedPodHeight;
					}

					container.setChildIndex(pod, container.numChildren - 1);
				} else {
					if (tween) {
						if (i == 0)
							addResizeAndMoveToParallel(pod, parallel, availablePodWidth, Math.round(availablePodHeight / 2 - (POD_GAP / 2)), targetX, targetY);
						else
							addResizeAndMoveToParallel(pod, parallel, Math.round(availablePodWidth / (len - 1) - (POD_GAP / (len - 1))), Math.round(availablePodHeight / 2 - (POD_GAP / 2)), targetX, targetY);
					} else {
						pod.width=(i == 0) ? availablePodWidth : Math.round(availablePodWidth / (len - 1) - (POD_GAP / (len - 1)));
						pod.height=Math.round(availablePodHeight / 2 - (POD_GAP / 2));
						pod.x=targetX;
						pod.y=targetY;
					}
				}

				pod.index=i;
				gridPoints[i]=new Point(targetX, targetY);
			}

			//minimized feature
			len=minimizedItems.length;
			if (len > 0) {
				var totalMinimizedItemWidth:Number=len * TASKBAR_ITEM_WIDTH + (len - 1) * TASKBAR_HORIZONTAL_GAP;
				var minimizedItemWidth:Number;
				if (totalMinimizedItemWidth > availablePodWidth)
					minimizedItemWidth=Math.round((availablePodWidth - (len - 1) * TASKBAR_HORIZONTAL_GAP) / len);
				else
					minimizedItemWidth=TASKBAR_ITEM_WIDTH;

				for (i=0; i < len; i++) {
					pod=Pod(minimizedItems[i]);
					pod.height=Pod.MINIMIZED_HEIGHT;
					targetX=i * (TASKBAR_HORIZONTAL_GAP + minimizedItemWidth);
					if (tween) {
						addResizeAndMoveToParallel(pod, parallel, minimizedItemWidth, Pod.MINIMIZED_HEIGHT, targetX, minimizedPodY);
					} else {
						pod.width=minimizedItemWidth;
						pod.x=targetX;
						pod.y=minimizedPodY;
					}
				}
			}

			if (parallel != null && parallel.children.length > 0)
				parallel.play();

			len=dragHighlightItems.length;
			for (i=0; i < len; i++) {
				itemHeight=Math.round(availablePodHeight / 2 - (POD_GAP / 2));
				itemWidth=(i == 0) ? availablePodWidth : Math.round(availablePodWidth / (len - 1) - (POD_GAP / (len - 1)));
				var dragHighlight:DragHighlight=DragHighlight(dragHighlightItems[i]);
				if (i > (items.length - 1)) {
					dragHighlight.visible=false;
					dragHighlight.x=0;
					dragHighlight.y=0;
					dragHighlight.width=0;
					dragHighlight.height=0;
				} else {
					var point:Point=Point(gridPoints[i]);
					dragHighlight.x=point.x;
					dragHighlight.y=point.y;
					dragHighlight.width=itemWidth;
					dragHighlight.height=itemHeight;
					container.setChildIndex(dragHighlight, i);
				}
			}
		}
	}
}