require 'forwardable'
require 'rubygems'
require 'active_support'
require 'hashie'
require 'httparty'

module SDC

  def self.api_key
    @api_key ||= 'authorized-key'
  end

  def self.api_key=(value)
    @api_key = value
  end

  def self.tracking_id
    @tracking_id ||= '7000610'
  end

  def self.tracking_id=(value)
    @tracking_id = value
  end

  def self.map_mash_attrs(obj, mash)
    attrs = mash.map { |k, v| k.underscore }

    obj.class_eval do
      attr_accessor *attrs
    end

    mash.each do |k, v|
      obj.send("#{k.underscore}=", v)
    end
  end

end

directory = File.expand_path(File.dirname(__FILE__))


require File.join(directory, 'sdc', 'api_exception')
require File.join(directory, 'sdc', 'attribute_value')
require File.join(directory, 'sdc', 'attribute')
require File.join(directory, 'sdc', 'attribute_selection')
require File.join(directory, 'sdc', 'image')
require File.join(directory, 'sdc', 'feature_rating')
require File.join(directory, 'sdc', 'consumer_review')
require File.join(directory, 'sdc', 'store')
require File.join(directory, 'sdc', 'offer')
require File.join(directory, 'sdc', 'category_selection')
require File.join(directory, 'sdc', 'client')
require File.join(directory, 'sdc', 'client_tracking')
require File.join(directory, 'sdc', 'keyword_search')
require File.join(directory, 'sdc', 'dynamic_navigation_history')
require File.join(directory, 'sdc', 'feature')
require File.join(directory, 'sdc', 'feature_group')
require File.join(directory, 'sdc', 'offer_selection')
require File.join(directory, 'sdc', 'product_selection')
require File.join(directory, 'sdc', 'search_history')
require File.join(directory, 'sdc', 'server_detail')
require File.join(directory, 'sdc', 'product')
require File.join(directory, 'sdc', 'category')
require File.join(directory, 'sdc', 'generic_response')
require File.join(directory, 'sdc', 'general_search_response')
require File.join(directory, 'sdc', 'category_tree_response')


