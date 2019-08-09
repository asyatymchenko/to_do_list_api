Rails.application.routes.draw do
   put "/tasks/rename/:id(.:format)", to: "tasks#rename"
   resources :tasks
end
