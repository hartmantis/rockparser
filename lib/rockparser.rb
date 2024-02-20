# frozen_string_literal: true

require 'optparse'
require_relative 'rockparser/version'

module Rockparser
  class Error < StandardError; end

  def run
    options = {
      config_path: File.path(File.join(Dir.getcwd, 'config.yml')),
      output_style: :ssl,
      rock_band_4_paths: [],
      clone_hero_paths: [],
      rocksmith_2014_paths: [],
      rock_band_4_guitar: false,
      rock_band_4_bass: false,
      rock_band_4_drums: false,
      rock_band_4_vocals: false,
      clone_hero_guitar: false,
      clone_hero_bass: false,
      clone_hero_drums: false,
      rocksmith_2014_guitar: false,
      rocksmith_2014_bass: false
    }

    parser = OptionParser.new do |opts|
      opts.banner = "Usage: #{File.basename(__FILE__)} ..."

      opts.on('-c PATH', '--config-path PATH', 'Path to a YAML config file') do
        options[:config_path] = File.path(File.join(Dir.getcwd, p))
      end

      opts.on('-rs2014 PATH', '--rocksmith-2014-path PATH', 'Path to a Rocksmith 2014/Customsforge JSON file') do |p|
        options[:rocksmith_2014_paths] << File.path(File.join(Dir.getcwd, p))
      end

      opts.on('-rb4 PATH', '--rock-band-4-path DATA', 'Path to a Rock Band 4/DLCQuickplay CSV file') do |p|
        options[:rock_band_4_paths] << File.path(File.join(Dir.getcwd, p))
      end

      opts.on('-ch PATH', '--clone-hero-path PATH', 'Path to a Clone Hero exported song list') do |p|
        options[:clone_hero_paths] << File.path(File.join(Dir.getcwd, p))
      end

      %w[guitar bass].each do |i|
        opts.on("-rs2014#{i[0]}", "--rocksmith-2014-#{i}", "Mark songs for #{i} in Rocksmith 2014 as active") do |p|
          options[:"rocksmith_2014_#{i}"] = true
        end
      end

      %w[guitar bass drums vocals].each do |i|
        opts.on("-rb4#{i[0]}", "--rock-band-4-#{i}", "Mark songs for #{i} in Rock Band 4 as active") do |p|
          options[:"rock_band_4_#{i}"] = true
        end
      end

      %w[guitar bass drums].each do |i|
        opts.on("-ch#{i[0]}", "--clone-hero-#{i}", "Mark songs for #{i} in Clone Hero as active") do |p|
          options[:"clone_hero_#{i}"] = true
        end
      end

      opts.on('-o' '--output', 'Set the output style; currently supports SSL (StreamerSongList) only') do |p|
        options[:output_style] = p
      end
    end

    parser.parse!

    unless File.exist?(options[:config_path])
      puts parser.help
      exit 1
    end

    library = Rockparser::Library.new(options)

    puts library.to_csv
  end
end
