/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */

class Solution {
        func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil {
            return true
        }

        if !(p != nil && q != nil) {
            return false
        }

        if (p!.val == q!.val){
            return isSameTree(p!.left, q!.left) && isSameTree(p!.right, q!.right)
        }

        return false
    }


    func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        if (root == nil && subRoot == nil){
            return true
        }

        if (root == nil && subRoot != nil) { //root는 nil이 아닌 상황 
            return false
        }

        if (root != nil && subRoot == nil) {
            return isSubtree(root!.left, subRoot) || isSubtree(root!.right, subRoot)
        }

        //root도 nil이 아니고 subRoot도 nil이 아닌 상황
        if root!.val != subRoot!.val {
            return isSubtree(root!.left, subRoot) || isSubtree(root!.right, subRoot)
        }

        return isSameTree(root, subRoot) || isSubtree(root!.left, subRoot) || isSubtree(root!.right, subRoot)
    }
}