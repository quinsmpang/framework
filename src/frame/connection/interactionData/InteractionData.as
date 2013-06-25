package frame.connection.interactionData
{
	/**
	 * 和服务端交互数据 
	 * @author songdu.greg
	 * 
	 */	
	public class InteractionData implements IInteractionData
	{
		private var _data:Object = null;
		private var _dataType:String = "";
//==============================================================================
// Public Functions
//==============================================================================
		public function get data():Object
		{
			return _data;
		}
		
		public function setData(value:Object, type:String):void
		{
			_data = value;
			_dataType = type;
		}	
		
		public function get dataType():String
		{
			return dataType;
		}
		
//------------------------------------------------------------------------------
// Private
//------------------------------------------------------------------------------

//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
// Event
//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-	
	}
}