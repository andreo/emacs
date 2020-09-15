(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(setq el-get-user-package-directory "~/.emacs.d/el-get-init-files")
(el-get 'sync)

(dolist (package '(multiple-cursors
                   ace-isearch
                   expand-region
                   undo-tree
                   grep-ed
                   yaml-mode
                   dockerfile-mode
                   jade-mode
                   json-mode
                   markdown-mode
                   ztree
                   dtrt-indent ;; detect tab indentation

                   ;; go
                   go-autocomplete
                   go-company
                   go-def
                   go-eldoc
                   go-errcheck
                   go-flymake
                   go-imports
                   go-lint
                   go-mode
                   go-projectile
                   go-rename
                   go-test
                   go-to-char
                   ))
  (unless (string= "installed" (el-get-read-package-status package))
    (el-get-install package)))

(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")
                         ("marmalage" . "http://marmalade-repo.org/packages/")))
(package-initialize)

(load-file "~/.emacs.d/el-get-init-files/base.el")

(server-start)

