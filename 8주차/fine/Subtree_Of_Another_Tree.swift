 public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
    self.val = val
    self.left = left
    self.right = right
     }
  }

  class Solution {
    func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        
        if subRoot == nil {
            return true 
        }
        if root == nil {
            return false  
        }
        if isSameTree(root, subRoot){
            return true
        }
        return isSubtree(root!.left, subRoot) || isSubtree(root!.right,subRoot)


    }
      func isSameTree(_ p: TreeNode?, _q: TreeNode?) -> Bool{
    if p == nil && q == nil {
        return true 
    }
    if p == nil || q == nil {
        return false 
    }
    if p!.val != q!.val {
        return false 
    }

    return isSameTree(p!.left, p!.left) && isSameTree(p!.right, q!.right)

  }

}

