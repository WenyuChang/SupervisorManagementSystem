package MyApp.Model.VO
{
	public class EMP
	{
		private var e_no:Number;
		private var e_name:String;
		private var e_passwd:String;
		private var e_deptno:Number;
		private var e_duty:String;
		private var e_leader:Number;
		
		public function EMP()
		{
		}
		
		public function getE_no():Number {
			return e_no;
		}
		public function setE_no(e_no:Number):void {
			this.e_no = e_no;
		}
		public function getE_name():String {
			return e_name;
		}
		public function setE_name(e_name:String):void {
			this.e_name = e_name;
		}
		public function getE_passwd():String {
			return e_passwd;
		}
		public function setE_passwd(e_passwd:String):void {
			this.e_passwd = e_passwd;
		}
		public function getE_deptno():Number {
			return e_deptno;
		}
		public function setE_deptno(e_deptno:Number):void {
			this.e_deptno = e_deptno;
		}
		public function getE_duty():String {
			return e_duty;
		}
		public function setE_duty(e_duty:String):void {
			this.e_duty = e_duty;
		}
		public function getE_leader():Number {
			return e_leader;
		}
		public function setE_leader(e_leader:Number):void {
			this.e_leader = e_leader;
		}			
	}
}