GUIEditor_Window = {}
GUIEditor_Label = {}


local buttonItems = {}
marwinButtons = {}

function createMarwinButton(x,y,widht,height,text,bool,parent,info)
button = guiCreateStaticImage(x,y,widht,height,"false.png", bool,parent or nil)
table.insert(marwinButtons,button)
guiBringToFront(button)
label = guiCreateLabel(0,0,1,1,text,bool,button)
guiBringToFront(label)
setElementData(label,"parent",button)
setElementData(button,"info",info)
guiLabelSetVerticalAlign (label, "center")
guiLabelSetHorizontalAlign (label, "center")
addEventHandler("onClientMouseEnter",label,markButton2,false)
addEventHandler("onClientMouseLeave",label,unmarkButton2,false)
return label
end

function markButton2 ()
parent = getElementData(source,"parent")
guiStaticImageLoadImage (parent,"true.png")
setElementData(getLocalPlayer(),"clickedButton",parent)
end

function unmarkButton2 (b,s)
parent = getElementData(source,"parent")
guiStaticImageLoadImage (parent,"false.png")
setElementData(getLocalPlayer(),"clickedButton",false)
end



GUIEditor_Window[1] = guiCreateWindow(0.27, 0.25, 0.50, 0.50, "Выбор прицела", true) 
guiSetVisible (GUIEditor_Window[1], false)




ON = guiCreateButton(5,500,180,70,"Включить нумерацию",false,GUIEditor_Window[1])
guiSetFont(ON,"default-bold-small")
 addEventHandler ("onClientGUIClick", getRootElement(),
function(button, state, absoluteX, absoluteY)
if source == ON then
guiSetText ( P1, "1" )
guiSetText ( P2, "2" )
guiSetText ( P3, "3" )
guiSetText ( P4, "4" )
guiSetText ( P5, "5" )
guiSetText ( P6, "6" )
guiSetText ( P7, "7" )
guiSetText ( P8, "8" )
guiSetText ( P9, "9" )
guiSetText ( P10, "10" )
guiSetText ( P11, "11" )
guiSetText ( P12, "12" )
guiSetText ( P13, "13" )
guiSetText ( P14, "14" )
guiSetText ( P15, "15" )
guiSetText ( P16, "16" )
guiSetText ( P17, "17" )
guiSetText ( P18, "18" )
guiSetText ( P19, "19" )
guiSetText ( P20, "20" )
guiSetText ( P21, "21" )
guiSetText ( P22, "22" )
guiSetText ( P23, "23" )
guiSetText ( P24, "24" )
guiSetText ( P25, "25" )
guiSetText ( P26, "26" )
guiSetText ( P27, "27" )
guiSetText ( P28, "28" )
guiSetText ( P29, "29" )
guiSetText ( P30, "30" )
guiSetText ( P31, "31" )
guiSetText ( P32, "32" )
guiSetText ( P33, "33" )
guiSetText ( P34, "34" )
guiSetText ( P35, "35" )
guiSetText ( P36, "36" )
guiSetText ( P37, "37" )
guiSetText ( P38, "38" )
guiSetText ( P39, "39" )
guiSetText ( P40, "40" )
guiSetText ( P41, "41" )
guiSetText ( P42, "42" )
guiSetText ( P43, "43" )
guiSetText ( P44, "44" )
guiSetText ( P45, "45" )
guiSetText ( P46, "46" )
guiSetText ( P47, "47" )
guiSetText ( P48, "48" )
guiSetText ( P49, "49" )
guiSetText ( P50, "50" )
guiSetText ( P51, "51" )
guiSetText ( P52, "52" )
guiSetText ( P53, "53" )
guiSetText ( P54, "54" )
guiSetText ( P55, "55" )
guiSetText ( P56, "56" )
guiSetText ( P57, "57" )
guiSetText ( P58, "58" )
guiSetText ( P59, "59" )
guiSetText ( P60, "60" )
guiSetText ( P61, "61" )
guiSetText ( P62, "62" )
guiSetText ( P63, "63" )
guiSetText ( P64, "64" )
guiSetText ( P65, "65" )
guiSetText ( P66, "66" )
guiSetText ( P67, "67" )
guiSetText ( P68, "68" )
guiSetText ( P69, "69" )
guiSetText ( P70, "70" )
guiSetText ( P71, "71" )
guiSetText ( P72, "72" )
end
end
)

