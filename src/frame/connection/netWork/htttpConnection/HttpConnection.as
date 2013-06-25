package frame.connection.netWork.htttpConnection
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	
	import frame.connection.error.NetworkError;
	import frame.connection.netWork.MessageStructure;
	
	
	/**
	 * http 连接封装类 
	 * @author songdu.greg
	 * 
	 */	
	public class HttpConnection extends EventDispatcher
	{
		private var _urlLoader:URLLoader = null;
//==============================================================================
// Public Functions
//==============================================================================
		public function HttpConnection(target:IEventDispatcher=null)
		{
			
//			super(target);
			this._urlLoader = new URLLoader();
			this._urlLoader.dataFormat = URLLoaderDataFormat.TEXT;
			
			this.addListeners();
		}	
		
		/**
		 * 向服务端发http请求
		 * @param message
		 *
		 */
		public function sendMessage(message:MessageStructure):void
		{
			var url:String;
			var method:String;
			if (message.target == 'get' || message.target == null)
			{
//				url = ServerConfig.INDEX;
				method = URLRequestMethod.GET;
			}
			else
			{
//				url = ServerConfig.HANDLER;
				method = URLRequestMethod.POST;
			}
			var req:URLRequest = new URLRequest(url);
			var variables:URLVariables = new URLVariables();
						
			req.data = variables;
			req.method = method;
			
			this._urlLoader.load(req);
		}
		
		public function dispose():void
		{
			this.removeListeners();
			_urlLoader = null;
		}
//------------------------------------------------------------------------------
// Private
//------------------------------------------------------------------------------
		private function addListeners():void
		{
			this._urlLoader.addEventListener(IOErrorEvent.IO_ERROR, httpIOErrorHnadler);
			this._urlLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, httpSecurityErrorHandler);
			this._urlLoader.addEventListener(Event.COMPLETE, httpLoadCompleteHandler);
		}
		
		private function removeListeners():void
		{
			this._urlLoader.removeEventListener(IOErrorEvent.IO_ERROR, httpIOErrorHnadler);
			this._urlLoader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, httpSecurityErrorHandler);
			this._urlLoader.removeEventListener(Event.COMPLETE, httpLoadCompleteHandler);
		}
//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
// Event
//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
		private function httpIOErrorHnadler(evt:IOErrorEvent):void
		{
			throw new NetworkError(NetworkError.HTTP_IO_ERROR);
		}
		
		private function httpSecurityErrorHandler(evt:SecurityErrorEvent):void
		{
			throw new NetworkError(NetworkError.HTTP_SECURITY_ERROR);
		}
		
		/**
		 * 从http接受数据完成 
		 * @param evt
		 * 
		 */		
		private function httpLoadCompleteHandler(evt:Event):void
		{
			var infoStr:String = evt.target.data as String;
		}
	}
}