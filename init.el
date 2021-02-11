(require 'package)


(setq package-archives '(("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")

                         ("org" . "http://orgmode.org/elpa/")
		                     ("gnu"  . "http://elpa.gnu.org/packages/")))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (flycheck elixir-mode markdown-mode rainbow-delimiters cider clojure-mode magit deadgrep ido-vertical-mode powerline auto-complete elpy paredit doom-modeline doom-themes use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'use-package)
(setq use-package-always-ensure t)

(use-package doom-themes
  :ensure t
  :config
  (require 'doom-themes)
  (if window-system
    (progn
      (load-theme 'doom-one t)
      )
    (load-theme 'zenburn t))
  (doom-themes-neotree-config)
  (doom-themes-org-config))

(use-package doom-modeline
  :config
  (require 'doom-modeline)
  (doom-modeline-mode 1)
  )


(use-package paredit
  :config
  (autoload 'enable-paredit-mode "paredit"
  "Turn on pseudo-structural editing of Lisp code."
  t))

(use-package elpy
  :config
  (elpy-enable)
  )

;; Enable Flycheck

(when (require 'flycheck nil t)

  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))

  (add-hook 'elpy-mode-hook 'flycheck-mode))


(use-package auto-complete
     :config
     (ac-config-default))


(use-package powerline
  :config
  (powerline-default-theme))


(use-package ido-vertical-mode
  :config
  (require 'ido-vertical-mode)
  (ido-mode 1)
  (setq ido-enable-flex-matching t)
  (setq ido-use-faces t)
  (set-face-attribute 'ido-vertical-first-match-face nil
                      :background nil
                      :foreground "#80CBC4")
  (set-face-attribute 'ido-vertical-only-match-face nil
                      :background nil
                      :foreground nil)
  (set-face-attribute 'ido-vertical-match-face nil
                      :foreground nil)
  (ido-vertical-mode 1)
  (setq ido-vertical-define-keys 'C-n-C-p-up-down-left-right)
  (setq ido-vertical-show-count t))


(use-package deadgrep
  :config
  (global-set-key (kbd "<f3>") #'deadgrep)
  )


(use-package magit)

(use-package clojure-mode)
(use-package cider)
(use-package rainbow-delimiters)

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

;; (use-package neotree)
;; (require 'neotree)
;; (setq neotree-mode t)
;; (setq neo-smart-open t)
;; (neotree-toggle)

(unless (package-installed-p 'elixir-mode)
  (package-install 'elixir-mode))

;; Highlights *.elixir2 as well
(add-to-list 'auto-mode-alist '("\\.elixir2\\'" . elixir-mode))


(add-hook 'emacs-lisp-mode-hook       'enable-paredit-mode)
(add-hook 'lisp-mode-hook             'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook 'enable-paredit-mode)
(add-hook 'scheme-mode-hook           'enable-paredit-mode)
(add-hook 'clojure-mode-hook #'paredit-mode)
(add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)

(cua-mode t)

;; set utf-8 as default
(set-language-environment "UTF-8")

;; enable line nums and display column number
(global-linum-mode t)
(setq linum-format "%d ")
(setq column-number-mode t)

;;disable toolbar
(tool-bar-mode -1)
;;disable menubar
(menu-bar-mode -1)
;;disable scrollbar
(scroll-bar-mode -1)
;;display time
(display-time-mode 1)


(setq frame-title-format
          '(buffer-file-name "%f"
			     (dired-directory dired-directory "%b")))


;; hilight cursor's current line
(global-hl-line-mode +1)




;; org-agenda
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)



