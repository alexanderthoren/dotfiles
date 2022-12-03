local status_todo_comments, todo_comments = pcall(require, 'todo-comments')
if (not status_todo_comments) then return end

todo_comments.setup {}

local status_comment, comment = pcall(require, 'Comment')
if (not status_comment) then return end

comment.setup {}
