# frozen_string_literal: true

require_relative 'lib/rockparser/version'

Gem::Specification.new do |spec|
  spec.name = 'rockparser'
  spec.version = Rockparser::VERSION
  spec.authors = ['Jonathan Hartman']
  spec.email = ['j@hartman.io']

  spec.summary = 'A tool for merging and managing multiple music game libraries'
  spec.description = 'For music game streamers who take audience requests and ' \
                     'frequently add new songs or swap games and/or instruments'
  spec.homepage = 'https://github.com/hartmantis/rockparser'
  spec.license = 'Apache-2.0'
  spec.required_ruby_version = '>= 2.6.0'

  spec.metadata['allowed_push_host'] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata['homepage_ur'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = File.join(spec.homepage, 'blob/master/CHANGELOG.md')

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor])
    end
  end
  spec.bindir = 'bin'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency 'example-gem', '~> 1.0'

  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 1.21'
end
