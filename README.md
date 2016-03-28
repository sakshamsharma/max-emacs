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

Why? That's a perfectly sane question. Ideally, you should be cloning this repo, and then pulling necessary things into your Emacs config.

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
+ Blazing fast! Despite having dozens of packages, Emacs starts up in less than 1.5 seconds.
+ Tailor-configured for Haskell, JavaScript, Scala and others. Works great with many other languages.
+ Modular. All elisp code is split into files named according to what the code does.
+ [Helm](https://github.com/emacs-helm/helm) and [Avy](https://github.com/abo-abo/avy) make life so much easier!
+ An awesome powerline modeline, with many packages to improve it's look.
+ Package management as a simple list of packages.
+ The awesome spacemacs theme! (Not to forget, the spaceline theme to go with it)
