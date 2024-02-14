# frozen_string_literal: true

module Rockparser
  class Input
    class Cfsm
      class Song
        # Parse and store song data from a hash object that got pulled from a
        # CFSM JSON export, e.g.
        #
        # {
        #   'rowId' => 1,
        #   'colKey' => 'TheCureBurn',
        #   'colRepairStatus' => 'NotRepaired',
        #   'colEnabled' => 'Yes',
        #   'colArtist' => 'The Cure',
        #   'colTitle' => 'Burn',
        #   'colDD' => '3',
        #   'colArrangements' => 'Bass, Lead, Rhythm, Vocals, Bass2, Rhythm2',
        #   'colTunings' => 'E Standard, E Standard, E Standard',
        #   'colTones' => '(Base) Bass1, (Base) Rhythm, (A) Rhythm, (B) Lead, (Base) Rhythm, (A) Rhythm',
        #   'colFilePath' => 'C:\\Games\\Steam\\steamapps\\common\\Rocksmith2014\\dlc\\TheCure_Burn_v2_2_DD_p.psarc',
        #   'colAppID' => '248750',
        #   'colToolkitVersion' => '2.6.1.0-0b3a24bf',
        #   'colPackageVersion' => '2.2',
        #   'colPackageRating' => 0,
        #   'colTagged' => 'False',
        #   'colArtistTitleAlbumDate' => 'The Cure;Burn;The Crow Original Motion Picture Soundtrack;0001-01-01T00:00:00'
        # }
        #
        def initialize(data)
          @artist = data['colArtist']
          @title = data['colTitle']
          @instruments = {}
          arrgs = data['colArrangements'].split(',').map { |a| a.strip }
          tunings = data['colTunings'].split(',').map { |t| t.strip }

          # We can't just iterate over everything in colArrangements because
          # some songs have multiple arrangements for one instrument. For our
          # purposes, lead and rhythm both count as just guitar.

          # TODO: What do we do/are there any cases where the lead and rhythm
          # parts use different tunings?

          {
            'Lead' => :guitar,
            'Rhythm' => :guitar,
            'Bass' => :bass
          }.each do |k, v|
            if arrgs.include?(k) && !@instruments.include?(v)
              @instruments[v] = tunings[arrgs.find_index(k)]
            end
          end
        end
      end
    end
  end
end