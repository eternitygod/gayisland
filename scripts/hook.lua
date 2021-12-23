
function hook.GetDetectedUnit()
    return message.selection()
end

function hook.GetStartLocPrioSlot(x,y)
    return message.button(x, y)
end

function hook.AbilityId2String(id)
    local data = slk[globals.SlkType][id][globals.SlkdataType]
    if data then
        return data
    end
    return nil
end