OFF = guiCreateButton(200,500,180,70,"Отключить нумерацию",false,GUIEditor_Window[1])
guiSetFont(OFF,"default-bold-small")
 addEventHandler ("onClientGUIClick", getRootElement(),
function(button, state, absoluteX, absoluteY)
if source == OFF then
guiSetText ( P1, "" )
guiSetText ( P2, "" )
guiSetText ( P3, "" )
guiSetText ( P4, "" )
guiSetText ( P5, "" )
guiSetText ( P6, "" )
guiSetText ( P7, "" )
guiSetText ( P8, "" )
guiSetText ( P9, "" )
guiSetText ( P10, "" )
guiSetText ( P11, "" )
guiSetText ( P12, "" )
guiSetText ( P13, "" )
guiSetText ( P14, "" )
guiSetText ( P15, "" )
guiSetText ( P16, "" )
guiSetText ( P17, "" )
guiSetText ( P18, "" )
guiSetText ( P19, "" )
guiSetText ( P20, "" )
guiSetText ( P21, "" )
guiSetText ( P22, "" )
guiSetText ( P23, "" )
guiSetText ( P24, "" )
guiSetText ( P25, "" )
guiSetText ( P26, "" )
guiSetText ( P27, "" )
guiSetText ( P28, "" )
guiSetText ( P29, "" )
guiSetText ( P30, "" )
guiSetText ( P31, "" )
guiSetText ( P32, "" )
guiSetText ( P33, "" )
guiSetText ( P34, "" )
guiSetText ( P35, "" )
guiSetText ( P36, "" )
guiSetText ( P37, "" )
guiSetText ( P38, "" )
guiSetText ( P39, "" )
guiSetText ( P40, "" )
guiSetText ( P41, "" )
guiSetText ( P42, "" )
guiSetText ( P43, "" )
guiSetText ( P44, "" )
guiSetText ( P45, "" )
guiSetText ( P46, "" )
guiSetText ( P47, "" )
guiSetText ( P48, "" )
guiSetText ( P49, "" )
guiSetText ( P50, "" )
guiSetText ( P51, "" )
guiSetText ( P52, "" )
guiSetText ( P53, "" )
guiSetText ( P54, "" )
guiSetText ( P55, "" )
guiSetText ( P56, "" )
guiSetText ( P57, "" )
guiSetText ( P58, "" )
guiSetText ( P59, "" )
guiSetText ( P60, "" )
guiSetText ( P61, "" )
guiSetText ( P62, "" )
guiSetText ( P63, "" )
guiSetText ( P64, "" )
guiSetText ( P65, "" )
guiSetText ( P66, "" )
guiSetText ( P67, "" )
guiSetText ( P68, "" )
guiSetText ( P69, "" )
guiSetText ( P70, "" )
guiSetText ( P71, "" )
guiSetText ( P72, "" )
end
end
)

--1 ряд
P1 = guiCreateStaticImage(0.01, 0.05, 0.070, 0.120, "1.png", true,GUIEditor_Window[1])
P1 = createMarwinButton(0.01, 0.05, 0.070, 0.120, "", true,GUIEditor_Window[1])

P2 = guiCreateStaticImage(0.09, 0.05, 0.070, 0.120, "2.png", true,GUIEditor_Window[1])
P2 = createMarwinButton(0.09, 0.05, 0.070, 0.120, "", true,GUIEditor_Window[1])

P3 = guiCreateStaticImage(0.17, 0.05, 0.070, 0.120, "3.png", true,GUIEditor_Window[1])
P3 = createMarwinButton(0.17, 0.05, 0.070, 0.120, "", true,GUIEditor_Window[1])

P4 = guiCreateStaticImage(0.25, 0.05, 0.070, 0.120, "4.png", true,GUIEditor_Window[1])
P4 = createMarwinButton(0.25, 0.05, 0.070, 0.120, "", true,GUIEditor_Window[1])

P5 = guiCreateStaticImage(0.33, 0.05, 0.070, 0.120, "5.png", true,GUIEditor_Window[1])
P5 = createMarwinButton(0.33, 0.05, 0.070, 0.120, "", true,GUIEditor_Window[1])

P6 = guiCreateStaticImage(0.41, 0.05, 0.070, 0.120, "6.png", true,GUIEditor_Window[1])
P6 = createMarwinButton(0.41, 0.05, 0.070, 0.120, "", true,GUIEditor_Window[1])

P7 = guiCreateStaticImage(0.49, 0.05, 0.070, 0.120, "7.png", true,GUIEditor_Window[1])
P7 = createMarwinButton(0.49, 0.05, 0.070, 0.120, "", true,GUIEditor_Window[1])

P8 = guiCreateStaticImage(0.57, 0.05, 0.070, 0.120, "8.png", true,GUIEditor_Window[1])
P8 = createMarwinButton(0.57, 0.05, 0.070, 0.120, "", true,GUIEditor_Window[1])

P9 = guiCreateStaticImage(0.65, 0.05, 0.070, 0.120, "9.png", true,GUIEditor_Window[1])
P9 = createMarwinButton(0.65, 0.05, 0.070, 0.120, "", true,GUIEditor_Window[1])

P10 = guiCreateStaticImage(0.73, 0.05, 0.070, 0.120, "10.png", true,GUIEditor_Window[1])
P10 = createMarwinButton(0.73, 0.05, 0.070, 0.120, "", true,GUIEditor_Window[1])

P11 = guiCreateStaticImage(0.81, 0.05, 0.070, 0.120, "11.png", true,GUIEditor_Window[1])
P11 = createMarwinButton(0.81, 0.05, 0.070, 0.120, "", true,GUIEditor_Window[1])

P12 = guiCreateStaticImage(0.89, 0.05, 0.070, 0.120, "12.png", true,GUIEditor_Window[1])
P12 = createMarwinButton(0.89, 0.05, 0.070, 0.120, "", true,GUIEditor_Window[1])




--2 ряд
P13 = guiCreateStaticImage(0.01, 0.19, 0.070, 0.120, "13.png", true,GUIEditor_Window[1])
P13 = createMarwinButton(0.01, 0.19, 0.070, 0.120, "", true,GUIEditor_Window[1])

P14 = guiCreateStaticImage(0.09, 0.19, 0.070, 0.120, "14.png", true,GUIEditor_Window[1])
P14 = createMarwinButton(0.09, 0.19, 0.070, 0.120, "", true,GUIEditor_Window[1])

