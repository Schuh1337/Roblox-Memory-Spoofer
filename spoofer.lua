local Memory
game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        for i,v in pairs(game:GetService("CoreGui").RobloxGui.PerformanceStats:GetChildren()) do
            if v.Name == "PS_Button" then
                if v.StatsMiniTextPanelClass.TitleLabel.Text == "Mem" then
                    v.StatsMiniTextPanelClass.ValueLabel.Text = tostring(Memory) ..  " MB"
                end
            end
        end
    end)
    pcall(function()
        if game:GetService("CoreGui").RobloxGui.PerformanceStats["PS_Viewer"].Frame.TextLabel.Text == "Memory" then
            for i,v in pairs(game:GetService("CoreGui").RobloxGui.PerformanceStats["PS_Viewer"].Frame:GetChildren()) do
               if v.Name == "PS_DecoratedValueLabel" and string.find(v.Label.Text, 'Current') then
                 v.Label.Text = "Current: " .. Memory .. " MB"
               end
               if v.Name == "PS_DecoratedValueLabel" and string.find(v.Label.Text, 'Average') then
                 v.Label.Text = "Average: " .. Memory .. " MB"
               end
            end
        end
    end)
    pcall(function()
        game:GetService("CoreGui").DevConsoleMaster.DevConsoleWindow.DevConsoleUI.TopBar.LiveStatsModule["MemoryUsage_MB"].Text = math.round(tonumber(Memory)) .. " MB"
    end)
end)
task.spawn(function()
    while task.wait(1) do
        Memory = tostring(math.random(780, 840)) .. "." .. tostring(math.random(10, 99))
    end
end)
