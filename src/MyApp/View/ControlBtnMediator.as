package MyApp.View
{
	import flash.events.MouseEvent;
	
	import mx.controls.Button;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.patterns.mediator.Mediator;

	public class ControlBtnMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "ControlBtnsMediator";
		
		public static const LOGIN_BTN:String = "login_btn";
		public static const CLICK_BTN:String = "click_btn";
		
		public function ControlBtnMediator(mediatorName:String=null, viewComponent:Object=null)
		{
			super(mediatorName, viewComponent);
			(viewComponent.loginBtn as Button).addEventListener(MouseEvent.CLICK,onClickLogin);
			(viewComponent.myButton as Button).addEventListener(MouseEvent.CLICK,onClickMe);
		}		
		private function onClickLogin(e:MouseEvent):void{
			sendNotification(LOGIN_BTN);
		}
		private function onClickMe(e:MouseEvent):void{
			sendNotification(CLICK_BTN);
		}

	}
	
}