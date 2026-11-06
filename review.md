# Listing review

A pull request to this repo adds or updates a pointer. It does not add the package.

Include only the catalog file for the type you are listing, plus `removed.json` when an id is yanked.

Each listing needs:

- `id`: lowercase slug, unique within that file (`amber`, `weekly-plan`)
- `name`: display name
- `author`: the person or group who maintains it
- `description`: one sentence
- `repo`: `owner/name` of the GitHub repository that contains the package

You must own that repository or have the owner's permission to list it. The app will download the package from that repo. Do not paste the package's JSON, HTML, or code into this repository.

Themes may add `screenshot` (a filename in the author's repo) and `modes` (`["dark"]`, `["light"]`, or both).

Do not submit app bugs, feature requests, or installers here.
