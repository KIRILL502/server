function ReplaceCar()
txd = engineLoadTXD('admiral.txd', 411)
engineImportTXD(txd, 411)
dff = engineLoadDFF('admiral.dff', 411)
engineReplaceModel(dff, 411)
end
addEventHandler( 'onClientResourceStart', getResourceRootElement(getThisResource()), ReplaceCar)