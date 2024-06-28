;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

(package! obsidian)

(unpin! org-roam)
(package! org-roam-ui)

;; (require 'org-roam)
;; (setq org-roam-directory (file-truename "path/to/org-roam-directory"))
;; ;; file-truename is optional; it seems required when you use symbolic
;; ;; links, which Org-roam does not resolve
;; (setq org-roam-file-extensions '("org" "md")) ; enable Org-roam for a markdown extension
;; (add-to-list 'load-path "path/to/md-roam") ; installation as above
;; (require 'md-roam)
;; (md-roam-mode 1) ; md-roam-mode must be active before org-roam-db-sync
;; (setq md-roam-file-extension "md") ; default "md". Specify an extension such as "markdown"
;; (org-roam-db-autosync-mode 1) ; autosync-mode triggers db-sync. md-roam-mode must be already active