P15 = guiCreateStaticImage(0.17, 0.19, 0.070, 0.120, "15.png", true,GUIEditor_Window[1])
P15 = createMarwinButton(0.17, 0.19, 0.070, 0.120, "", true,GUIEditor_Window[1])

P16 = guiCreateStaticImage(0.25, 0.19, 0.070, 0.120, "16.png", true,GUIEditor_Window[1])
P16 = createMarwinButton(0.25, 0.19, 0.070, 0.120, "", true,GUIEditor_Window[1])

P17 = guiCreateStaticImage(0.33, 0.19, 0.070, 0.120, "17.png", true,GUIEditor_Window[1])
P17 = createMarwinButton(0.33, 0.19, 0.070, 0.120, "", true,GUIEditor_Window[1])

P18 = guiCreateStaticImage(0.41, 0.19, 0.070, 0.120, "18.png", true,GUIEditor_Window[1])
P18 = createMarwinButton(0.41, 0.19, 0.070, 0.120, "", true,GUIEditor_Window[1])

P19 = guiCreateStaticImage(0.49, 0.19, 0.070, 0.120, "19.png", true,GUIEditor_Window[1])
P19 = createMarwinButton(0.49, 0.19, 0.070, 0.120, "", true,GUIEditor_Window[1])

P20 = guiCreateStaticImage(0.57, 0.19, 0.070, 0.120, "20.png", true,GUIEditor_Window[1])
P20 = createMarwinButton(0.57, 0.19, 0.070, 0.120, "", true,GUIEditor_Window[1])

P21 = guiCreateStaticImage(0.65, 0.19, 0.070, 0.120, "21.png", true,GUIEditor_Window[1])
P21 = createMarwinButton(0.65, 0.19, 0.070, 0.120, "", true,GUIEditor_Window[1])

P22 = guiCreateStaticImage(0.73, 0.19, 0.070, 0.120, "22.png", true,GUIEditor_Window[1])
P22 = createMarwinButton(0.73, 0.19, 0.070, 0.120, "", true,GUIEditor_Window[1])

P23 = guiCreateStaticImage(0.81, 0.19, 0.070, 0.120, "23.png", true,GUIEditor_Window[1])
P23 = createMarwinButton(0.81, 0.19, 0.070, 0.120, "", true,GUIEditor_Window[1])

P24 = guiCreateStaticImage(0.89, 0.19, 0.070, 0.120, "24.png", true,GUIEditor_Window[1])
P24 = createMarwinButton(0.89, 0.19, 0.070, 0.120, "", true,GUIEditor_Window[1])

--3 ряд
P25 = guiCreateStaticImage(0.01, 0.33, 0.070, 0.120, "25.png", true,GUIEditor_Window[1])
P25 = createMarwinButton(0.01, 0.33, 0.070, 0.120, "", true,GUIEditor_Window[1])

P26 = guiCreateStaticImage(0.09, 0.33, 0.070, 0.120, "26.png", true,GUIEditor_Window[1])
P26 = createMarwinButton(0.09, 0.33, 0.070, 0.120, "", true,GUIEditor_Window[1])

P27 = guiCreateStaticImage(0.17, 0.33, 0.070, 0.120, "27.png", true,GUIEditor_Window[1])
P27 = createMarwinButton(0.17, 0.33, 0.070, 0.120, "", true,GUIEditor_Window[1])

P28 = guiCreateStaticImage(0.25, 0.33, 0.070, 0.120, "28.png", true,GUIEditor_Window[1])
P28 = createMarwinButton(0.25, 0.33, 0.070, 0.120, "", true,GUIEditor_Window[1])

P29 = guiCreateStaticImage(0.33, 0.33, 0.070, 0.120, "29.png", true,GUIEditor_Window[1])
P29 = createMarwinButton(0.33, 0.33, 0.070, 0.120, "", true,GUIEditor_Window[1])

P30 = guiCreateStaticImage(0.41, 0.33, 0.070, 0.120, "30.png", true,GUIEditor_Window[1])
P30 = createMarwinButton(0.41, 0.33, 0.070, 0.120, "", true,GUIEditor_Window[1])

P31 = guiCreateStaticImage(0.49, 0.33, 0.070, 0.120, "31.png", true,GUIEditor_Window[1])
P31 = createMarwinButton(0.49, 0.33, 0.070, 0.120, "", true,GUIEditor_Window[1])

P32 = guiCreateStaticImage(0.57, 0.33, 0.070, 0.120, "32.png", true,GUIEditor_Window[1])
P32 = createMarwinButton(0.57, 0.33, 0.070, 0.120, "", true,GUIEditor_Window[1])

P33 = guiCreateStaticImage(0.65, 0.33, 0.070, 0.120, "33.png", true,GUIEditor_Window[1])
P33 = createMarwinButton(0.65, 0.33, 0.070, 0.120, "", true,GUIEditor_Window[1])

P34 = guiCreateStaticImage(0.73, 0.33, 0.070, 0.120, "34.png", true,GUIEditor_Window[1])
P34 = createMarwinButton(0.73, 0.33, 0.070, 0.120, "", true,GUIEditor_Window[1])

P35 = guiCreateStaticImage(0.81, 0.33, 0.070, 0.120, "35.png", true,GUIEditor_Window[1])
P35 = createMarwinButton(0.81, 0.33, 0.070, 0.120, "", true,GUIEditor_Window[1])

