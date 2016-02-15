#Estructura basica de un arbol binario
class Tree
    
    @root = Node.new()
    
    def initialize(root = nil)
        @root = root
    end
    
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
    #*Pre Orider : obtiene el elemento central, izquierda y derecha
    def preOrder(node,myLambda)
        if node != nil
            puts(myLambda.call(node))
            preOrder(node.getLeft,myLambda)
            preOrder(node.getRight,myLambda)
        end
    end
    
    def start_preOrder(myLambda)
        if @root != nil
            preOrder(@root,myLambda)
        end
    end
    
    
    ##*In Order : Obtiene ele elemento de izquierda, central y derecha
    def posOrder(node,myLambda)
        if node != nil
            posOrder(node.getLeft,myLambda)
            posOrder(node.getRight,myLambda)
            puts(myLambda.call(node))
        end
    end
    
    def start_posOrder(myLambda)
        if @root != nil
            posOrder(@root,myLambda)
        end
    end 
    
    #*Pos Order : Obtiene el elemento de izquierda, derecha y central
    def inOrder(node,myLambda)
        if node != nil
            inOrder(node.getLeft,myLambda)
            puts(myLambda.call(node))
            inOrder(node.getRight,myLambda)
        end
    end
    
    def start_inOrder(myLambda)
        if @root != nil
            inOrder(@root,myLambda)
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
