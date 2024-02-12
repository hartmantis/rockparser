# Rockparser

A tool for managing music streamer song libraries.

## Inspiration

I do weekly music streams alternating through a variety of instruments and
games.

To take audience requests, I use [StreamerSongList](https://www.streamersonglist.com).
However, as great a tool as it is, it doesn't support managing multiple
libraries, so I have to swap everything out between streams. SSL does have a
song import/export tool and an API.

## Design Notes

This project needs to support, at a minimum, the following:

***Song Library Input Formats***

- DLCQuickplay (JSON file, for all Rock Band games)
- CFSM (JSON file, for Rocksmith 2014)
- Clone Hero (has its own export function)

***Games***

- Rock Band 4 (via DLCQuickplay)
- Clone Hero

***Instruments***

- Drums (Rock Band 4, Clone Hero)
- Guitar (Rocksmith 2014)
- Bass (Rocksmith 2014)

***Output Formats***

Additional down-the-road support might be added for:

***Song Library Input Formats***

- RB4.app

***Games***

- Rock Band 3
- Rock Band 2
- YARG
- Rocksmith+
- Fortnite Festival


## Installation

TODO

## Usage

TODO

## Development

TODO

## Contributing

TODO

## License

The gem is available as open source under the terms of the [Apache 2.0 License](https://github.com/hartmantis/rockparser/blob/main/LICENSE).

## Code of Conduct

Everyone interacting in the Rockparser project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/hartmantis/rockparser/blob/main/CODE_OF_CONDUCT.md).
