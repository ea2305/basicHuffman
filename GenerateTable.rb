class GenerateTable

    @masterArray

    def initialize(masterArray = "")
        @masterArray = masterArray
    end

    def loadTable(array)
        @masterArray = array
    end

    def get_Table(value, elements)
        arr_data = values.clone #recivimos el arreglo de elementos y copiamos
    end
end

gen = GenerateTable.new()#generamos la instancia del objeto

elements = ["a","d","c"]

gen.get_Table(elements)
