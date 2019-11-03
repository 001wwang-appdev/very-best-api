# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string
#  username   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord

  def bookmarks
    return Bookmark.where({user_id: self.id}).order(:created_at)
  end

  def bookmarked_dishes
    return Dish.where({id: self.bookmarks.pluck('dish_id')})
  end

  def bookmarked_venues
    return Venue.where(id: self.bookmarks.pluck('venue_id'))
  end

  def bookmarked_neighborhoods
    return Neighborhood.where(id: self.bookmarked_venues.pluck('neighborhood_id'))
  end
end
