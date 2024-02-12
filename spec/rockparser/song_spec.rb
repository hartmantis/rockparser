# frozen_string_literal: true

require_relative '../spec_helper'
require_relative '../../lib/rockparser/song'

RSpec.describe Rockparser::Song do
  let(:obj) do
    o = described_class.new
    o.instance_variable_set(:@artist, '"Weird Al" Yankovic')
    o.instance_variable_set(:@title, 'My Own Eyes')
    o.instance_variable_set(:@genre, 'Novelty')
    o
  end

  describe '.initialize' do
    it 'correctly sets the artist name' do
      expect(obj.artist).to eq('"Weird Al" Yankovic')
    end

    it 'correctly sets the song title' do
      expect(obj.title).to eq('My Own Eyes')
    end

    it 'correctly sets the song genre' do
      expect(obj.genre).to eq('Novelty')
    end

    it 'defaults the song to inactive' do
      expect(obj.active?).to eq(false)
    end
  end
end