P36 = guiCreateStaticImage(0.89, 0.33, 0.070, 0.120, "36.png", true,GUIEditor_Window[1])
P36 = createMarwinButton(0.89, 0.33, 0.070, 0.120, "", true,GUIEditor_Window[1])


--4 ряд
P37 = guiCreateStaticImage(0.01, 0.47, 0.070, 0.120, "37.png", true,GUIEditor_Window[1])
P37 = createMarwinButton(0.01, 0.47, 0.070, 0.120, "", true,GUIEditor_Window[1])

P38 = guiCreateStaticImage(0.09, 0.47, 0.070, 0.120, "38.png", true,GUIEditor_Window[1])
P38 = createMarwinButton(0.09, 0.47, 0.070, 0.120, "", true,GUIEditor_Window[1])

P39 = guiCreateStaticImage(0.17, 0.47, 0.070, 0.120, "39.png", true,GUIEditor_Window[1])
P39 = createMarwinButton(0.17, 0.47, 0.070, 0.120, "", true,GUIEditor_Window[1])

P40 = guiCreateStaticImage(0.25, 0.47, 0.070, 0.120, "40.png", true,GUIEditor_Window[1])
P40 = createMarwinButton(0.25, 0.47, 0.070, 0.120, "", true,GUIEditor_Window[1])

P41 = guiCreateStaticImage(0.33, 0.47, 0.070, 0.120, "41.png", true,GUIEditor_Window[1])
P41 = createMarwinButton(0.33, 0.47, 0.070, 0.120, "", true,GUIEditor_Window[1])

P42 = guiCreateStaticImage(0.41, 0.47, 0.070, 0.120, "42.png", true,GUIEditor_Window[1])
P42 = createMarwinButton(0.41, 0.47, 0.070, 0.120, "", true,GUIEditor_Window[1])

P43 = guiCreateStaticImage(0.49, 0.47, 0.070, 0.120, "43.png", true,GUIEditor_Window[1])
P43 = createMarwinButton(0.49, 0.47, 0.070, 0.120, "", true,GUIEditor_Window[1])

P44 = guiCreateStaticImage(0.57, 0.47, 0.070, 0.120, "44.png", true,GUIEditor_Window[1])
P44 = createMarwinButton(0.57, 0.47, 0.070, 0.120, "", true,GUIEditor_Window[1])

P45 = guiCreateStaticImage(0.65, 0.47, 0.070, 0.120, "45.png", true,GUIEditor_Window[1])
P45 = createMarwinButton(0.65, 0.47, 0.070, 0.120, "", true,GUIEditor_Window[1])

P46 = guiCreateStaticImage(0.73, 0.47, 0.070, 0.120, "46.png", true,GUIEditor_Window[1])
P46 = createMarwinButton(0.73, 0.47, 0.070, 0.120, "", true,GUIEditor_Window[1])

P47 = guiCreateStaticImage(0.81, 0.47, 0.070, 0.120, "47.png", true,GUIEditor_Window[1])
P47 = createMarwinButton(0.81, 0.47, 0.070, 0.120, "", true,GUIEditor_Window[1])

P48 = guiCreateStaticImage(0.89, 0.47, 0.070, 0.120, "48.png", true,GUIEditor_Window[1])
P48 = createMarwinButton(0.89, 0.47, 0.070, 0.120, "", true,GUIEditor_Window[1])

--5 ряд
P49 = guiCreateStaticImage(0.01, 0.61, 0.070, 0.120, "49.png", true,GUIEditor_Window[1])
P49 = createMarwinButton(0.01, 0.61, 0.070, 0.120, "", true,GUIEditor_Window[1])

P50 = guiCreateStaticImage(0.09, 0.61, 0.070, 0.120, "50.png", true,GUIEditor_Window[1])
P50 = createMarwinButton(0.09, 0.61, 0.070, 0.120, "", true,GUIEditor_Window[1])

P51 = guiCreateStaticImage(0.17, 0.61, 0.070, 0.120, "51.png", true,GUIEditor_Window[1])
P51 = createMarwinButton(0.17, 0.61, 0.070, 0.120, "", true,GUIEditor_Window[1])

P52 = guiCreateStaticImage(0.25, 0.61, 0.070, 0.120, "52.png", true,GUIEditor_Window[1])
P52 = createMarwinButton(0.25, 0.61, 0.070, 0.120, "", true,GUIEditor_Window[1])

P53 = guiCreateStaticImage(0.33, 0.61, 0.070, 0.120, "53.png", true,GUIEditor_Window[1])
P53 = createMarwinButton(0.33, 0.61, 0.070, 0.120, "", true,GUIEditor_Window[1])

P54 = guiCreateStaticImage(0.41, 0.61, 0.070, 0.120, "54.png", true,GUIEditor_Window[1])
P54 = createMarwinButton(0.41, 0.61, 0.070, 0.120, "", true,GUIEditor_Window[1])

P55 = guiCreateStaticImage(0.49, 0.61, 0.070, 0.120, "55.png", true,GUIEditor_Window[1])
P55 = createMarwinButton(0.49, 0.61, 0.070, 0.120, "", true,GUIEditor_Window[1])

P56 = guiCreateStaticImage(0.57, 0.61, 0.070, 0.120, "56.png", true,GUIEditor_Window[1])
P56 = createMarwinButton(0.57, 0.61, 0.070, 0.120, "", true,GUIEditor_Window[1])

