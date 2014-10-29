package MyApp.Controller
{
	import MyApp.Model.LoginIDProxy;
	import MyApp.MyAppFacade;
	import MyApp.View.ControlBtnMediator;
	import MyApp.View.LoginMediator;
	//import com.common.login;
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;

	public class StartUpCommand extends SimpleCommand implements ICommand
	{
		public function StartUpCommand()
		{
			super();
		}		
		override public function execute(notification:INotification):void
		{
			var app:SupervisorFlex = notification.getBody() as SupervisorFlex;
			//注册代理(proxy)
			facade.registerProxy( new LoginIDProxy( LoginIDProxy.NAME ) );
			//注册中介器
			facade.registerMediator( new LoginMediator( 
			       LoginMediator.NAME, 
			       {
					   username:app.login.username,
					   password:app.login.password,
					   msg:app.login.msg,
					   appStack:app.appStack,
					   content:app.content,
					   main:app
			       }
			) );
			
			facade.registerMediator( new ControlBtnMediator(
			        ControlBtnMediator.NAME,
			        {loginBtn:app.login.loginBtn,
			         myButton:app.addTask}));
			//通知已经初始化完毕
			sendNotification(MyAppFacade.LOGIN,app);				
		}
		
	}
}