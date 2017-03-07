#Swift_ScrollView _ API详解

---

[GitHub](https://github.com/XuBaoLoveEatFish/Swift_Study)

````
class ViewController: UIViewController,UIScrollViewDelegate {
    
    var scrollView = UIScrollView()
    var imageView = UIImageView()
    var image = UIImage()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.image = UIImage.init(named: "test")!
        self.imageView.image = self.image
        
        self.view.backgroundColor = UIColor.green
        self.view.addSubview(self.scrollView)// 将ScrollView添加到视图上
        
        let width = self.view.bounds.size.width * 2
        let height = self.view.bounds.size.height * 2
        
        self.scrollView.frame = self.view.bounds // 设置scrollView的 frame
        self.scrollView.contentSize = CGSize(width:width, height:height) //设置scrollView的 contentSize
        self.scrollView.delegate = self // 设置scrollView的 代理
        
        
        print(self.scrollView.contentOffset) // scrollView左顶点的位置 可设置
        print(self.scrollView.contentInset) // scrollView 添加额外的滚动附近区域的内容 可设置
        self.scrollView.isDirectionalLockEnabled = true
        print(self.scrollView.isDirectionalLockEnabled) // 锁定垂直或水平滚动 可设置
        print(self.scrollView.bounces) // scrollView 回弹效果 可设置
        print(self.scrollView.alwaysBounceVertical) // 垂直回弹 可设置
        print(self.scrollView.alwaysBounceHorizontal) // 水平回弹 可设置
        print(self.scrollView.isPagingEnabled) // 分页 可设置
        print(self.scrollView.isScrollEnabled) // 滚动 可设置
        print(self.scrollView.showsHorizontalScrollIndicator) // 显示水平滚动条
        print(self.scrollView.showsVerticalScrollIndicator) // 显示垂直滚动条
        print(self.scrollView.scrollIndicatorInsets) // 调整指标insets的内部
        print(self.scrollView.indicatorStyle) // black with white border. good against any background
        print(self.scrollView.decelerationRate) // 减速速度
        
        //open func setContentOffset(_ contentOffset: CGPoint, animated: Bool) 设置 contentOffset
        //open func scrollRectToVisible(_ rect: CGRect, animated: Bool) 这个方法需要传入一个Rect 这个rect可以理解成在scrollview.contentView中frame 调用这个方法就会滚到rect所在的那个区域去
        //open func flashScrollIndicators() 短暂地显示滚动指示器 你应该在把滚动视图放在最前端时调用此方法。
        
        
        /*
         
         open var isTracking: Bool { get } // returns YES if user has touched. may not yet have started dragging
         
         open var isDragging: Bool { get } // returns YES if user has started scrolling. this may require some time and or distance to move to initiate dragging
         
         open var isDecelerating: Bool { get } // returns YES if user isn't dragging (touch up) but scroll view is still moving
         
         
         open var delaysContentTouches: Bool // default is YES. if NO, we immediately call -touchesShouldBegin:withEvent:inContentView:. this has no effect on presses
         
         open var canCancelContentTouches: Bool // default is YES. if NO, then once we start tracking, we don't try to drag if the touch moves. this has no effect on presses
         */
        
        //父视图是否可以将消息传递给子视图 yes是将事件传递给子视图 则不滚动 no是不传递则继续滚动
        //open func touchesShouldBegin(_ touches: Set<UITouch>, with event: UIEvent?, in view: UIView) -> Bool
        
        //父视图是否可以将消息传递给子视图 yes是将事件传递给子视图 则不滚动 no是不传递则继续滚动
        //open func touchesShouldCancel(in view: UIView) -> Bool
        
        print(self.scrollView.minimumZoomScale) // 最小的变焦比例 可设置
        print(self.scrollView.maximumZoomScale) // 最大的变焦比例 可设置
        print(self.scrollView.zoomScale) // 当前的变焦比例
        
        //open func setZoomScale(_ scale: CGFloat, animated: Bool) 设置变焦比例
        //open func zoom(to rect: CGRect, animated: Bool)
        
        print(self.scrollView.bouncesZoom)
        print(self.scrollView.isZooming)
        print(self.scrollView.isZoomBouncing)
        print(self.scrollView.scrollsToTop) //当用户点击状态栏时 是否滚动到顶部
        
        //panGestureRecognizer 拖动手势
        //pinchGestureRecognizer 变焦手势
        
        //keyboardDismissMode 键盘消失形式
        //refreshControl
        
        self.imageView.frame = CGRect(origin:CGPoint(x:0, y:0),size:CGSize(width:width, height:height))
        self.scrollView.addSubview(self.imageView)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /// MARK: UIScrollViewDelegate 代理
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("scrollViewDidScroll:scrollView 在滚动")
    }
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        print("scrollViewDidZoom:scrollView 在改变变焦比例")
    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        print("scrollViewWillBeginDragging:scrollView 即将被拖拽")
    }
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        print("scrollViewWillEndDragging:scrollView 即将结束拖拽")
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print("scrollViewDidEndDragging:scrollView 已经结束拖拽")
    }
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        print("scrollViewWillBeginDecelerating:scrollView 即将开始减速")
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("scrollViewDidEndDecelerating:scrollView 已经开始减速")
    }
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        print("scrollViewDidEndScrollingAnimation:scrollView 已经结束动画")
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        print("viewForZooming:scrollView 返回视图(viewForZooming)")
        return nil
    }
    func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) {
        print("scrollViewWillBeginZooming:scrollView 即将开始变焦")
    }
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        print("scrollViewDidEndZooming:scrollView 已经结束变焦")
    }
    func scrollViewShouldScrollToTop(_ scrollView: UIScrollView) -> Bool {
        print("scrollViewShouldScrollToTop:scrollView 即将回滚到顶部")
        return true
    }
    func scrollViewDidScrollToTop(_ scrollView: UIScrollView) {
        print("scrollViewShouldScrollToTop:scrollView 已经回滚到顶部")
    }
}



````