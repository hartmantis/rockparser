# frozen_string_literal: true

module Rockparser 
  class Song
    attr_reader :artist, :title, :genre, :instruments

    def initialize(artist, title)
      @artist = artist
      @title = title
      @active = false
      @genre = nil
      @instruments = {}
    end

    def active?
      @active
    end
  end
end