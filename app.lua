function minifier()
    if (#(arg)) ~= 2 then
        print("No input args passed")
        print("arg[1] = input file path")
        print("arg[1] = output file path")
        return
    end
    path = arg[1]
    outputPath = arg[2]
    file = io.open(path, "r")
    fileMinified = ""
    for line in file:lines() do
        endChar = line:sub(#(line), #(line))
        if endChar == ";" or endChar == "{" or endChar == "}" then
            fileMinified = fileMinified .. line .. " "
            goto continue
        end
        fileMinified = fileMinified .. line .. ";"
        ::continue::
    end
    file:close()

    outFile = io.open(outputPath, "w+")
    outFile:write(fileMinified)
    outFile:close()
    
end

minifier()