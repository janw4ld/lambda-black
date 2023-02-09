# [Lambda Black](https://marketplace.visualstudio.com/items?itemName=janw4ld.lambda-black)
__Lambda Black__ is a VS Code color theme optimised for Haskell with a black background. It's based on [Groovy Lambda](https://marketplace.visualstudio.com/items?itemName=sheaf.groovylambda) but is very ungrooved.

Supports the TextMate scopes provided by the [__Language Haskell__](https://github.com/JustusAdam/language-haskell) VS Code extension:

  * disambiguates between data constructors and types in data declarations,
  * visually clear appearance of qualified names,
  * distinguishes different uses of `@`: type application, record syntax or infix operator,
  * special highlighting for record fields,
  * highlights MagicHash and OverloadedLabels,
  * underlines recognised GHC language extensions.

<p align="center">
  <img src="https://pomf2.lain.la/f/usnu44hk.png" alt="Lambda Black example highlighting" style="max-width:90%;">
</p>

<sup>The extra colors also improve C/C++ syntax highlighting.</sup>

# Installation
Install the theme from the VS Code marketplace [here](https://marketplace.visualstudio.com/items?itemName=janw4ld.lambda-black).  
Alternatively, you can clone this repo into your VS Code extensions directory (usually $HOME/.vscode/extensions/), then restart VS Code.

# Customisation
To change how something is highlighted, proceed as follows:

  * While browsing code containing highlighting you'd like to change, start the TextMate scope inspector as follows:
    * open the VS Code Command Palette (Ctrl+Shift+P),
    * start typing "Inspect Editor Tokens and Scopes" and select this item from the dropdown menu.
  * Click on the code whose highlighting you'd like to change; this will display the TextMate scopes associated to that piece of code. For instance, `if` in a Haskell source file is given the scope `keyword.control.if.haskell`.
  * Open your `settings.json` file:
    * open the VS Code Command Palette (Ctrl+Shift+P),
    * start typing "Open Settings (JSON)" and select this item from the dropdown menu.
  * Make the modifications by editing the value of `editor.tokenColorCustomizations` in your settings.
    For instance, to highlight `if` and `then` in red and `else` in blue, one would write:

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
