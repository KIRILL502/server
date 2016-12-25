--	NFS_arrow script by bartekPL
--	
--	All Rights Reserved

addEventHandler( "onClientResourceStart", getResourceRootElement(getThisResource()),
	function()
		shader = dxCreateShader ( "shader.fx" )
		text = dxCreateTexture ( "bb.png" )
		dxSetShaderValue ( shader, "CUSTOMTEX0", text )
		txd = engineLoadTXD ( "bb.txd" )
		engineImportTXD ( txd, 3919 )
		col = engineLoadCOL ( "bb.col" )
		dff = engineLoadDFF ( "bb.dff", 3919 )
		engineReplaceCOL ( col, 3919 )
		engineReplaceModel ( dff, 3919 )
		if shader then
			engineApplyShaderToWorldTexture( shader, "nfs_strzalka_map" )
		end
	end
)