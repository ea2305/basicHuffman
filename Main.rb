load './struct/Node.rb'
load './struct/Tree.rb'
load './struct/Information.rb'
load './words/Compare.rb'
load './words/GenerateTable.rb'
load './words/SortChars.rb'
load './huffman/GenerateCode.rb'

gen = GenerateTable.new  #generamos la instancia del objeto
comp = Compare.new
sort = SortChars.new

test = "aeiaeia"

elements = comp.allChars(test)

table = gen.get_Table(test,elements)

ordTable = sort.shortElements(table)
puts("Otros nuevos ele : #{ordTable}")
#puts("Otros nuevos ele : #{table}")

sort.printInformation(ordTable)

=begin
izquierda = Node.new("IZQUIERDA")
derecha = Node.new("DERECHA")
centro = Node.new("CENTRO",izquierda,derecha)
=end

puts"======>"

code_gen = GenerateCode.new

arbol_code = Tree.new(code_gen.makeTree(ordTable))##Obtenemos el nodo raiz para el arbol

myLambda = lambda {|node| node.getData().getCode()} # Creamos el metodo de impresion del arbol

arbol_code.start_inOrder(myLambda) ##Imprimimos los datos por in order
