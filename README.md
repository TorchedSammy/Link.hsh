# Link.hsh
> Link utilities for Hilbish!

**`Link.hsh`** is a Hilbish plugin to provide small quality of life
things to Hilbish that relate to links. This includes:
- Automatically perform an action based on a link provided. (`autoLinkAction`)
  - This means that you can just paste a link (example a github link)
  and it'll run git clone!
- Auto-quote links (soontm)

> **Warning**
> Work in progress.

# Setup
Clone to the Hilbish autostart directory, which you can find
by `print(hilbish.userDir.data .. '/hilbish/start/')`:
```
git clone --depth 1 https://github.com/TorchedSammy/Link.hsh ~/.local/share/hilbish/start/link
```

And then set `linkAction` as your runner in your config with:
```
hilbish.runner.setCurrent 'linkActions'
```

???
Profit!

Now you can just paste a GitHub or Gitlab link and it'll clone.
If you think other links would be a good suggestion, open an issue.

# License
MIT
