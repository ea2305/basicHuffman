##Ordenamiento de tabla de frecuencias

class SortChars
    
    def shortElements(elements)#ordena tabla de elementos
        
        puts("Elementos array : #{elements.length}")
        size = elements.length
        
        for i in 0..(size - 1)
        
            for j in 0..(size - 2)
            
                if (elements[j][1] > elements[(j + 1)][1])
                
                    temp = elements[j + 1]#asignacion de
                    elements[(j + 1)] = elements[j]
                    elements[j] = temp 
                end 
            end    
        end
        return elements
    end

end
