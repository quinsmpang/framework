package frame.view.viewDelegate
{
	import frame.view.viewInterface.IViewer;
	
	import mx.core.UIComponent;
	
	/**
	 * viewer 基类 
	 * @author songdu.greg
	 * 
	 */	
	public class BaseViewer extends UIComponent implements IViewer
	{
		public var needLoading:Boolean = true;
		
//==============================================================================
// Public Functions
//==============================================================================
		public function BaseViewer()
		{
			super();
		}
		
		public function dispose():void
		{
			
		}
		
		public function initModel():void
		{
			
		}
		
		public function infoUpdate(data:Object, msgName:String):void
		{
			
		}
		
//------------------------------------------------------------------------------
// Private
//------------------------------------------------------------------------------
	
//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
// Event
//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

	}
}