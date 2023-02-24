local hop_status, hop = pcall(require, 'hop')
if (not hop_status) then return end

hop.setup {}
