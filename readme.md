# [Lambda Black](https://marketplace.visualstudio.com/items?itemName=janw4ld.lambda-black)

> [!NOTE]
> HLS now implements [semantic token highlights](https://github.com/haskell/haskell-language-server/pulld/3892) as an off by default LS-extension, they aren't supported by this theme, at least not yet.

__Lambda Black__ is a VS Code color theme optimised for Haskell with extra syntax colors for more language scopes. It's based on [Groovy Lambda](https://marketplace.visualstudio.com/items?itemName=sheaf.groovylambda) but is very ungrooved, supports other languages than Haskell and improves their highlighting as well.

## Color schemes

Black:
<p align="center">
  <img src="https://raw.githubusercontent.com/janw4ld/lambda-black/main/img/black-screenshot.png" alt="Black color scheme" style="max-width:90%;">
</p>
Dark+:
<p align="center">
  <img src="https://raw.githubusercontent.com/janw4ld/lambda-black/main/img/dark-screenshot.png" alt="Dark+ color scheme" style="max-width:90%;">
</p>

## Features

Lambda Black supports all TextMate scopes provided by the [Haskell Syntax Highlighting](https://github.com/JustusAdam/language-haskell) VS Code extension, making it able to:

- disambiguate between data constructors and types in data declarations,
- distinguish qualified names from other identifiers,
- distinguish different uses of `@`: type application, record syntax or infix operator,
- special highlighting for record fields,
- highlights MagicHash and OverloadedLabels,

## Installation

You can get Lambda Black from:

- [Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=janw4ld.lambda-black)
- [Open-VSX Registry](https://open-vsx.org/extension/janw4ld/lambda-black)
- [GitHub Releases](https://github.com/janw4ld/lambda-black/releases/latest), install with `code --install-extension <file>.vsix`

Or install it from source:

## with nix

```bash
nix build github:janw4ld/lambda-black --refresh &&
  code --install-extension result/lambda-black-*.vsix
```

## without nix

1. Install dependencies:
    - [git](https://git-scm.com/downloads)
    - [npm](https://www.npmjs.com/get-npm), or pnpm or yarn

1. Clone the repo, build and install the extension:

    ```bash
    git clone --depth 1 git@github.com:janw4ld/lambda-black.git &&
      cd lambda-black && ({
        npx @vscode/vsce package
        code --install-extension lambda-black-*.vsix
      })
    ```

# Customisation
To change how something is highlighted, proceed as follows:

- While browsing code containing highlighting you'd like to change, start the TextMate scope inspector as follows:
  - open the VS Code Command Palette (Ctrl+Shift+P),
  - start typing "Inspect Editor Tokens and Scopes" and select this item from the dropdown menu.
- Click on the code whose highlighting you'd like to change; this will display the TextMate scopes associated to that piece of code. For instance, `if` in a Haskell source file is given the scope `keyword.control.if.haskell`.
- Open your `settings.json` file:
  - open the VS Code Command Palette (Ctrl+Shift+P),
  - start typing "Open Settings (JSON)" and select this item from the dropdown menu.
- Make the modifications by editing `editor.tokenColorCustomizations` in your settings. For instance, to highlight `if` and `then` in red and `else` in blue, one would write:

```json
    "editor.tokenColorCustomizations": {
      "textMateRules": [
        {
          "scope": [ "keyword.control.if", "keyword.control.then" ],
          "settings": {
            "foreground": "#ff0000"
          }
        },
        {
          "scope": "keyword.control.else",
          "settings": {
            "foreground": "#0000ff"
          }
        }
      ]
    }
```
