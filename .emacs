(setq path-to-ctags "/opt/homebrew/bin/ctags")

;; function to create tags, run with M-x create-tags
(defun create-tags (dir-name)
    "Create tags file."
    (interactive "DDirectory: ")
    (shell-command
     (format "%s -f TAGS -e -R %s" path-to-ctags (directory-file-name dir-name)))
  )

(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

(require 'rust-mode)
(setq rust-format-on-save t)
(add-hook 'rust-mode-hook
          (lambda () (prettify-symbols-mode)))
(define-key rust-mode-map (kbd "C-c C-c") 'rust-run)
(add-hook 'rust-mode-hook 'eglot-ensure)
(add-hook 'rust-mode-hook #'lsp)


(add-hook 'org-mode-hook
          (lambda ()
            (font-lock-add-keywords
             nil
             '(("^-\\{5,\\}"  0 '(:foreground "green" :weight bold))))))

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

;;(define-key dired-mode-map (kbd "<mouse-2>") #'dired-mouse-find-file)
;;(define-key dired-mode-map (kbd "<RET>") #'dired-find-file)

(add-hook 'text-mode-hook #'auto-fill-mode)
(setq-default fill-column 80)
(add-hook 'prog-mode-hook #'auto-fill-mode)

(setq org-agenda-files '("~/agenda.org"))

(setq org-startup-indented t
      org-src-tab-acts-natively t)

(font-lock-add-keywords 'org-mode
                          '(("^ *\\([-]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(setq org-ellipsis "▾")

(package-install 'julia-mode)
(require 'julia-mode)`

(add-to-list 'load-path /opt/homebrew/bin/julia)
(require 'julia-repl)
(add-hook 'julia-mode-hook 'julia-repl-mode) ;; always use minor mode

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(custom-enabled-themes '(dracula))
 '(custom-safe-themes
   '("18bec4c258b4b4fb261671cf59197c1c3ba2a7a47cc776915c3e8db3334a0d25" "b4ba3e1bba2e303265eb3e9753215408e75e031f7c894786ad04cabef46ff94c" default))
 '(package-selected-packages
   '(rust-mode unicode-fonts ssh go-autocomplete go-add-tags go evil-ledger ledger-mode jupyter prettify-greek ox-twbs lsp-mode lua-mode luarocks helm magit emmet-mode ruby-interpolation ruby-interpolationppet-classic-snippets ruby-compilation haskell-emacs go-mode perlbrew julia-shell julia-repl julia-mode org-bullets use-package git org-evil evil-org ctags-update dracula-theme evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/") 

(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)

;; Don't change the font size for some headings and titles (default t)
(setq dracula-enlarge-headings nil)

;; Adjust font size of titles level 1 (default 1.3)
(setq dracula-height-title-1 1.25)

;; Adjust font size of titles level 2 (default 1.1)
(setq dracula-height-title-1 1.15)

;; Adjust font size of titles level 3 (default 1.0)
(setq dracula-height-title-1 1.05)

;; Adjust font size of document titles (default 1.44)
(setq dracula-height-doc-title 1.4)

;; Use less pink and bold on the mode-line and minibuffer (default nil)
(setq dracula-alternate-mode-line-and-minibuffer t)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(package-refresh-contents)

;; Download Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))

;; Enable Evil
(require 'evil)
(evil-mode 1)

;;(autoload 'ledger-mode "ledger-mode" "A major mode for Ledger" t)
;;(add-to-list 'load-path
  ;;           (expand-file-name "/path/to/ledger/source/lisp/"))
;;(add-to-list 'auto-mode-alist '("\\.ledger$" . ledger-mode))

(setq inhibit-splash-screen t)
(org-agenda-list)
(delete-other-windows)
