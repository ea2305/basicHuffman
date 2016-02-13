load './struct/Information.rb'

class GenerateTable

    def initialize
    end

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
            
            countArray.push(count) 
                        
        end
        return allComponents(elements,countArray)
    end
    
    def allComponents(elements,values)
        
        table = Array.new()
    
        for i in 0..(elements.length - 1)
            elements[i].setTimes(values[i]) 
        end
        
        return table
    end
end
