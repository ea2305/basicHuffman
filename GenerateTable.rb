class GenerateTable

    @masterArray

    def initialize(masterArray = "")
        @masterArray = masterArray
    end

    def loadTable(array)
        @masterArray = array
    end

    def get_Table(values)
        s_data = values
        c_data = s_data.split("")
        puts("#{c_data}")
    end
end

gen = GenerateTable.new()#generamos la instancia del objeto

puts("#{gen.loadTable("Elihu")}")
