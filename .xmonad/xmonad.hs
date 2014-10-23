import XMonad
import XMonad.Config.Xfce
import XMonad.Util.EZConfig (additionalKeysP)

main = xmonad $ xfceConfig
       { 
	 modMask = mod4Mask
        ,terminal = "x-terminal-emulator"   
       } `additionalKeysP`
       [
	("M-p", spawn "dmenu_run")
       ]
