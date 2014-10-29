package MyApp.Controller
{
	import MyApp.Model.LoginIDProxy;
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;

	public class LoginCommand extends SimpleCommand implements ICommand
	{
		public function LoginCommand()
		{
			super();
		}
		
		override public function execute(notification:INotification):void
		{	
		}
		
	}
}