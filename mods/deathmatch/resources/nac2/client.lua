sizex,sizey = guiGetScreenSize()
gui = {}
gui.main = {}
gui.line = {}
gui.curve = {}

addEventHandler( "onClientResourceStart", getResourceRootElement(getThisResource()),
	function()
		gui.window = guiCreateWindow( sizex-410, sizey-160, 400, 150, "NAC", false )
		gui.main.doLine = guiCreateButton( 10, 20, 380, 57, "Line", false, gui.window )
		gui.main.doCurve = guiCreateButton( 10, 83, 380,57, "Curve", false, gui.window )
		
		gui.line.scrollLab = guiCreateLabel( 20, 25, 160, 20, "Count:", false, gui.window )
		gui.line.scroll = guiCreateScrollBar( 10, 50, 380, 20, true, false, gui.window )
		guiScrollBarSetScrollPosition( gui.line.scroll, 16 )
		gui.line.ok = guiCreateButton( 20, 120, 175, 25, "Ok", false, gui.window )
		gui.line.cancel = guiCreateButton( 205, 120, 175, 25, "Cancel", false, gui.window )
		
		gui.curve.left = guiCreateRadioButton( 10, 20, 70, 20, "Left", false, gui.window )
		gui.curve.right = guiCreateRadioButton( 80, 20, 70, 20, "Right", false, gui.window )
		guiRadioButtonSetSelected( gui.curve.left, true )
		gui.curve.scrollCLab = guiCreateLabel( 20, 40, 100, 20, "Count:", false, gui.window )
		gui.curve.scrollC = guiCreateScrollBar( 90, 40, 300, 20, true, false, gui.window )
		guiScrollBarSetScrollPosition( gui.curve.scrollC, 16 )
		gui.curve.scrollPLab = guiCreateLabel( 20, 60, 100, 20, "Percent:", false, gui.window )
		gui.curve.scrollP = guiCreateScrollBar( 90, 60, 300, 20, true, false, gui.window )
		guiScrollBarSetScrollPosition( gui.curve.scrollP, 25 )
		gui.curve.scrollALab = guiCreateLabel( 20, 80, 100, 20, "Precision:", false, gui.window )
		gui.curve.scrollA = guiCreateScrollBar( 90, 80, 300, 20, true, false, gui.window )
		guiScrollBarSetScrollPosition( gui.curve.scrollA, 50 )
		gui.curve.ok = guiCreateButton( 20, 120, 175, 25, "Ok", false, gui.window )
		gui.curve.cancel = guiCreateButton( 205, 120, 175, 25, "Cancel", false, gui.window )
		
		guiSetVisible( gui.window, false )
		setTimer( showGUIPanel, 100, 1, "line", false )
		setTimer( showGUIPanel, 100, 1, "curve", false )
		setTimer( guiSetVisible, 200, 1, gui.window, true )
		
		addEventHandler( "onClientGUIClick", getRootElement(), guiOnClick )
		addEventHandler( "onClientGUIScroll", getRootElement(), guiOnScroll )
	end
)

function showGUIPanel( panel, show )
	for k,v in pairs(gui[panel]) do
		guiSetVisible( v, show )
	end
end

function guiOnClick()
	if source == gui.main.doLine then
		startCreator("line")
	elseif source == gui.main.doCurve then
		startCreator("curve")
	elseif source == gui.line.cancel or source == gui.curve.cancel then
		cancelCreator()
	elseif source == gui.line.ok or source == gui.curve.ok then
		finishCreator()
	elseif source == gui.curve.left or source == gui.curve.right then
		updateObjects()
	end
end

function guiOnScroll()
	if table.find(gui.line, source) or table.find(gui.curve, source) then
		updateObjects()
	end
end