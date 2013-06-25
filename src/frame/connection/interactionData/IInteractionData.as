package frame.connection.interactionData
{
	public interface IInteractionData
	{
		function get data():Object;
		
		function setData(value:Object,type:String):void;
		
		function get dataType():String;
	}
}