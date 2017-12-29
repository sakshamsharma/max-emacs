max-emacs
=========

A modular and awesome emacs configuration, featuring the cast of Fast and Furious (READ: Blazing fast startup speeds)

```
  _____  _____   ___  ___           ____    _____  _____     ____    ______
 /     \ \__  \  \  \/  /  ______ _/ __ \  /     \ \__  \  _/ ___\  /  ___/
|  Y Y  \ / __ \_ >    <  /_____/ \  ___/ |  Y Y  \ / __ \_\  \___  \___ \
|__|_|  /(____  //__/\_ \          \___  >|__|_|  /(____  / \___  >/____  >
      \/      \/       \/              \/       \/      \/      \/      \/
```

# Installation

Why? That's a perfectly sane question. Ideally, you should be cloning this repo, and then pulling necessary things into your Emacs config. Or better, getting inspired by this config structure and replicating it in yours.

Still, if you want the easy way, here's it:
Simple, backup your ```.emacs.d``` folder, pull this repo in there. Done.

```
cd ~
cp -r .emacs.d .emacs.old
mv .emacs .emacs.oldcfg
git clone https://github.com/sakshamsharma/max-emacs
```

For some reason, the package `neotree` doesn't get loaded automatically. You'd need to do `M-x package-install [Ret] neotree` to install it.

# Highlights
+ Blazing fast! Despite having dozens of packages, Emacs daemon starts up in less than 4 seconds.
+ Tailor-configured for Haskell, TypeScript, Scala and usual others. Works great with many other languages.
+ Modular. All elisp code is split into files named according to what the code does.
+ Optional evil-mode which is completely ready for regular use with all languages (I used it for more than an year). Can be enabled by simply swapping comments on 2 lines in `init.el`.
+ Package management as a simple list of packages.
