# Changelog
All notable changes to the RTG-tools Docker file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

This project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [Unreleased]

## [3.12.1] - 2023-02-17
### Added
- Add GitHub autobuild action
- Add default user and group
- Add GitHub repo URL to image source metadata

### Changed
- Update RTG-tools version to 3.12.1 from 3.12
- Replace `bl-base` with `condaforge/mambaforge` as the builder image
- Set default user so not using root
- Change reference to image location from Docker Hub to GitHub container registry in README.md

### Removed
- Remove `bl-base` from list of dependencies in metadata.yaml

## [3.12] - 2021-05-07
### Added
- Migrated RTG-tools dockerfile to its own repository
