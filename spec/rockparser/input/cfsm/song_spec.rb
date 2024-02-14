# frozen_string_literal: true

require_relative '../../../spec_helper'
require_relative '../../../../lib/rockparser/input/cfsm/song'

RSpec.describe Rockparser::Input::Cfsm::Song do
  let(:data) do
    {
      'rowId' => 1,
      'colKey' => 'TheCureBurn',
      'colRepairStatus' => 'NotRepaired',
      'colEnabled' => 'Yes',
      'colArtist' => 'The Cure',
      'colTitle' => 'Burn',
      'colDD' => '3',
      'colArrangements' => 'Bass, Lead, Rhythm, Vocals, Bass2, Rhythm2',
      'colTunings' => 'E Standard, E Standard, E Standard',
      'colTones' => '(Base) Bass1, (Base) Rhythm, (A) Rhythm, (B) Lead, (Base) Rhythm, (A) Rhythm',
      'colFilePath' => 'C:\\Games\\Steam\\steamapps\\common\\Rocksmith2014\\dlc\\TheCure_Burn_v2_2_DD_p.psarc',
      'colAppID' => '248750',
      'colToolkitVersion' => '2.6.1.0-0b3a24bf',
      'colPackageVersion' => '2.2',
      'colPackageRating' => 0,
      'colTagged' => 'False',
      'colArtistTitleAlbumDate' => 'The Cure;Burn;The Crow Original Motion Picture Soundtrack;0001-01-01T00:00:00'
    }
  end
  let(:obj) { described_class.new(data) }

  describe '.initialize' do
    it 'correctly sets the artist name' do
      expect(obj.artist).to eq('The Cure')
    end

    it 'correctly sets the song title' do
      expect(obj.title).to eq('Burn')
    end

    it 'correctly sets the instrument tunings' do
      exp = {
        guitar: 'E Standard',
        bass: 'E Standard'
      }
      expect(obj.instruments).to eq(exp)
    end
  end
end