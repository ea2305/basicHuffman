class AddTree
    
    def initialize(root = nil, compare = lambda do |node| node.getData() end)
        @root = root
        @compare = compare
    end

    def add(value)
        puts "in class"     
        puts @root.getData()     
        addInNode(value, @root, 0)     
    end
    
    #Agregar al nodo por gerarqui da valor
    def addInNode(value,node, level)
        temp_compare = @compare.call(value, node)
        
        #Verificamos que el arbol no cuente con elementos repetidos.
        if temp_compare == 0
            return
        end
        level += 1
        if temp_compare > 0 ##Ejecuta la lambda de comparacion
            if node.getRight() == nil
                temp = Node.new(value)
                temp.setLevel(level)
                node.setRight(temp)
            else    
                addInNode(value, node.getRight(), level)
            end
        else
            if node.getLeft() == nil
                temp = Node.new(value)
                temp.setLevel(level)
                node.setLeft(temp)
            else    
                addInNode(value, node.getLeft(), level)
            end
        end 
    end
    
    #Inicializa el valor de la raiz
    def setRoot(root = nil)
        @root = root
    end
end