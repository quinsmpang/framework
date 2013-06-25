package frame.view.viewLayer
{
	import flash.display.DisplayObject;
	import flash.geom.Rectangle;
	
	import frame.view.UILayoutStrategyEnum;
	import frame.view.viewDelegate.BaseViewer;
	
	import mx.core.UIComponent;
	
	/**
	 * 层显示基类 
	 * @author songdu.greg
	 * 
	 */	
	public class BaseViewLayer extends UIComponent
	{
		protected var layerRect:Rectangle = null;
		
		public static const TOP_BAR_HEIGHT:Number = 30; //顶部区域高度
		public static const BOTTOM_BAR_HEIGHT:Number = 30; // 底部区域高度
		
		
		protected var layoutStrategy:String = "";
		private static const ZERO:Number = 0;
		private var _layerWidth:Number = 200;
		private var _layerHight:Number = 100;
		
		private var _childViewer:DisplayObject;
//==============================================================================
// Public Functions
//==============================================================================
		public function BaseViewLayer()
		{
			super();
		}	
		
		public function setLayoutStrategy(strategy:String):void
		{
			this.layoutStrategy = strategy;
		}
		
		public function setLayerRect(layerRect:Rectangle):void
		{
			layerRect = layerRect.clone();
			_layerWidth = layerRect.width;
			_layerHight = layerRect.height;
			this.adjustViewerPosition();
		}
		
		/**
		 * 将 viewer 放置于 layer 中。 layer 中的 viewer 会根据之前设置的 layout 自动调整自己的位置。<br>
		 * 如果之前该UI已经存在，则不做任何操作。
		 * @param viewer
		 *
		 */
		public function addViewerToLayer(viewer:DisplayObject):void
		{
			if (!this.contains(viewer))
			{
				// 先清空本 layer 上所有已存在的 viewer
				while (this.numChildren > 0)
				{
					// 添加的时候做了控制，所以取出来的时候肯定是这个类型
					var childViewer:DisplayObject = DisplayObject(this.getChildAt(0));
					if (childViewer is BaseViewer)
						BaseViewer(childViewer).dispose();
					this.removeChild(childViewer);
					
				}
				_childViewer = viewer;
				this.addChild(viewer);
				
				this.adjustViewerPosition();
			}
		}
//------------------------------------------------------------------------------
// Private
//------------------------------------------------------------------------------
		protected function adjustViewerPosition():void
		{
			if (layerRect != null)
			{
				this.x = layerRect.x;
				this.y = layerRect.y;
				this.scrollRect = new Rectangle(0, 0, layerRect.width, layerRect.height);
			}
			switch (layoutStrategy)
			{
				case UILayoutStrategyEnum.LAYER_BG:
				{
					_childViewer.x = ZERO;
					_childViewer.y = ZERO;
					break;
				}
				case UILayoutStrategyEnum.LAYER_MAIN:
				case UILayoutStrategyEnum.POPUP_WINDOW:
				{
					_childViewer.x = Math.floor((_layerWidth - _childViewer.width) / 2);
					_childViewer.y = Math.floor((_layerHight - _childViewer.height) / 2);
					break;
				}
					
				case UILayoutStrategyEnum.LAYER_TOP:
				{
					_childViewer.x = Math.floor((_layerWidth - _childViewer.width) / 2);
					_childViewer.y = ZERO;
					break;
				}
					
				case UILayoutStrategyEnum.LAYER_BOTTOM:
				{
					_childViewer.x = Math.floor((_layerWidth - _childViewer.width)/2);
					_childViewer.y = 630;
					break;
				}
					
				case UILayoutStrategyEnum.LAYER_LEFT:
				{
					_childViewer.x = ZERO;
					_childViewer.y = _layerHight - _childViewer.height;
					break;
				}
					
				case UILayoutStrategyEnum.LAYER_RIGHT:
				{
					_childViewer.x = Math.floor((_layerWidth - _childViewer.width));
					_childViewer.y = _layerHight - _childViewer.height;
					break;
				}	
				
				case UILayoutStrategyEnum.DIALOG_LAYER:
				case UILayoutStrategyEnum.POPUP_WINDOW:
				{
					_childViewer.x = Math.floor((_layerWidth - _childViewer.width) / 2);
					_childViewer.y = Math.floor((_layerHight - _childViewer.height) / 2);
					break;
				}
			}
		}
//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
// Event
//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-	
	}
}