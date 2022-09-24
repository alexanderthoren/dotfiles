local trouble_status, trouble = pcall(require, 'trouble')
if (not trouble_status) then return end

trouble.setup { }
