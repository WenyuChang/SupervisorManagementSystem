package MyApp.Model
{
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;

	public class LoginIDProxy extends Proxy implements IProxy
	{
		public static const NAME:String = "LoginIDProxy";
		
		public function LoginIDProxy(proxyName:String=null, data:Object=null)
		{			
			super(proxyName,data);
		}	
		public function InfoList():void{				
		}		
	}
}