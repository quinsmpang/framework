package frame.connection.error
{
	/**
	 * 网络交互错误信息 
	 * @author songdu.greg
	 * 
	 */	
	public class NetworkError
	{
		public function NetworkError(errorStr:String)
		{
			
		}
		/**
		 * socket 关闭异常 
		 */		
		public static const SOCKET_CLOSE_ERROR:String = "SOCKET_CLOSE_ERROR";
		
		/**
		 * 连接 已经关闭
		 */		
		public static const CONNECTION_HAS_CLOSED:String = "CONNECTION_HAS_CLOSED";
		
		/**
		 * http io 异常 
		 */		
		public static const HTTP_IO_ERROR:String = "HTTP_IO_ERROR";
		
		/**
		 * http 安全异常 
		 */		
		public static const HTTP_SECURITY_ERROR:String = "HTTP_SECURITY_ERROR";
		
		/**
		 * json 字符串格式异常 
		 */		
		public static const JSON_STRING_FORMAT_ERROR:String = "JSON_STRING_FORMAT_ERROR";
		
	}
}