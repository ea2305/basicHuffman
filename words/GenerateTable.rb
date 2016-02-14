##Genera un vecotr de objetos de tipo Information, con el numero de repeticiones y el caracter.

class GenerateTable

    def initialize
    end
    
    ##Obtiene el numero de repeticiones del conjunto de datos por caracter
    #Y carga los datos al objeto Information del array
    def get_Table(value, elements)
        #arr_data = values.clone #recivimos el arreglo de elementos y copiamos
        countArray = Array.new()
        array = value.split("")
        
        for i in 0..(elements.length - 1)
            count = 0
            for j in 0..(array.length - 1)
                if elements[i].getCode() == array[j]
                     count += 1                   
                end
            end
            elements[i].setTimes(count)##Cargamos los datos al objeto Inormation                        
        end
        return elements
    end
end
