class Post < ActiveRecord::Base
  attr_accessible :content, :date, :name, :price, :title, :day, :month

  validates :title, :presence   => true
  validates :content, :presence => true,
                      :length   => { :minimum => 5 }
  validates :name, :presence    => true,
                   :length      => { :minimum => 2 }    
end
