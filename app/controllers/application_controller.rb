class ApplicationController < ActionController::Base
  # cuisine
  def cuisines
    render({:json => Cuisine.all.order(:created_at)})
  end

  # dish
  def dishes
    if params.key?(:cuisine_id)
      render({:json => Dish.where({cuisine_id: params['cuisine_id']})})
    else
      render({:json => Dish.all.order(:created_at)})
    end
  end

  def dish
    render({:json => Dish.where({id: params['dish_id']}).at(0)})
  end

  def dish_bookmarks
    d = Dish.where({id: params['dish_id']}).at(0)
    render({:json => d.bookmarks})
  end

  def dish_experts
    d = Dish.where({id: params['dish_id']}).at(0)
    render({:json => d.experts})
  end

  # neighborhood
  def neighborhoods
    render({:json => Neighborhood.all.order(:created_at)})
  end

  # venue
  def venues
    if params.key?(:neighborhood_id)
      render({:json => Venue.where({neighborhood_id: params['neighborhood_id']}).order(:created_at)})
    else
      render({:json => Venue.all.order(:created_at)})
    end
  end

  def venue
    render({:json => Venue.where({id: params['venue_id']}).at(0)})
  end

  def venue_bookmarks
    v = Venue.where({id: params['venue_id']}).at(0)
    render({:json => v.bookmarks})
  end

  def venue_specialties
    v = Venue.where({id: params['venue_id']}).at(0)
    render({:json => v.specialties})
  end

  def venue_fans
    v = Venue.where({id: params['venue_id']}).at(0)
    render({:json => v.fans})
  end

  # user
  def users
    render({:json => User.all.order(:created_at)})
  end

  def user
    render({:json => User.where({id: params['user_id']}).at(0)})
  end

  def user_bookmarks
    u = User.where({id: params['user_id']}).at(0)
    if params.key?(:dish_id)
      render({:json => u.bookmarks.where({dish_id: params['dish_id']})})
    else
      render({:json => u.bookmarks})
    end
  end

  def user_bookmark_dishes
    u = User.where({id: params['user_id']}).at(0)
    render({:json => u.bookmarked_dishes})
  end

  # bookmark
  def add_bookmark
    b = Bookmark.new
    b.user_id = params['input_user_id']
    b.dish_id = params['input_dish_id']
    b.venue_id = params['input_venue_id']
    b.save
    render({:json => b})
  end

  def remove_bookmark
    b = Bookmark.where({id: params['bookmark_id']}).at(0)
    b.delete
    render({:json => b})
  end


end
