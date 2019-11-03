# == Schema Information
#
# Table name: venues
#
#  id              :integer          not null, primary key
#  address         :string
#  name            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  neighborhood_id :integer
#

class Venue < ApplicationRecord

  def neighborhood
    return Neighborhood.where({id: self.neighborhood_id})
  end

  def bookmarks
    return Bookmark.where({venue_id: self.id})
  end

  def specialties
    return Dish.where({id: self.bookmarks.pluck('dish_id')})
  end

  def fans
    return User.where({id: self.bookmarks.pluck('user_id')})
  end
end
