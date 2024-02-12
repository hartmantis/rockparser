# frozen_string_literal: true

# require_relative 'song/cfsm'
# require_relative 'song/dclquickplay'

module Rockparser
  class Song
    attr_reader :artist, :title, :genre

    def initialize
      @active = false
    end

    def active?
      @active
    end
  end
end