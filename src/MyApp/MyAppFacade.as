package MyApp
{
	import MyApp.Controller.LoginCommand;
	import MyApp.Controller.StartUpCommand;
	import org.puremvc.as3.interfaces.IFacade;
	import org.puremvc.as3.patterns.facade.Facade;

	public class MyAppFacade extends Facade implements IFacade
	{
		public static const STARTUP:String = "startup";
		public static const LOGIN:String = "login";
		
		public function MyAppFacade()
		{
			super();
		}
		
		public static function getInstance():MyAppFacade{
			if(instance==null) instance = new MyAppFacade();
			return instance as MyAppFacade;
		}									
		override protected function initializeController():void{
			super.initializeController();
			//register some Commands
			registerCommand(STARTUP,StartUpCommand);
			registerCommand(LOGIN,LoginCommand);
		}
		public function startup(app:Object):void{		
			sendNotification(STARTUP,app);	
		}	
		
	}
}