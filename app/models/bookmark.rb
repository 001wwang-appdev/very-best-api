# == Schema Information
#
# Table name: bookmarks
#
#  id         :integer          not null, primary key
#  image      :string
#  notes      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  dish_id    :integer
#  user_id    :integer
#  venue_id   :integer
#

class Bookmark < ApplicationRecord
  def dish
    return Dish.where({id: self.dish_id})
  end

  def venue
    return Venue.where({id: self.venue_id})
  end

  def user
    return User.where({id: self.user_id})
  end
end
