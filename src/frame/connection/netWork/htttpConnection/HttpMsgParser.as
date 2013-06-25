package  frame.connection.netWork.htttpConnection
{
	import frame.connection.error.NetworkError;
	import frame.connection.netWork.MessageStructure;
	
	
	/**
	 * http 消息解析器 
	 * @author songdu.greg
	 * 
	 */	
	public class HttpMsgParser
	{	
		/**
		 * 如果服务端返回 json格式数据用此方法解析
		 * @param jsonString
		 * @return 
		 * 
		 */		
		public static function httpMsgParser(jsonString:String):MessageStructure
		{
			var obj:Object = null;
			try
			{
//				obj = JSON.decode(jsonString);
			}
			catch(error:Error)
			{
				throw new NetworkError(NetworkError.JSON_STRING_FORMAT_ERROR);	
			}
			
			var message:MessageStructure = new MessageStructure();
			message.cmdId = obj["m"];
			message.action = obj["a"];
			message.error = obj["error"];
			if (obj["data"] is Array)
			{
				message.params = obj["data"];
			}
			else
			{
				message.params = [obj["data"]];
			}
			
			return message;
		}	
	}
}