
(defun fileman-open-path (file-manager path)
  "Open DIRECTORY using PROGRAM"
  (call-process file-manager nil 0 nil path))

(setq fileman-mapping
      (list 'windows-nt "explorer.exe"
	    'gnu/linux "/usr/bin/nautilus"))

(defun fileman-open-current-directory ()
  (interactive)
  (fileman-open-path
   (getf fileman-mapping system-type)
   (expand-file-name default-directory)))

(setq fileman-terminal-mapping
      (list 'windows-nt "cmd.exe"
	    'gnu/linux "/usr/bin/gnome-terminal"))

(defun fileman-open-terminal-current-directory ()
  (interactive)
  (fileman-open-path
   (getf fileman-terminal-mapping system-type)
   (expand-file-name default-directory)))

(global-set-key (kbd "\e\ere") 'fileman-open-current-directory)
(global-set-key (kbd "\e\ert") 'fileman-open-terminal-current-directory)
