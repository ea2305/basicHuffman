=begin
    Conjunto de metodos para remover elementos de arbol binario 
    author : Elihu Alejandro Cruz Albores
    version : 1.0.3
=end
class RemoveTree
    
    def initialize(root = nil, compare = lambda do |node| return node.getData() end)
        @root = root
        @compare = compare
    end
    
    ##Elimina un nodo del arbol binario
    def delete(value)
	   
       if @root == nil 
           return false
       end
      
       #Obtenemos el nodo a remover
	   toRemove = selectElement(value,@root)
        
       ## Mandamos a buscar al padre del nodo
       father = getFather(value,@root,toRemove)
       
       if !isLeaft(toRemove,father) ## remueve elemento al encontrarlo y sea hoja
           promote(toRemove,father) ##Verificamos si es hijo unico
       end
              
       return true
    end
    
    ##Verifica si el nodo es una hoja y la elimina
    def isLeaft(node,father)
        if (node.getLeft() == nil && node.getRight() == nil)
            if father.getData() < node.getData()
               father.setRight(nil)
           else
               father.setLeft(nil)
           end
           return node
       end   
       return nil     
    end
    
    #Obtiene el mejor remplazo para el nodo dado
    def promote(node,father)
    
        if (node.getLeft() == nil)
            current = nil
            tempNode = node.getRight()
            while tempNode != nil do
                current = tempNode
                tempNode = tempNode.getLeft()
            end
        else
            tempNode = node.getLeft()
            current = tempNode
            while tempNode != nil do
                current = tempNode
                tempNode = tempNode.getRight()
            end
        end
            #Obtenemos nodo padre
            newParent = getFather(current.getData(),@root,current)
            getLastChild(current,newParent)
                
            current.setLeft(node.getLeft())
            current.setRight(node.getRight())
            
            if father.getData() < node.getData()
               father.setRight(current)
            else
               father.setLeft(current)
            end
            
    end
    
    def getLastChild(node,father)
        if father.getData() < node.getData()
            father.setRight(node.getLeft())
            if father.getRight() == nil
                father.setRight(node.getRight())
            end
        else
            father.setLeft(node.getRight())
            if father.getLeft() == nil
                father.setLeft(node.getLeft())
            end
        end
    end
    
    #Obtiene el padre de un elemento buscado
    def getFather(value, node, toRemove)        
        current = node ##asignamos variable para recorrido
        
        while(current != nil) do ##Recorremos hasta encontrar o no encontrarlo
            if toRemove.getData() > current.getData() #Decidimos direccion
                if current.getRight() == toRemove
                    return current
                else
                    current = current.getRight() #dezplazamiento a derecha
                end
            else    
                if current.getLeft() == toRemove
                    return current
                else    
                    current = current.getLeft()
                end
            end     
        end 
        
        return nil
    end
    
    #Obtiene el nodo de un elemento buscado
    def selectElement(value, node)
        if node != nil
            lastElement = node
            comparacion = @compare.call(value,node)

            if comparacion == 0
                return lastElement
            end

            if comparacion > 0
                return selectElement(value, node.getRight())
            else
                return selectElement(value, node.getLeft())
            end  
        end
    end
end