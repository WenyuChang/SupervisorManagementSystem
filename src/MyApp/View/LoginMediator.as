package MyApp.View
{
	import MyApp.Model.LoginIDProxy;
	import MyApp.Model.VO.EMP;
	
	import flash.events.ErrorEvent;
	
	import mx.controls.Alert;
	import mx.controls.Label;
	import mx.controls.TextInput;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;

	public class LoginMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "LoginMediator";
		
		private var arrayOfImage:Array=null; 
		
		public function LoginMediator(mediatorName:String=null, viewComponent:Object=null)
		{
			super(mediatorName, viewComponent);
		}
		
		
		override public function listNotificationInterests():Array{
			return [
				ControlBtnMediator.LOGIN_BTN	
			];
		}	
		
		override public function handleNotification(notification:INotification):void
		{			
			switch(notification.getName()){
				case ControlBtnMediator.LOGIN_BTN:
				{
					(viewComponent.msg as Label).text = "login...";
					if((viewComponent.username as TextInput).text == ""&&(viewComponent.password as TextInput).text == "")
					{
						(viewComponent.msg as Label).text = "please input username or password!";
					}
					else
					{
//						viewComponent.appStack.selectedChild=viewComponent.content;
						onLogin();
						
					}
					break;
				}
				default:
					break;
			}			
		}
		
		private function onLogin():void
		{
			var httpService:HTTPService = new HTTPService();
			var params:Object = new Object();
			
			params.e_name = (viewComponent.username as TextInput).text;
			params.e_passwd = (viewComponent.password as TextInput).text;

			httpService.addEventListener(ResultEvent.RESULT, resultLnr);
			httpService.addEventListener(FaultEvent.FAULT, faultLnr);
			httpService.resultFormat = "e4x";
			httpService.url = SupervisorFlex.domain + "/report/Login.action";
			httpService.send(params);
		}
		
		private function faultLnr(e:FaultEvent):void {
			(viewComponent.msg as Label).text = "Please check the network or the configuration!";
		}
		
		private function resultLnr(event:ResultEvent):void
		{
			var externalXML:XML = new XML(event.result);
			if (externalXML.item[0] != null)
			{
				var emp:EMP = new EMP();
				emp.setE_no(externalXML.item[0].field1);
				emp.setE_name(externalXML.item[0].field2);
				emp.setE_passwd(externalXML.item[0].field3);
				emp.setE_deptno(externalXML.item[0].field4);
				emp.setE_duty(externalXML.item[0].field5);
				emp.setE_leader(externalXML.item[0].field6);
				
				viewComponent.main.emp = emp;
				switch (emp.getE_duty())
				{
					case 'Director':
					{
						viewComponent.main.export.enabled = true;
						viewComponent.main.addTask.enabled = false;
						break;
					}
					case 'DepartmentManager':
					{
						viewComponent.main.export.enabled = false;
						viewComponent.main.addTask.enabled = false;
						break;
					}
					default:
						break;
				}
				viewComponent.appStack.selectedChild=viewComponent.content;
				
				(viewComponent.main as SupervisorFlex).loginDone();
			}
			else
			{
				(viewComponent.msg as Label).text = "username or password is not valid!";
			}
		}
	}
}