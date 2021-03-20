Rails.application.routes.draw do

    devise_for :admins

    root to: "pages#home"

    # pages
    get "home", to: "pages#home", as: "home"
    get "about", to: "pages#about", as: "about"

    # projects
    get "projects", to: "projects#index", as: "projects"
    post "projects", to: "projects#create"
    get "projects/new", to: "projects#new", as: "new_project"
    get "projects/:id", to: "projects#show", as: "project"
    patch "projects/:id", to: "projects#update"
    put "projects/:id", to: "projects#update"
    delete "projects/:id", to: "projects#destroy", as: "destroy_project"
    get "projects/:id/edit", to: "projects#edit", as: "edit_project"
    
    # blog
    get "posts", to: "posts#index", as: "posts"
    post "posts", to: "posts#create"
    get "posts/new", to: "posts#new", as: "new_post"
    get "posts/:id", to: "posts#show", as: "post"
    patch "posts/:id", to: "posts#update"
    put "posts/:id", to: "posts#update"
    delete "posts/:id", to: "posts#destroy", as: "destroy_post"
    get "posts/:id/edit", to: "posts#edit", as: "edit_post"

end