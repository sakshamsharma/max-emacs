max-emacs
=========

A modular and awesome emacs configuration.

```
  _____  _____   ___  ___           ____    _____  _____     ____    ______
 /     \ \__  \  \  \/  /  ______ _/ __ \  /     \ \__  \  _/ ___\  /  ___/
|  Y Y  \ / __ \_ >    <  /_____/ \  ___/ |  Y Y  \ / __ \_\  \___  \___ \ 
|__|_|  /(____  //__/\_ \          \___  >|__|_|  /(____  / \___  >/____  >
      \/      \/       \/              \/       \/      \/      \/      \/ 
```

# Installation

Why? That's a perfectly sane question. Ideally, you should be cloning this repo, and then pulling necessary things into your Emacs config.

Still, if you want the easy way, here's it:
Simple, backup your ```.emacs.d``` folder, pull this repo in there. Done.

```
cd ~
cp -r .emacs.d .emacs.old
cp .emacs .emacs.oldcfg
git clone https://github.com/sakshamsharma/max-emacs
```

# Highlights
+ Tailor-configured for Haskell. Works great with Javascript, Dart and C++. Other languages would be added as and when needed :)
+ Modular. All elisp code is split into files named according to what the code does.
+ [Helm](https://github.com/emacs-helm/helm) and [Ace-jump](https://github.com/winterTTr/ace-jump-mode) make life so much easier!
+ An awesome powerline modeline, with many packages to improve it's look.
+ Package management as a simple list of packages.
+ The awesome spacemacs theme!
+ The fact that this all was written by a person one month into EMacs, and thus is simple to read :smile:
