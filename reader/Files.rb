class Files

    def initialize(file = "")
        #Auto adaptation of files
        @file = file
    end

    def printLines
        File.open(@file).each do |line|
            print "#{line}\n"
        end
    end

    def readLines
        res = ""
        File.open(@file).each do |line|
            res += line + "\n"
        end
        return res
    end

    def writeLines(name = @file,text)
        file = File.new(name,"w+")
        file.puts(text)
        file.close
    end


end
