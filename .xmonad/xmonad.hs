import XMonad
import XMonad.Config.Gnome

main = do
    xmonad $ gnomeConfig { 
        modMask = mod4Mask
    }
