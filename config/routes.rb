Rails.application.routes.draw do
  # Cuisine
  match("/cuisines", {controller: "application", action: "cuisines", via: "get"})

  # Dish
  match("/dishes", {controller: "application", action: "dishes", via: "get"})
  match("/dishes/:dish_id", {controller: "application", action: "dish", via: "get"})
  match("/dishes/:dish_id/bookmarks", {controller: "application", action: "dish_bookmarks", via: "get"})
  match("/dishes/:dish_id/experts", {controller: "application", action: "dish_experts", via: "get"})

  # Neighborhood
  match("/neighborhoods", {controller: "application", action: "neighborhoods", via: "get"})

  # Venue
  match("/venues", {controller: "application", action: "venues", via: "get"})
  match("/venues/:venue_id", {controller: "application", action: "venue", via: "get"})
  match("/venues/:venue_id/bookmarks", {controller: "application", action: "venue_bookmarks", via: "get"})
  match("/venues/:venue_id/specialties", {controller: "application", action: "venue_specialties", via: "get"})
  match("/venues/:venue_id/fans", {controller: "application", action: "venue_fans", via: "get"})

  # User
  match("/users", {controller: "application", action: "users", via: "get"})
  match("/users/:user_id", {controller: "application", action: "user", via: "get"})
  match("/users/:user_id/bookmarks", {controller: "application", action: "user_bookmarks", via: "get"})
  match("/users/:user_id/bookmarked_dishes", {controller: "application", action: "user_bookmark_dishes", via: "get"})

  # Bookmark
  match("/add_bookmark", {controller: "application", action: "add_bookmark", via: "get"})
  match("/remove_bookmark/:bookmark_id", {controller: "application", action: "remove_bookmark", via: "get"})

  # ====================================================
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
