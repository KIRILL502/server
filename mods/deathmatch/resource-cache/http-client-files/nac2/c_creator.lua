local workingElement = nil
local objLen = 1
local mode = ""
local elementsData = {}

function startCreator( lmode )
	local elem = exports.editor_main:getSelectedElement()
	if not elem then
		return outputChatBox( "Please select object.", 255, 0, 0 )
	end
	
	if getElementType(elem) == "object" then
		local bb = {exports.edf:edfGetElementBoundingBox( elem )}
		objLen = math.max(unpack(bb))-math.min(unpack(bb))
		workingElement = elem
		mode = lmode
		showGUIPanel( "main", false )
		showGUIPanel( lmode, true )
		updateObjects()
		addEventHandler( "onClientRender", getRootElement(), moverWork )
	else
		return outputChatBox( "Please select object.", 255, 0, 0 )
	end
end

function cancelCreator()
	removeEventHandler( "onClientRender", getRootElement(), moverWork )
	showGUIPanel( "main", true )
	showGUIPanel( mode, false )
	for i,v in ipairs(elementsData) do
		destroyElement( v.element )
	end
	elementsData = {}
	objLen = 0
	workingElement = nil
	mode = ""
end

function finishCreator()
	removeEventHandler( "onClientRender", getRootElement(), moverWork )
	showGUIPanel( "main", true )
	showGUIPanel( mode, false )
	for i,v in ipairs(elementsData) do
		local props = {}
		props.model = getElementModel( v.element )
		props.position = {getElementPosition( v.element )}
		props.rotation = {getElementRotation( v.element )}
		props.NAC = true
		destroyElement( v.element )
		exports.editor_main:doCreateElement( "object", "editor_main", props, false )
	end
	elementsData = {}
	objLen = 0
	workingElement = nil
	mode = ""
end

function updateObjects()
	for i,v in ipairs(elementsData) do
		destroyElement( v.element )
	end
	elementsData = {}
	
	local x,y,z = exports.edf:edfGetElementPosition(workingElement)
	local rx,ry,rz = exports.edf:edfGetElementRotation(workingElement)
	local mat = getMatrix( x, y, z, rx, ry, rz )
	
	if mode == "line" then
		local count = math.floor(guiScrollBarGetScrollPosition( gui.line.scroll )/4)
		for i=1,count do
			--local endX,endY = getPointFromDistanceRotation(x,y,objLen*i,0)
			local item = {}
			item.element = nil
			item.pos = {0,objLen*i,0}
			item.rot = {0,0,0}
			table.insert(elementsData, item)
		end
		
	elseif mode == "curve" then
		local count = math.floor(guiScrollBarGetScrollPosition( gui.curve.scrollC )/4)
		local percent = math.floor(guiScrollBarGetScrollPosition( gui.curve.scrollP ))
		local prec = guiScrollBarGetScrollPosition( gui.curve.scrollA )/100+0.5
		local t_len = count*(objLen/prec)
		local l_cir = t_len*(100/percent)
		local radius = (l_cir/math.pi)/2
		local reverse = guiRadioButtonGetSelected( gui.curve.left )
		if reverse then radius = -radius end
		local pangle = ((percent/100)*360)/count
		
		local ccx,ccy = getPointFromDistanceRotation(x,y,radius,-rz+90)
		
		for i=1,count-1 do
			local endX,endY = getPointFromDistanceRotation(ccx,ccy,radius,(reverse and -pangle*i-90-rz) or pangle*i-90-rz)
			local item = {}
			item.element = nil
			item.dist = getDistanceBetweenPoints2D( x, y, endX, endY )
			item.dir = findRotation( x, y, endX, endY )-rz
			item.z = 0
			item.rotZ = (reverse and pangle*i) or -pangle*i
			
			item.pos = getOffsetFromXYZ( mat, {endX, endY, z} )
			item.rot = {0, 0, item.rotZ}
			--item.pos[3] = ((objLen*(536/673))/prec)*(math.sin(math.rad(rx)))*i
			table.insert(elementsData, item)
		end
		
	end
	createObjects()
end

function createObjects()
	local x,y,z = exports.edf:edfGetElementPosition(workingElement)
	local rx,ry,rz = exports.edf:edfGetElementRotation(workingElement)
	local mat = getMatrix( x, y, z, rx, ry, rz )
	for i,v in ipairs(elementsData) do

			local endX,endY,endZ = getPositionFromElementOffset(mat,unpack(v.pos))
			local r = v.rot
			v.element = createObject( exports.edf:edfGetElementProperty(workingElement,"model"), endX, endY, endZ, rx+r[1], ry+r[2], rz+r[3] )

		setElementDoubleSided( v.element, true )
		setElementDimension( v.element, exports.editor_main:getWorkingDimension() )
	end
end

function moverWork()
	if getElementDimension(workingElement) ~= exports.editor_main:getWorkingDimension() then return end

	local x,y,z = exports.edf:edfGetElementPosition(workingElement)
	local rx,ry,rz = exports.edf:edfGetElementRotation(workingElement)
	local mat = getMatrix( x, y, z, rx, ry, rz )
	for _,element in ipairs(elementsData) do
		if element.element then

				local endX,endY,endZ = getPositionFromElementOffset(mat,unpack(element.pos))
				local r = element.rot
				setElementPosition(element.element, endX, endY, endZ)
				setElementRotation(element.element, rx+r[1], ry+r[2], rz+r[3])

		end
	end
end

function exportsDeditor_mainDDselectElement( elem )
	exports.editor_main:selectElement( elem )
end