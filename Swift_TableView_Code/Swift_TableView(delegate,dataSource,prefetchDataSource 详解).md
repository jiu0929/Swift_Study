#Swift_TableView(delegate,dataSource,prefetchDataSource 详解)

---
[GitHub](https://github.com/XuBaoLoveEatFish/Swift_Study)

````
import UIKit

let identifier = "cellIdentifier"

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITableViewDataSourcePrefetching {
    
    lazy var tableView: UITableView = {
        
        let tempTableView = UITableView(frame: CGRect(x: 0, y: 20, width: self.view.bounds.size.width, height: self.view.bounds.size.height), style: UITableViewStyle.plain)
        tempTableView.delegate = self // 代理
        tempTableView.dataSource = self // 数据源
        tempTableView.prefetchDataSource = self // 预处理数据源
        
        return tempTableView
    }()
    
    lazy var rowArray: Array<Int> = {
        
        let array = [1,2,3,4,5,6,7,8,9]
        
        return array
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.tableView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    /// MARK: UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        print("numberOfSections:1")
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("numberOfRowsInSection_cell的个数:\(self.rowArray.count)")
        return self.rowArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("cellForRowAt_cell:可自定义")
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier) // 根据 identifier 从缓冲区取出
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: identifier)
        }
        
        cell?.textLabel?.text = "\(self.rowArray[indexPath.row])"
        return cell!
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "titleForHeaderInSection"
    }
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "titleForFooterInSection"
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        print("cell是否可以编辑")
        return true
    }
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        print("cell是否可以移动")
        return true
    }
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        print("右侧索引")
        return ["a", "b", "c"]
    }
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        print("根据所点击的索引定位到相应的Section")
        if title == "a" {
            print("点击 a 定位到第一个 section")
            return 1
        }
        return 1
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        print("编辑的方式")
        return .delete
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        print("移动cell后对数据源做相应的处理")
    }
    
    /// MARK: UITableViewDataSourcePrefetching
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        print("这个协议方法提供一个数组，这个数组提示了按着本次滑动方向，再接下去要碰到哪些indexPaths了，以UITableView为例，回调过来的这个数组为当前屏幕边缘的indexPath的接下去（上或者下）第10个开始算的indexPath，大概一次5个这样。")
    }
    func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
        print("这个协议返回的数组用于在，当我们快速滑动到某个区域后又立刻按着反方向滑动，那么原本被预估要出现的几个indexPath会被取消掉这样，这个数组就是存储被取消预估的indexPath。")
    }
    
    /// MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        print("即将展示cell")
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        print("即将展示header")
    }
    
    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        print("即将展示footer")
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        print("已经结束展示cell")
    }
    
    func tableView(_ tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int) {
        print("已经结束展示header")
    }
    
    func tableView(_ tableView: UITableView, didEndDisplayingFooterView view: UIView, forSection section: Int) {
        print("已经结束展示footer")
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        //设置cell高度
//    }
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        //设置header高度
//    }
    
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        //设置footer高度
//    }

//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        //预估cell高度 节约时间
//    }
   
//    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
//        //预估header高度 节约时间
//    }
    
//    func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
//        //预估footer高度 节约时间
//    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        //自定义header 视图
//    }
    
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        //自定义footer 视图
//    }
    
//    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
//        //扩展的点击效果 用以自定义点击效果
//    }
    
//    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
//        //点击cell是否允许高亮
//    }
    
//    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
//        //已经高亮
//    }
    
//    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
//        //解除高亮
//    }

//    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
//        //即将选中cell
//    }
    
//    func tableView(_ tableView: UITableView, willDeselectRowAt indexPath: IndexPath) -> IndexPath? {
//        //即将结束选中
//    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        //已经选中
//    }
    
//    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        //已经结束选中
//    }
    
//    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
//        //编辑形式
//    }
   
//    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
//        //删除的title
//    }
    
//    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
//        //编辑动作
//    }
    
//    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
//        //编辑内容是否缩进
//    }
    
//    func tableView(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath) {
//        //即将开始编辑
//    }
    
//    func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
//        //已经结束编辑
//    }
    
//    func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
//        //移动cell
//    }

//    func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
//        //内容缩进
//    }
    
//    func tableView(_ tableView: UITableView, shouldShowMenuForRowAt indexPath: IndexPath) -> Bool {
//        //是否展示菜单(复制/粘贴)
//    }
    
//    func tableView(_ tableView: UITableView, canPerformAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
//        //是否执行菜单中的动作
//    }
    
//    func tableView(_ tableView: UITableView, performAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) {
//        //执行菜单中的动作
//    }
    
//    func tableView(tableView: UITableView, canFocusRowAtIndexPath indexPath: NSIndexPath) -> Bool {
//        //返回能否获得焦点
//    }
    
//    func tableView(tableView: UITableView, shouldUpdateFocusInContext context: UITableViewFocusUpdateContext) -> Bool{
//        //返回是否将要更新焦点
//    }
    
//    func tableView(tableView: UITableView, didUpdateFocusInContext context: UITableViewFocusUpdateContext, withAnimationCoordinator coordinator: UIFocusAnimationCoordinator) {
//        //已经更新焦点时调用
//    }
    
//    func indexPathForPreferredFocusedViewInTableView(tableView: UITableView) -> NSIndexPath? {
//        //返回上一个焦点的indexPath
//    }
}
````