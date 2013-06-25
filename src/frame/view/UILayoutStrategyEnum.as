package frame.view
{
	/**
	 * ui显示策略枚举型枚举 
	 * @author songdu.greg
	 * 
	 */	
	public class UILayoutStrategyEnum
	{
		/**
		 * 背景视图（一般在舞台最下层） 
		 */			
		public static const LAYER_BG:String = "LAYER_BG";
		
		/**
		 * 主视图
		 */			
		public static const LAYER_MAIN:String = "LAYER_MAIN";
		
		/**
		 * 位置在屏幕顶部 
		 */		
		public static const LAYER_TOP:String = "LAYER_TOP";	
		
		/**
		 * 位置在屏幕底部 
		 */		
		public static const LAYER_BOTTOM:String = "LAYER_BOTTOM";
		
		/**
		 * 位置在屏幕左方 
		 */		
		public static const LAYER_LEFT:String = "LAYER_LEFT";
		
		/**
		 * 位置在屏幕右方 
		 */		
		public static const LAYER_RIGHT:String = "LAYER_RIGHT";
		
		/**
		 * pop up window 
		 */		
		public static const POPUP_WINDOW:String = "POPUP_WINDOW";		
		
		/**
		 * 对话框层 
		 */		
		public static const DIALOG_LAYER:String = "DIALOG_LAYER";
			
	}
}