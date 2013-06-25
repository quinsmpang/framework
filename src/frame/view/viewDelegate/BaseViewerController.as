package frame.view.viewDelegate
{
	
	import frame.command.AppNotification;
	import frame.command.BaseNotification;
	import frame.command.cmdInterface.INotification;
	import frame.view.viewInterface.IViewerController;
	
	/**
	 * viewer控制器基类 
	 * @author songdu.greg
	 * 
	 */	
	public class BaseViewerController implements IViewerController
	{
		public function BaseViewerController()
		{
			
		}
		
		public function get viewer():BaseViewer
		{
			return null;
		}
		
		public function dispose():void
		{
			
		}
		
		public function setReady(isReady:Boolean):void
		{
			
				
		}
		
		/**
		 * 发送通知 
		 * @param commandType
		 * @param data
		 * 
		 */		
		public function sendNotification(commandType:String, data:Object = null):void
		{
			var notification:INotification = new BaseNotification();
			notification.data = data;
			
			var note:AppNotification = new AppNotification(commandType, notification);
			note.dispatch();
		}
	}
}