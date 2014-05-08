import XMonad
import XMonad.Config.Gnome
import XMonad.Util.EZConfig (additionalKeysP)

main = do
    xmonad $ 
               (gnomeConfig { 
                  modMask = mod4Mask
                }
                `additionalKeysP`
                [("M-p", spawn "dmenu_run")])
