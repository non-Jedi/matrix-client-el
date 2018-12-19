;; This file can be evaluated with an empty Emacs config to test installation and connection from
;; scratch.  For example, this shell command makes it easy:

;; su -l -c 'rm -rf /home/test-user/.emacs.d/elpa/matrix-client-*; emacs /home/test-user/test-clean.el --eval="(eval-buffer)"' test-user

;; You might want to use something like kdesudo instead of su, so you could run Emacs's GUI rather
;; than in a terminal.

;; You could also change (matrix-client-frame) to (matrix-client-connect "@username:matrix.org"
;; "password") to save more time, but of course, be careful with saving your password to disk in a
;; text file, be careful not to share the file, etc.

;; package.el

(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

;; Quelpa

(unless (package-installed-p 'quelpa-use-package)
  (defun install-quelpa ()
    (package-install 'quelpa-use-package))
  (add-hook 'package--post-download-archives-hook #'install-quelpa)
  (add-hook 'package--post-download-archives-hook (lambda ()
                                                    (switch-to-buffer "test-clean.el")))
  (package-list-packages))

(require 'quelpa-use-package)

;; matrix-client

(use-package matrix-client
  :quelpa ((matrix-client :fetcher github :repo "jgkamat/matrix-client-el"
			  :files (:defaults "logo.png"))
	   :upgrade t))

(setq matrix-log t)
(setq matrix-warn-unimplemented t)

(matrix-client-frame)
