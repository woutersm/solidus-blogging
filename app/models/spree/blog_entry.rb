require 'acts-as-taggable-on'

class Spree::BlogEntry < ActiveRecord::Base
  attr_accessible :title, :body, :tag_list, :visible, :published_at, :summary, :permalink
  acts_as_taggable
  before_save :create_permalink
  validates_presence_of :title
  validates_presence_of :body

  default_scope :order => "published_at DESC"
  scope :visible, where(:visible => true)
  scope :recent, lambda{|max=5| visible.limit(max) }

  has_one :blog_entry_image, :as => :viewable, :dependent => :destroy
  accepts_nested_attributes_for :blog_entry_image#, :reject_if => lambda { |image| image[:attachment].blank? }

  def entry_summary(chars=200)
    if summary.blank?
      "#{body[0...chars]}..."
    else
      summary
    end
  end

  def self.by_date(date, period = nil)
    if date.is_a?(Hash)
      keys = [:day, :month, :year].select {|key| date.include?(key) }
      period = keys.first.to_s
      date = Date.new(*keys.reverse.map {|key| date[key].to_i })
    end

    time = date.to_time.in_time_zone
    find(:all, :conditions => {:published_at => (time.send("beginning_of_#{period}")..time.send("end_of_#{period}") )} )
  end 

  def self.by_tag(name)
    tagged_with(name)
  end

  private

  def self.organize_blog_entries
    Hash.new.tap do |entries|
      years.each do |year|
        months_for(year).each do |month|
          date = Date.new(year, month)
          entries[year] ||= []
          entries[year] << [date.strftime("%B"), self.by_date(date, :month)]
        end
      end
    end
  end

  def self.years
    all.map {|e| e.published_at.year }.uniq
  end

  def self.months_for(year)
    all.select {|e| e.published_at.year == year }.map {|e| e.published_at.month }.uniq
  end

  def create_permalink
    self.permalink = title.to_url if permalink.blank?
  end

  def validate
    # nicEdit field contains "<br>" when blank
    errors.add(:body, "can't be blank") if body =~ /^<br>$/
  end

end 
