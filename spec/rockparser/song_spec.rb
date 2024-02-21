# frozen_string_literal: true

require_relative '../spec_helper'
require_relative '../../lib/rockparser/song'

RSpec.describe Rockparser::Song do
  let(:obj) do
    described_class.new('"Weird Al" Yankovic', 'My Own Eyes')
  end

  describe '.initialize' do
    it 'correctly sets the artist name' do
      expect(obj.artist).to eq('"Weird Al" Yankovic')
    end

    it 'correctly sets the song title' do
      expect(obj.title).to eq('My Own Eyes')
    end

    it 'defaults the genre to nil' do
      expect(obj.genre).to eq(nil)
    end

    it 'defaults the instruments to an empty set' do
      expect(obj.instruments).to eq({})
    end

    it 'defaults the song to inactive' do
      expect(obj.active?).to eq(false)
    end
  end

  describe '#artist' do
    it 'returns the artist name' do
      expect(obj.artist).to eq('"Weird Al" Yankovic')
    end
  end

  describe '#title' do
    it 'returns the song title' do
      expect(obj.title).to eq('My Own Eyes')
    end
  end

  describe '#genre' do
    it 'returns the song genre' do
      expect(obj.genre).to eq(nil)
    end
  end

  describe '#instruments' do
    it 'returns the song instrument set' do
      expect(obj.instruments).to eq({})
    end
  end
end
