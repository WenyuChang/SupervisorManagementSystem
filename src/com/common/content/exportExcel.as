package com.common.content
{
	import com.as3xls.xls.ExcelFile;
	import com.as3xls.xls.Sheet;
	import com.common.util.DateUtil;
	
	import flash.events.Event;
	import flash.filesystem.*;
	import flash.utils.ByteArray;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.controls.CheckBox;

	public class exportExcel
	{
		[Bindable]
		static public var arrDept:ArrayCollection =  new ArrayCollection([
			{data:"1",label:"Administration Dept."},
			{data:"2",label:"Market Dept."},
			{data:"3",label:"HR Dept."},
			{data:"4",label:"Sales Dept."},
			{data:"5",label:"Development Dept."}
		]);
		[Bindable]
		static public  var arrEMP:ArrayCollection =  new ArrayCollection([
			{data:"1",label:"Chang"},
			{data:"2",label:"Feng"},
			{data:"3",label:"Ji"},
			{data:"4",label:"Xiao"},
			{data:"5",label:"Cai"},
			{data:"6",label:"Song"},
			{data:"7",label:"Cheng"}
		]);
		[Bindable]
		static public  var arrState:ArrayCollection =  new ArrayCollection([
			{data:"1",label:"Regist"},
			{data:"2",label:"Undone"},
			{data:"3",label:"Done"}
		]);
		
		static public function onCreate(arr:ArrayCollection):void
		{
			if(arr.length>0)
			{
				var excelFile:ExcelFile = new ExcelFile(); 
				var sheet:Sheet = new Sheet();
				sheet.resize(arr.length, 10);
				
				
				sheet.setCell(0, 0, "Task ID");
				sheet.setCell(0, 1, "Task Name"); 
				sheet.setCell(0, 2, "Task Major Dept."); 
				sheet.setCell(0, 3, "Task Major Emp."); 
				sheet.setCell(0, 4, "Task Assistant Dept."); 
				sheet.setCell(0, 5, "Task Begin Date"); 
				sheet.setCell(0, 6, "Task End Date"); 
				sheet.setCell(0, 7, "Task Completion");
				sheet.setCell(0, 8, "Task State"); 
				sheet.setCell(0, 9, "Task Desc.");
				
				for(var i:int=1; i<arr.length; i++)
				{
					sheet.setCell(i, 0, arr[i].t_id);
					sheet.setCell(i, 1, arr[i].t_name); 
					sheet.setCell(i, 2, arrDept.getItemAt(arr[i].t_major_dept-1).label); 
					sheet.setCell(i, 3, arrEMP.getItemAt(arr[i].t_major_emp-1).label); 
					sheet.setCell(i, 4, arrDept.getItemAt(arr[i].t_assis_dept-1).label); 
					sheet.setCell(i, 5, DateUtil.toString1(arr[i].t_begintime)); 
					sheet.setCell(i, 6, DateUtil.toString1(arr[i].t_deadline)); 
					sheet.setCell(i, 7, arr[i].t_complete);
					sheet.setCell(i, 8, arrState.getItemAt(arr[i].t_state-1).label); 
					sheet.setCell(i, 9, arr[i].t_desc);
				}
					
				excelFile.sheets.addItem(sheet); 
				var mbytes:ByteArray = excelFile.saveToByteArray(); 
				var stream:FileStream = new FileStream();  
				var docsDir:File = File.documentsDirectory.resolvePath("taskList.xls");
				try 
				{ 
					docsDir.browseForSave("Save As"); 
					docsDir.addEventListener(Event.SELECT, saveData); 
				} 
				catch (error:Error) 
				{
					Alert.show("Failed to Export!");
					trace("Failed:", error.message) 
				} 
				function saveData(event:Event):void 
				{ 
					var newFile:File = event.target as File; 
					if (!newFile.exists) 
					{ 
						var stream:FileStream = new FileStream(); 
						stream.open(newFile, FileMode.WRITE); 
						stream.writeBytes(mbytes);
						stream.close(); 
					}
					Alert.show("Export Succeed!");
				}
			}
		} 
	}
	
	
}