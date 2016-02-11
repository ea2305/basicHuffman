class GenerateTable

    @masterArray

    def initialize(masterArray = "")
        @masterArray = masterArray
    end

    def loadTable(array)
        @masterArray = array
    end


    def get_Table()
        s_data = ""
        c_data = s_data.split("")

        puts("#{c_data}")
    end
end
