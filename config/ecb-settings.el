(require 'ecb)

(ecb-layout-define "my-cscope-layout" right nil
                   (ecb-set-methods-buffer)
                   (ecb-split-ver 0.5 t)
                   (other-window 1)
                   (ecb-set-cscope-buffer))

(defecb-window-dedicator ecb-set-cscope-buffer " *ECB cscope-buf*"
                         (switch-to-buffer "*cscope*"))

(setq ecb-layout-name "my-cscope-layout")