P57 = guiCreateStaticImage(0.65, 0.61, 0.070, 0.120, "57.png", true,GUIEditor_Window[1])
P57 = createMarwinButton(0.65, 0.61, 0.070, 0.120, "", true,GUIEditor_Window[1])

P58 = guiCreateStaticImage(0.73, 0.61, 0.070, 0.120, "58.png", true,GUIEditor_Window[1])
P58 = createMarwinButton(0.73, 0.61, 0.070, 0.120, "", true,GUIEditor_Window[1])

P59 = guiCreateStaticImage(0.81, 0.61, 0.070, 0.120, "59.png", true,GUIEditor_Window[1])
P59 = createMarwinButton(0.81, 0.61, 0.070, 0.120, "", true,GUIEditor_Window[1])

P60 = guiCreateStaticImage(0.89, 0.61, 0.070, 0.120, "60.png", true,GUIEditor_Window[1])
P60 = createMarwinButton(0.89, 0.61, 0.070, 0.120, "", true,GUIEditor_Window[1])

--6 ряд
P61 = guiCreateStaticImage(0.01, 0.75, 0.070, 0.120, "61.png", true,GUIEditor_Window[1])
P61 = createMarwinButton(0.01, 0.75, 0.070, 0.120, "", true,GUIEditor_Window[1])

P62 = guiCreateStaticImage(0.09, 0.75, 0.070, 0.120, "62.png", true,GUIEditor_Window[1])
P62 = createMarwinButton(0.09, 0.75, 0.070, 0.120, "", true,GUIEditor_Window[1])

P63 = guiCreateStaticImage(0.17, 0.75, 0.070, 0.120, "63.png", true,GUIEditor_Window[1])
P63 = createMarwinButton(0.17, 0.75, 0.070, 0.120, "", true,GUIEditor_Window[1])

P64 = guiCreateStaticImage(0.25, 0.75, 0.070, 0.120, "64.png", true,GUIEditor_Window[1])
P64 = createMarwinButton(0.25, 0.75, 0.070, 0.120, "", true,GUIEditor_Window[1])

P65 = guiCreateStaticImage(0.33, 0.75, 0.070, 0.120, "65.png", true,GUIEditor_Window[1])
P65 = createMarwinButton(0.33, 0.75, 0.070, 0.120, "", true,GUIEditor_Window[1])

P66 = guiCreateStaticImage(0.41, 0.75, 0.070, 0.120, "66.png", true,GUIEditor_Window[1])
P66 = createMarwinButton(0.41, 0.75, 0.070, 0.120, "", true,GUIEditor_Window[1])

P67 = guiCreateStaticImage(0.49, 0.75, 0.070, 0.120, "67.png", true,GUIEditor_Window[1])
P67 = createMarwinButton(0.49, 0.75, 0.070, 0.120, "", true,GUIEditor_Window[1])

P68 = guiCreateStaticImage(0.57, 0.75, 0.070, 0.120, "68.png", true,GUIEditor_Window[1])
P68 = createMarwinButton(0.57, 0.75, 0.070, 0.120, "", true,GUIEditor_Window[1])

P69 = guiCreateStaticImage(0.65, 0.75, 0.070, 0.120, "69.png", true,GUIEditor_Window[1])
P69 = createMarwinButton(0.65, 0.75, 0.070, 0.120, "", true,GUIEditor_Window[1])

P70 = guiCreateStaticImage(0.73, 0.75, 0.070, 0.120, "70.png", true,GUIEditor_Window[1])
P70 = createMarwinButton(0.73, 0.75, 0.070, 0.120, "", true,GUIEditor_Window[1])

P71 = guiCreateStaticImage(0.81, 0.75, 0.070, 0.120, "71.png", true,GUIEditor_Window[1])
P71 = createMarwinButton(0.81, 0.75, 0.070, 0.120, "", true,GUIEditor_Window[1])

P72 = guiCreateStaticImage(0.89, 0.75, 0.070, 0.120, "72.png", true,GUIEditor_Window[1])
P72 = createMarwinButton(0.89, 0.75, 0.070, 0.120, "", true,GUIEditor_Window[1])


FANBOX = guiCreateLabel(0.525, 0.94, 0.27, 0.09, "1", true, GUIEditor_Window[1])
guiSetFont(FANBOX, "default-bold-small")
setElementData(FANBOX,"identifikation","fanbox")
t1 = guiCreateLabel(0.420, 0.94, 0.84, 0.09, "Номер прицела", true, GUIEditor_Window[1])
guiSetFont (t1, "default-bold-small")


function RES()
        if getElementData(getLocalPlayer(),"logedin") then 
        local value = getElementData(getLocalPlayer(),getElementData(FANBOX,"identifikation"))
        guiSetText(FANBOX," "..value)       
end
end
setTimer(RES,500,0)


function open_window ( )
    if guiGetVisible ( GUIEditor_Window[1] ) then
	showCursor ( false )
	guiSetVisible ( GUIEditor_Window[1], false )
	else
	guiSetVisible ( GUIEditor_Window[1], true )
	showCursor ( true )
	end
end
bindKey (  "F3", "down", open_window )

function Fanbox() 

