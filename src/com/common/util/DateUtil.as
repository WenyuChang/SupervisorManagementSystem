package com.common.util
{
	public class DateUtil
	{
		
		public static var LAST_YEAR:Number=1
		public static var LAST_MONTH:Number=2;
		public static var LAST_WEEK:Number=3;
		public static var LAST_DAY:Number=4;
		public static var YEAR_TO_DATE:Number=5;
		public static var MONTH_TO_DATE:Number=6;
		public static var WEEK_TO_DATE:Number=7;
		public static var TODAY:Number=8;
		
		
		public static function getDateRange(type:Number):Array
		{
			var startDate:Date;
			var endDate:Date;
			var today:Date= new Date();
			var result:Array;
			if(type ==LAST_YEAR)
			{
				startDate = new Date();
				startDate.setFullYear(today.getFullYear()-1);
				startDate.setMonth(0);
				startDate.setDate(1);
				
				endDate= new Date();
				endDate.setFullYear(today.getFullYear()-1);
				endDate.setMonth(11);
				endDate.setDate(31);						
			}
			else if(type==LAST_MONTH)
			{
			   startDate = new Date();		  
			   startDate.setMonth(today.getMonth()-1);
			   startDate.setDate(1);
			   
			   endDate= new Date();
			   endDate.setMonth(today.getMonth());
			   endDate.setDate(0);
			}
			else if(type==LAST_WEEK)
			{
			   startDate = new Date();		  
			   startDate.setDate(today.getDate()-today.getDay()-6);
			   
			   endDate= new Date();
			   endDate.setDate(today.getDate()-today.getDay());
			}
			else if(type==LAST_DAY)
			{
				startDate= new Date();
				startDate.setDate(today.getDate()-1);
				endDate=startDate;
			}
			else if(type==YEAR_TO_DATE)
			{
			   startDate = new Date();
			   startDate.setMonth(0);	
			   startDate.setDate(1);	  

			   endDate= new Date();
			  
			}	
			else if(type==MONTH_TO_DATE)
			{
			   startDate = new Date();
               startDate.setDate(1);	  

			   endDate= new Date();
			}	
			else if(type ==WEEK_TO_DATE)
			{
			   startDate = new Date();
               startDate.setDate(today.getDate()-today.getDay()+1);	  

			   endDate= new Date();
			}
			else if(type==TODAY)
			{
				 endDate=startDate=today;
			}	
			else
			{
				 endDate=startDate=today;
			}
		    result=[startDate,endDate];
			return result;
		}
		
		/*
		* convert date format from mm/dd/yyyy to yyyymmdd which was used in report previously
		*/
		public static function convertDate(date:Date):String
		{	   
		   return date == null ? "" : date.getFullYear()+""
		         +((date.getMonth()+1)<10?"0"+(date.getMonth()+1):(date.getMonth()+1))+""
		           +(date.getDate()<10?"0"+date.getDate():date.getDate());			
		}
		
		/*
		 * return a string with MM/dd/yyyy reprensant the date object
		 */ 
		public static function toString(date:Date):String
		{
			return date == null ? "Not Specified" : ""+((date.getMonth()+1)<10?"0"+(date.getMonth()+1):(date.getMonth()+1))+"/"
		           +(date.getDate()<10?"0"+date.getDate():date.getDate())+ "/"
		           +date.getFullYear();
		}
		
		/*
		* return a string with yyyy-mm-dd reprensant the date object
		*/ 
		public static function toString1(date:Date):String
		{
			return date.getFullYear()+"-"
				+((date.getMonth()+1)<10?"0"+(date.getMonth()+1):(date.getMonth()+1))+"-"
				+(date.getDate()<10?"0"+date.getDate():date.getDate());
		}
		
		public static function StrToDate(str:String):Date
		{
			var date:Array = str.substr(0, 10).split("-");
			var dd:Date = new Date(date[0], date[1]-1, date[2]);
			return dd;
		}
	}
}