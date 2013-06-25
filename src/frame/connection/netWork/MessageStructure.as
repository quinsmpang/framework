package frame.connection.netWork
{
	import flash.utils.ByteArray;

	/**
	 * 消息 结构
	 * @author songdu.greg
	 * 
	 */	
	public class MessageStructure
	{
		
		/**
		 * 消息头 
		 */		
		public var cmdId:String;
		
		/**
		 * 交互名称 
		 */		
		public var action:String;
		
		/**
		 * 错误消息 
		 */		
		public var error:String;
		
		/**
		 * 交互类型 set or get 
		 */		
		public var target:String;
		
		/**
		 * 参数列表 (json 格式数据)
		 */
		public var params:Array = [];		
		
		public var data:ByteArray = new ByteArray();
		
		public function setData(data:Array):void
		{
			
		}
		/**
		 * 获取完整交互名称 
		 * @return 
		 * 
		 */		
		public function getKey():String
		{
			var key:String = "";
//			if(null == action)	
				key = (cmdId + "_").toUpperCase();
//			else
//				key = (action+ "_" + cmdId).toUpperCase();
			return key;
		}
	}
}