if source == P1 then
setElementData(localPlayer,"fanbox",1) 
elseif source == P2 then
setElementData(localPlayer,"fanbox",2) 
elseif source == P3 then
setElementData(localPlayer,"fanbox",3) 
elseif source == P4 then
setElementData(localPlayer,"fanbox",4) 
elseif source == P5 then
setElementData(localPlayer,"fanbox",5) 
elseif source == P6 then
setElementData(localPlayer,"fanbox",6) 
elseif source == P7 then
setElementData(localPlayer,"fanbox",7) 
elseif source == P8 then
setElementData(localPlayer,"fanbox",8) 
elseif source == P9 then
setElementData(localPlayer,"fanbox",9) 
elseif source == P10 then
setElementData(localPlayer,"fanbox",10) 
elseif source == P11 then
setElementData(localPlayer,"fanbox",11) 
elseif source == P12 then
setElementData(localPlayer,"fanbox",12) 
elseif source == P13 then
setElementData(localPlayer,"fanbox",13) 
elseif source == P14 then
setElementData(localPlayer,"fanbox",14) 
elseif source == P15 then
setElementData(localPlayer,"fanbox",15) 
elseif source == P16 then
setElementData(localPlayer,"fanbox",16) 
elseif source == P17 then
setElementData(localPlayer,"fanbox",17) 
elseif source == P18 then
setElementData(localPlayer,"fanbox",18) 
elseif source == P19 then
setElementData(localPlayer,"fanbox",19) 
elseif source == P20 then
setElementData(localPlayer,"fanbox",20) 
elseif source == P21 then
setElementData(localPlayer,"fanbox",21) 
elseif source == P22 then
setElementData(localPlayer,"fanbox",22) 
elseif source == P23 then
setElementData(localPlayer,"fanbox",23) 
elseif source == P24 then
setElementData(localPlayer,"fanbox",24) 
elseif source == P25 then
setElementData(localPlayer,"fanbox",25) 
elseif source == P26 then
setElementData(localPlayer,"fanbox",26) 
elseif source == P27 then
setElementData(localPlayer,"fanbox",27) 
elseif source == P28 then
setElementData(localPlayer,"fanbox",28) 
elseif source == P29 then
setElementData(localPlayer,"fanbox",29) 
elseif source == P30 then
setElementData(localPlayer,"fanbox",30) 
elseif source == P31 then
setElementData(localPlayer,"fanbox",31) 
elseif source == P32 then
setElementData(localPlayer,"fanbox",32) 
elseif source == P33 then
setElementData(localPlayer,"fanbox",33) 
elseif source == P34 then
setElementData(localPlayer,"fanbox",34) 
elseif source == P35 then
setElementData(localPlayer,"fanbox",35) 
elseif source == P36 then
setElementData(localPlayer,"fanbox",36) 
elseif source == P37 then
setElementData(localPlayer,"fanbox",37) 
elseif source == P38 then
setElementData(localPlayer,"fanbox",38) 
elseif source == P39 then
setElementData(localPlayer,"fanbox",39) 
elseif source == P40 then
setElementData(localPlayer,"fanbox",40) 
elseif source == P41 then
setElementData(localPlayer,"fanbox",41) 
elseif source == P42 then
setElementData(localPlayer,"fanbox",42) 
elseif source == P43 then
setElementData(localPlayer,"fanbox",43) 
elseif source == P44 then
setElementData(localPlayer,"fanbox",44) 
elseif source == P45 then
setElementData(localPlayer,"fanbox",45) 
elseif source == P46 then
setElementData(localPlayer,"fanbox",46) 
elseif source == P47 then
setElementData(localPlayer,"fanbox",47) 
elseif source == P48 then
setElementData(localPlayer,"fanbox",48) 
elseif source == P49 then
setElementData(localPlayer,"fanbox",49) 
elseif source == P50 then
setElementData(localPlayer,"fanbox",50) 
elseif source == P51 then
setElementData(localPlayer,"fanbox",51) 
elseif source == P52 then
setElementData(localPlayer,"fanbox",52) 
elseif source == P53 then
setElementData(localPlayer,"fanbox",53) 
elseif source == P54 then
setElementData(localPlayer,"fanbox",54) 
elseif source == P55 then
setElementData(localPlayer,"fanbox",55) 
elseif source == P56 then
setElementData(localPlayer,"fanbox",56) 
elseif source == P57 then
setElementData(localPlayer,"fanbox",57) 
elseif source == P58 then
setElementData(localPlayer,"fanbox",58) 
elseif source == P59 then
setElementData(localPlayer,"fanbox",59) 
elseif source == P60 then
setElementData(localPlayer,"fanbox",60) 
elseif source == P61 then
setElementData(localPlayer,"fanbox",61) 
elseif source == P62 then
setElementData(localPlayer,"fanbox",62) 
elseif source == P63 then
setElementData(localPlayer,"fanbox",63) 
elseif source == P64 then
setElementData(localPlayer,"fanbox",64) 
elseif source == P65 then
setElementData(localPlayer,"fanbox",65) 
elseif source == P66 then
setElementData(localPlayer,"fanbox",66) 
elseif source == P67 then
setElementData(localPlayer,"fanbox",67) 
elseif source == P68 then
setElementData(localPlayer,"fanbox",68) 
elseif source == P69 then
setElementData(localPlayer,"fanbox",69) 
elseif source == P70 then
setElementData(localPlayer,"fanbox",70) 
elseif source == P71 then
setElementData(localPlayer,"fanbox",71) 
elseif source == P72 then
setElementData(localPlayer,"fanbox",72) 


end
end
addEventHandler("onClientGUIClick",getRootElement(),Fanbox)



