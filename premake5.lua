newoption 
{
	trigger = "input",
	description = "file to be parsed",
}

newaction 
{
   	trigger     = "parse",
  	description = "generate a list of the most included files",
   	execute = function ()
    
   	local file = _OPTIONS["input"]
   
   	local lines = {}

    for line in io.lines(file) do 
   		lines[#lines + 1] = line
  	end
  	
  	local fileMap = {}

  	for k,v in ipairs(lines) do
  		if (v ~= nil) then
  			if v:sub(1,1) =="^" then
  				-- this is the source file
  			else
  				local temp = fileMap[v] -- = fileMap[v] + 1
  				if temp == nil then
  					fileMap[v] = 1
  				else
  					fileMap[v] = temp + 1	
  				end
  			end	
  		end	
  	end	

	-- collect the keys
    local keys = {}
    for k in pairs(fileMap) do keys[#keys+1] = k end

 	table.sort(keys, function(a,b) return fileMap[b] < fileMap[a] end)
    
   
    for k,v in ipairs(keys) do	
    	print(k,v,fileMap[v])
    end

    for k,v in pairs(fileMap) do
   		
    end
  	
   end
}