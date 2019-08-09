Rails.application.routes.draw do
   put "/tasks/rename/:id(.:format)", to: "tasks#rename"
   get "tasks/show_done", to: "tasks#show_done"
   get "tasks/show_undone", to: "tasks#show_undone"
   resources :tasks
end
