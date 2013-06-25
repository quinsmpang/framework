package frame.view.viewInterface
{
	import frame.commonInterface.IDispose;
	import frame.commonInterface.INotifier;
	import frame.view.viewDelegate.BaseViewer;

	/**
	 * 控制器接口 
	 * @author songdu.greg
	 * 
	 */	
	public interface IViewerController extends IDispose, INotifier
	{
		/**
		 * 获取viewer 
		 * @return 
		 * 
		 */		
		function get viewer():BaseViewer;
		
		/**
		 * 设置ui加载状态 
		 * @param isReady
		 * 
		 */		
		function setReady(isReady:Boolean):void;
		
	}
}