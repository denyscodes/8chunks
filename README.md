<p align="center">
    <img src="./screenshots/logo.svg" width="400" max-width="90%" alt="8 chunks" />
</p>

[![Swift Version][swift-image]][swift-url]
[![License][license-image]][license-url]
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

Welcome to **8 chunks**, an iOS SwiftUI app for creating playlists from Youtube video chunks.

The initial aim was to create a tool for building workout playlists from different pieces of different youtube videos, but it can be used for other playlists as well.

## Requirements

- iOS 13
- Swift 5
- Xcode 11

## Installation

Use the package manager [pip](https://pip.pypa.io/en/stable/) to install dependencies for `./scripts/update_playlists.py`.

```bash
pip3 install youtube_dl
pip3 install pyyaml
pip3 install furl
```

## Usage

1. Edit playlists file at `./8chunks/Resources/resources.yaml`

   <img src="./screenshots/playlists_yaml.png"  width="400" max-width="75%" alt="playlists_ios.png">

2. Update playlists by running `update_playlists.py` script

   ```bash
   cd scripts
   python3 update_playlists.py
   ```

3. Run through Xcode

   <img src="./screenshots/playlists_ios.png" width="300" max-width="33%" alt="playlists_ios.png">
   <img src="./screenshots/player_ios.png" width="300" max-width="33%" alt="player_ios.png">

## TODO

- [ ] Setting min duration for a clip in a playlist
- [ ] Background audio playlist
- [ ] Add Python script to Xcode Run Script
- [ ] Custom player

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License

[MIT](https://choosealicense.com/licenses/mit/)

[swift-image]: https://img.shields.io/badge/swift-5.0-orange.svg
[swift-url]: https://swift.org/
[license-image]: https://img.shields.io/badge/License-MIT-blue.svg
[license-url]: LICENSE
