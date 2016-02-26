load './struct/Tree.rb'
load './struct/Node.rb'

myTree = Tree.new(Node.new(6))
myTree.addInTree(7)
myTree.addInTree(3)
myTree.addInTree(8)
myTree.addInTree(11)
myTree.addInTree(2)
myTree.addInTree(5)

myTree.start_preOrder(lambda{|x| puts "#{x.getData()}"})

array_code = myTree.start_searchCode(8)
array_code.times