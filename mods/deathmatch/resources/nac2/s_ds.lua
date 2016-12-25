addEventHandler( "onElementCreate", getRootElement(),
	function()
		local NAC = exports.edf:edfGetElementProperty( source, "NAC" )
		if NAC then
			if getElementType( source ) == "object" then
				setTimer( setElementDoubleSided, 500, 1, source, true )
				setTimer( callClientFunction, 700, 1, exports.edf:edfGetCreatorClient(source), "exportsDeditor_mainDDselectElement", source )
			end
		end
	end
)




function callClientFunction(client, funcname, ...)
    local arg = { ... }
    if (arg[1]) then
        for key, value in next, arg do
            if (type(value) == "number") then arg[key] = tostring(value) end
        end
    end
    -- If the clientside event handler is not in the same resource, replace 'resourceRoot' with the appropriate element
    triggerClientEvent(client, "onServerCallsClientFunction", resourceRoot, funcname, unpack(arg or {}))
end

function callServerFunction(funcname, ...)
    local arg = { ... }
    if (arg[1]) then
        for key, value in next, arg do arg[key] = tonumber(value) or value end
    end
    loadstring("return "..funcname)()(unpack(arg))
end
addEvent("onClientCallsServerFunction", true)
addEventHandler("onClientCallsServerFunction", resourceRoot , callServerFunction)