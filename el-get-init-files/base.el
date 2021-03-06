
(setq delete-by-moving-to-trash t)
(setq trash-directory "~/.Trash")
(setq x-select-enable-clipboard t)

;; ignore case
(setq read-file-name-completion-ignore-case t)
(setq read-buffer-completion-ignore-case t)
(setq completion-ignore-case t)

(global-set-key (kbd "\e\ef") 'find-dired)
(global-set-key (kbd "\e\eg") 'rgrep)
;; (global-set-key (kbd "<f9>") 'next-error)
;; (global-set-key (kbd "S-<f9>") 'previous-error)
;; (global-set-key (kbd "C-<f9>") 'first-error)

;; appearance
(setq visible-bell t)
(setq require-final-newline nil)
(setq column-number-mode t)
(setq next-line-add-newlines nil)

;; dont show startup message
(setq inhibit-startup-message t)
(fset 'yes-or-no-p 'y-or-n-p)
(setq auto-save-interval 50)

;; for M-x occur
(setq list-matching-lines-default-context-lines 1)

;; counting functions
(defalias 'lc 'count-lines-page)

(iswitchb-mode 1)

;; kill buffer
(defun kill-current-buffer ()
  (interactive)
  (kill-buffer (current-buffer)))
(global-set-key (kbd "C-x k") 'kill-current-buffer)

;; spaces instead of tabs
(setq-default indent-tabs-mode nil)
(setq indent-tabs-mode nil)

;;disabling tool-bar
(tool-bar-mode -1)

;; showing trailing whitespace
(setq show-trailing-whitespace t)

(show-paren-mode)

;;(global-set-key "\r" 'newline-and-indent)

(add-hook 'dired-mode-hook
          '(lambda ()
             (local-set-key (kbd "C-c C-e") 'wdired-change-to-wdired-mode)))

(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
             (local-set-key (kbd "C-c v") 'eval-buffer)))

(dolist (name '("cedet.el"
                "fileman.el"
                "ido.el"))
  (load-file (concat "~/.emacs.d/el-get-init-files/" name)))

(defun setup-js-mode ()
  (setq js-indent-level 2)
  (setq tab-width 2))

(add-hook 'js-mode-hook 'setup-js-mode)

;; nodejs
(pushnew
 '(nodejs "\\(node_modules/.+\\):\\([0-9]+\\):\\([0-9]+\\)" 1 2 3)
 compilation-error-regexp-alist-alist)
(pushnew 'nodejs compilation-error-regexp-alist)

;; disable annoying visible bell
(setq visible-bell nil)

(require 'dtrt-indent)
(dtrt-indent-mode 1)
