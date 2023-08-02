local in_context = false

function createContextMenu(title, items, cb)
    if (not in_context) then
        if type(items) == 'table' and title ~= nil then

            in_context = true

            SetNuiFocus(true, true)

            SendNUIMessage({
                action = 'show:interfaz:context',
                data = { title = title, items = items }
            })
        end

        
        local callbackFired = false

        RegisterNUICallback('select_item', function(data)
            closeContext()
            if (not callbackFired) then
                callbackFired = true
                cb(data.value)
            end
        end)

        RegisterNUICallback('exit_context', function()
            closeContext()
            if (not callbackFired) then
                callbackFired = true
                cb('exit')
            end
        end)
    end
end

function closeContext()
    in_context = false
    SetNuiFocus(false, false)
    SendNUIMessage({
        action = 'hide:interfaz:hide'
    })
end

exports('createContext', createContextMenu)
