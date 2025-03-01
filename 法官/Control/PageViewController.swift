import UIKit
 
class PageViewController: UIPageViewController,UIPageViewControllerDataSource {
    var judge = 0
    //所有页面的视图控制器
    private(set) lazy var allViewControllers: [UIViewController] = {
        return [self.getViewController(indentifier: "Rookie1ViewController"),
                self.getViewController(indentifier: "Rookie2ViewController"),
                self.getViewController(indentifier: "Rookie3ViewController")]
    }()
    
    //页面加载完毕
    override func viewDidLoad() {
        super.viewDidLoad()
        //返回
        if(judge == 1){
            
        }
        
        //数据源设置
        dataSource = self
        
        //设置首页
        if let firstViewController = allViewControllers.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
    }
    
    //根据indentifier获取Storyboard里的视图控制器
    private func getViewController(indentifier: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil) .
        instantiateViewController(withIdentifier: "\(indentifier)")
    }
    
    //获取前一个页面
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = allViewControllers.firstIndex(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        //如果当前是首页，向右滑显示最后一个页面
        guard previousIndex >= 0 else {
            return allViewControllers.last
        }
        
        guard allViewControllers.count > previousIndex else {
            return nil
        }
        
        return allViewControllers[previousIndex]
    }
    
    //获取后一个页面
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = allViewControllers.firstIndex(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = allViewControllers.count
        
        guard orderedViewControllersCount != nextIndex else {
            return allViewControllers.first
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        return allViewControllers[nextIndex]
    }
}