Crosshair = {
	crosshairs = {};
	shader = {};
	default1 = dxCreateTexture("1.png");
	default2 = dxCreateTexture("2.png");
	default3 = dxCreateTexture("3.png");
	default4 = dxCreateTexture("4.png");
	default5 = dxCreateTexture("5.png");
	default6 = dxCreateTexture("6.png");
	default7 = dxCreateTexture("7.png");
	default8 = dxCreateTexture("8.png");
	default9 = dxCreateTexture("9.png");
	default10 = dxCreateTexture("10.png");
	default11 = dxCreateTexture("11.png");
	default12 = dxCreateTexture("12.png");
	default13 = dxCreateTexture("13.png");
	default14 = dxCreateTexture("14.png");
	default15 = dxCreateTexture("15.png");
	default16 = dxCreateTexture("16.png");
	default17 = dxCreateTexture("17.png");
	default18 = dxCreateTexture("18.png");
	default19 = dxCreateTexture("19.png");
	default20 = dxCreateTexture("20.png");
	default21 = dxCreateTexture("21.png");
	default22 = dxCreateTexture("22.png");
	default23 = dxCreateTexture("23.png");
	default24 = dxCreateTexture("24.png");
	default25 = dxCreateTexture("25.png");
	default26 = dxCreateTexture("26.png");
	default27 = dxCreateTexture("27.png");
	default28 = dxCreateTexture("28.png");
	default29 = dxCreateTexture("29.png");
	default30 = dxCreateTexture("30.png");
	default31 = dxCreateTexture("31.png");
	default32 = dxCreateTexture("32.png");
	default33 = dxCreateTexture("33.png");
	default34 = dxCreateTexture("34.png");
	default35 = dxCreateTexture("35.png");
	default36 = dxCreateTexture("36.png");
	default37 = dxCreateTexture("37.png");
	default38 = dxCreateTexture("38.png");
	default39 = dxCreateTexture("39.png");
	default40 = dxCreateTexture("40.png");
	default41 = dxCreateTexture("41.png");
	default42 = dxCreateTexture("42.png");
	default43 = dxCreateTexture("43.png");
	default44 = dxCreateTexture("44.png");
	default45 = dxCreateTexture("45.png");
	default46 = dxCreateTexture("46.png");
	default47 = dxCreateTexture("47.png");
	default48 = dxCreateTexture("48.png");
	default49 = dxCreateTexture("49.png");
	default50 = dxCreateTexture("50.png");
	default51 = dxCreateTexture("51.png");
	default52 = dxCreateTexture("52.png");
	default53 = dxCreateTexture("53.png");
	default54 = dxCreateTexture("54.png");
	default55 = dxCreateTexture("55.png");
	default56 = dxCreateTexture("56.png");
	default57 = dxCreateTexture("57.png");
	default58 = dxCreateTexture("58.png");
	default59 = dxCreateTexture("59.png");
	default60 = dxCreateTexture("60.png");
	default61 = dxCreateTexture("61.png");
	default62 = dxCreateTexture("62.png");
	default63 = dxCreateTexture("63.png");
	default64 = dxCreateTexture("64.png");
	default65 = dxCreateTexture("65.png");
	default66 = dxCreateTexture("66.png");
	default67 = dxCreateTexture("67.png");
	default68 = dxCreateTexture("68.png");
	default69 = dxCreateTexture("69.png");
	default70 = dxCreateTexture("70.png");
	default71 = dxCreateTexture("71.png");
	default72 = dxCreateTexture("72.png");

	
	register = function(weaponid, crosshairpath)
		if not crosshairpath:find(":") then
			crosshairpath = (":ss/%s"):format(getResourceName(sourceResource), crosshairpath)
		end
		assert(fileExists(crosshairpath), "Invalid File for Crosshair.register")
		
		if Crosshair.crosshairs[weaponid] then destroyElement(Crosshair.crosshairs[weaponid]) end
		Crosshair.crosshairs[weaponid] = dxCreateTexture(crosshairpath)
	end,
	
	unregister = function(weaponid)
		if Crosshair.crosshairs[weaponid] then destroyElement(Crosshair.crosshairs[weaponid]) end
		Crosshair.crosshairs[weaponid] = nil
	end,
	
	init = function()
		Crosshair.shader = dxCreateShader("texreplace.fx")
		assert(Crosshair.shader, "Could not create Crosshair Replacement Shader")
		engineApplyShaderToWorldTexture(Crosshair.shader, "siteM16")
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.default)
		addEventHandler("onClientPlayerWeaponSwitch", localPlayer, Crosshair.weaponSwitch)
	end, 

	weaponSwitch = function(prev, now)
		local weapon = getElementData(source,"currentweapon_1")
		if getElementData(getLocalPlayer(),"Noob032") == 1 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default1)
		elseif getElementData(getLocalPlayer(),"fanbox") == 2 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default2)
		elseif getElementData(getLocalPlayer(),"fanbox") == 3 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default3)
		elseif getElementData(getLocalPlayer(),"fanbox") == 4 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default4)
		elseif getElementData(getLocalPlayer(),"fanbox") == 5 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default5)
		elseif getElementData(getLocalPlayer(),"fanbox") == 6 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default6)
		elseif getElementData(getLocalPlayer(),"fanbox") == 7 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default7)
		elseif getElementData(getLocalPlayer(),"fanbox") == 8 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default8)
		elseif getElementData(getLocalPlayer(),"fanbox") == 9 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default9)
		elseif getElementData(getLocalPlayer(),"fanbox") == 10 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default10)
		elseif getElementData(getLocalPlayer(),"fanbox") == 11 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default11)
		elseif getElementData(getLocalPlayer(),"fanbox") == 12 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default12)
		elseif getElementData(getLocalPlayer(),"fanbox") == 13 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default13)
		elseif getElementData(getLocalPlayer(),"fanbox") == 14 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default14)
		elseif getElementData(getLocalPlayer(),"fanbox") == 15 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default15)
		elseif getElementData(getLocalPlayer(),"fanbox") == 16 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default16)
		elseif getElementData(getLocalPlayer(),"fanbox") == 17 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default17)
		elseif getElementData(getLocalPlayer(),"fanbox") == 18 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default18)
		elseif getElementData(getLocalPlayer(),"fanbox") == 19 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default19)
		elseif getElementData(getLocalPlayer(),"fanbox") == 20 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default20)
		elseif getElementData(getLocalPlayer(),"fanbox") == 21 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default21)
		elseif getElementData(getLocalPlayer(),"fanbox") == 22 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default22)
		elseif getElementData(getLocalPlayer(),"fanbox") == 23 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default23)
		elseif getElementData(getLocalPlayer(),"fanbox") == 24 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default24)
		elseif getElementData(getLocalPlayer(),"fanbox") == 25 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default25)
		elseif getElementData(getLocalPlayer(),"fanbox") == 26 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default26)
		elseif getElementData(getLocalPlayer(),"fanbox") == 27 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default27)
		elseif getElementData(getLocalPlayer(),"fanbox") == 28 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default28)
		elseif getElementData(getLocalPlayer(),"fanbox") == 29 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default29)
		elseif getElementData(getLocalPlayer(),"fanbox") == 30 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default30)
		elseif getElementData(getLocalPlayer(),"fanbox") == 31 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default31)
		elseif getElementData(getLocalPlayer(),"fanbox") == 32 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default32)
		elseif getElementData(getLocalPlayer(),"fanbox") == 33 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default33)
		elseif getElementData(getLocalPlayer(),"fanbox") == 34 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default34)
		elseif getElementData(getLocalPlayer(),"fanbox") == 35 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default35)
		elseif getElementData(getLocalPlayer(),"fanbox") == 36 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default36)
		elseif getElementData(getLocalPlayer(),"fanbox") == 37 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default37)
		elseif getElementData(getLocalPlayer(),"fanbox") == 38 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default38)
		elseif getElementData(getLocalPlayer(),"fanbox") == 39 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default39)
		elseif getElementData(getLocalPlayer(),"fanbox") == 40 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default40)
		elseif getElementData(getLocalPlayer(),"fanbox") == 41 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default41)
		elseif getElementData(getLocalPlayer(),"fanbox") == 42 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default42)
		elseif getElementData(getLocalPlayer(),"fanbox") == 43 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default43)
		elseif getElementData(getLocalPlayer(),"fanbox") == 44 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default44)
		elseif getElementData(getLocalPlayer(),"fanbox") == 45 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default45)
		elseif getElementData(getLocalPlayer(),"fanbox") == 46 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default46)
		elseif getElementData(getLocalPlayer(),"fanbox") == 47 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default47)
		elseif getElementData(getLocalPlayer(),"fanbox") == 48 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default48)
		elseif getElementData(getLocalPlayer(),"fanbox") == 49 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default49)
		elseif getElementData(getLocalPlayer(),"fanbox") == 50 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default50)
		elseif getElementData(getLocalPlayer(),"fanbox") == 51 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default51)
		elseif getElementData(getLocalPlayer(),"fanbox") == 52 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default52)
		elseif getElementData(getLocalPlayer(),"fanbox") == 53 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default53)
		elseif getElementData(getLocalPlayer(),"fanbox") == 54 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default54)
		elseif getElementData(getLocalPlayer(),"fanbox") == 55 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default55)
		elseif getElementData(getLocalPlayer(),"fanbox") == 56 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default56)
		elseif getElementData(getLocalPlayer(),"fanbox") == 57 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default57)
		elseif getElementData(getLocalPlayer(),"fanbox") == 58 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default58)
		elseif getElementData(getLocalPlayer(),"fanbox") == 59 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default59)
		elseif getElementData(getLocalPlayer(),"fanbox") == 60 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default60)
		elseif getElementData(getLocalPlayer(),"fanbox") == 61 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default61)
		elseif getElementData(getLocalPlayer(),"fanbox") == 62 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default62)
		elseif getElementData(getLocalPlayer(),"fanbox") == 63 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default63)
		elseif getElementData(getLocalPlayer(),"fanbox") == 64 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default64)
		elseif getElementData(getLocalPlayer(),"fanbox") == 65 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default65)
		elseif getElementData(getLocalPlayer(),"fanbox") == 66 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default66)
		elseif getElementData(getLocalPlayer(),"fanbox") == 67 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default67)
		elseif getElementData(getLocalPlayer(),"fanbox") == 68 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default68)
		elseif getElementData(getLocalPlayer(),"fanbox") == 69 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default69)
		elseif getElementData(getLocalPlayer(),"fanbox") == 70 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default70)
		elseif getElementData(getLocalPlayer(),"fanbox") == 71 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default71)
		elseif getElementData(getLocalPlayer(),"fanbox") == 72 then
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default72)
	

		end
	end

}

Crosshair.init()

-- Exports
register 	= Crosshair.register
unregister 	= Crosshair.unregister




