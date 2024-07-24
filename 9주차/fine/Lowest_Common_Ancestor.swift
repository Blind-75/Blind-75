class TreeNode {
    let val: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root = root,let p = p, let q = q else  {return nil }

        var current: TreeNode? = root 

        while current != nil {
            if p.val > current!.val && q.val > current!.val {
                current = current!.right
            } else if p.val < current!.val && q.val < current!.val {
                current = current!.left
            } else {
                return current
            }
        }
        return nil 
    }
}