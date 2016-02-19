#author : Elihu Alejandro Cruz Albores
#version 1.0.5
#Estructura basica de un arbol binario
class Tree

    def initialize(root = nil)
        @root = root
        @level = 0
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

    def getLevel()
        tree_level(@root,0)
        return @level
    end

    def tree_level(node,count)
        if node == nil
            count -= 1
        else
            @level = (count > @level)? count : @level
            tree_level(node.getLeft(), count += 1)
            count -= 1 ##Disminuye la posicion del nodo
            tree_level(node.getRight(), count +=1)
        end
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
            myLambda.call(node)
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
            myLambda.call(node)
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
            myLambda.call(node)
            inOrder(node.getRight,myLambda)
        end
    end

    def start_inOrder(myLambda)
        if @root != nil
            inOrder(@root,myLambda)
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
                printGivenLevel(root.getLeft() , level-1, myLambda)
                printGivenLevel(root.getRight() , level-1, myLambda)
            end
        end
    end

    def height(node)
        if node == nil
            return 0
        else
            # Compute the height of each subtree
            lheight = height(node.getLeft())
            rheight = height(node.getRight())

            #Use the larger one
            if lheight > rheight
                return lheight+1
            else
                return rheight+1
            end
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

    #Busqueda de nodo por contendido, retrona las posiciones
    def searchCode(node,search,stack,myLambda)
        if node == nil
            stack.pop()
            return false
        else
            if search == myLambda.call(node)
                return true
            else
                stack.push(0)
                if searchCode(node.getLeft(),search,stack,myLambda) == true
                    return true
                else
                    stack.push(1)
                    if searchCode(node.getRight(),search,stack,myLambda) == true
                        return true
                    end
                end
                stack.pop() ##Si el elemento se encuentra en alguna otra rama
            end
        end

    end

    def start_searchCode(search,myLambda)
        if search == nil
            return -1
        else
            myStack = Array.new ##Almacenador del codigo para el arbol
            return (searchCode(@root,search,myStack,myLambda))? myStack : -1
        end
    end

    def printTree()
        print_node(@root)
    end

    def print_node(node)
        if node != nil
            return nil
        end

        for i in 0..@level do
            drawLevel(@root, i, @level)
        end
    end

    def drawLevel()
end
