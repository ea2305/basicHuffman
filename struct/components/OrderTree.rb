=begin
    Recorridos de arbol binario
    *Pre Orider : obtiene el elemento central, izquierda y derecha
    *In Order : Obtiene ele elemento de izquierda, central y derecha
    *Pos Order : Obtiene el elemento de izquierda, derecha y central
=end

class OrderTree 

    #constructor
    def initialize(root = nil)
        @root = root
    end

    #*Pre Orider : obtiene el elemento central, izquierda y derecha    
    def method_preOrder(node,myLambda)
        if node != nil
            myLambda.call(node)
            method_preOrder(node.getLeft,myLambda)
            method_preOrder(node.getRight,myLambda)
        end
    end
    
    #Inicializa preOrder con los datos contenidos en el arbol.
    def preOrder(myLambda)
        if @root != nil
            method_preOrder(@root,myLambda)
        end
    end
    
    
    ##*In Order : Obtiene ele elemento de izquierda, central y derecha
    def method_posOrder(node,myLambda)
        if node != nil
            method_posOrder(node.getLeft,myLambda)
            method_posOrder(node.getRight,myLambda)
            myLambda.call(node)
        end
    end
    
    #Iniccializa posOrder con los datos del arbol
    def posOrder(myLambda)
        if @root != nil
            method_posOrder(@root,myLambda)
        end
    end 
    
    #*Pos Order : Obtiene el elemento de izquierda, derecha y central
    def method_inOrder(node,myLambda)
        if node != nil
            method_inOrder(node.getLeft,myLambda)
            myLambda.call(node)
            method_inOrder(node.getRight,myLambda)
        end
    end
    #Iniccializa inOrder con los datos del arbol
    def inOrder(myLambda)
        if @root != nil
            method_inOrder(@root,myLambda)
        end
    end
    
    # Function to  print level order traversal of tree
    def levelOrder(myLambda)
        h = height(@root)
        for i in 1..(h+1) 
            printGivenLevel(@root, i,myLambda)
        end
    end   
    
    # Print nodes at a given level
    def printGivenLevel(root , level, myLambda)
        if root == nil
            return
        end    
        if level == 1
            myLambda.call(root)
        else
            if level > 1 
                printGivenLevel(root.getLeft() , level - 1, myLambda)
                printGivenLevel(root.getRight() , level - 1, myLambda)
            end
        end
    end
    
    #Retorna la altura del arbol
    def height(node)
        if node == nil
            return 0
        else 
            #calcula el alto del arbol en cada nodo 
            lheight = height(node.getLeft())
            rheight = height(node.getRight())
    
            #devuelve el largo
            if lheight > rheight
                return lheight+1
            else
                return rheight+1
            end
        end
    end
end