#Estructura basica de un arbol binario
class Tree
    
    @root = Node.new()
    
    #Inicializa el valor de la raiz
    def setRoot(root = nil)
        @root = root
    end
    
    #Asigna nodo en la posicion izquierda
    def setLeft(nodeCurrent, nodeLeft)
        return nodeCurrent.setLeft(nodeLeft)
    end
        
    #Asigna un nodo en la direccion derecha
    def setRight(nodeCurrent, nodeRight)
        return nodeCurrent.setRight(nodeRight)
    end
    
=begin
    Recorridos de arbol binario
    *Pre Orider : obtiene el elemento central, izquierda y derecha
    *In Order : Obtiene ele elemento de izquierda, central y derecha
    *Pos Order : Obtiene el elemento de izquierda, derecha y central
=end   
    def preOrder(node)
        if node != nil
            puts(node.getData())
            preOrder(node.getLeft)
            preOrder(node.getRight)
        end
    end
    
    def start_preOrder()
        if @root != nil
            preOrder(@root)
        end
    end
    
    def posOrder(node)
        if node != nil
            preOrder(node.getLeft)
            preOrder(node.getRight)
            puts(node.getData())
        end
    end
    
    def start_posOrder()
        if @root != nil
            posOrder(@root)
        end
    end 

    def inOrder(node)
        if node != nil
            preOrder(node.getLeft)
            puts(node.getData())
            preOrder(node.getRight)
        end
    end
    
    def start_inOrder()
        if @root != nil
            inOrder(@root)
        end
    end
    
=begin
    Fin de recorridos de alrbol 
=end
    
    #Agregar al arbol completo
    def addInTree(value)
        if @root == nil
            setRoot(Node.new(value))
        else
            addInNode(value, @root)   
        end        
    end
    
    #Agregar al nodo por gerarqui da valor
    def addInNode(value,node)
        if value > node.getData()
            if node.getRight() == nil
                node.setRight(Node.new(value))
            else
                addInNode(value, node.getRight())    
            end
        else
            if node.getLeft() == nil
                node.setLeft(Node.new(value))
            else
                addInNode(value, node.getLeft())
            end
        end 
    end
end
