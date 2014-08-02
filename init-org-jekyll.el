(org-babel-do-load-languages
 'org-babel-load-languages
 '( (scheme . t)
    (latex . t)
    (css . t)
    (ruby . t)
    (sh . t)
    (python . t)
    (emacs-lisp . t)
    (matlab . t)
    (C . t)))
(setq org-confirm-babel-evaluate nil)

(setq org-src-fontify-natively t)

;; (setq org-export-with-sub-superscripts nil)

(setq org-publish-project-alist
      '(
        ("jekyll-cheukyin" ;; settings for cute-jumper.github.io
         :base-directory "~/Cheukyin.github.io/_org/"
         :base-extension "org"
         :publishing-directory "~/Cheukyin.github.io/"
         :recursive t
         :publishing-function org-html-publish-to-html
         :with-toc nil
         :headline-levels 4
         :auto-preamble nil
         :auto-sitemap nil
         :html-extension "html"
         :table-of-contents nil
         :section-numbers t
         :html_head "<link rel=\"stylesheet\" type=\"text/css\" href=\"../assets/themes/havee/css/style.css\" />"
         :body-only t)

        ("org-static-cheukyin"
          :base-directory "~/Cheukyin.github.io/_org/assets/"
          :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|php"
          :publishing-directory "~/Cheukyin.github.io/assets/"
          :recursive t
          :publishing-function org-publish-attachment)

        ("jekyll-cheukyin-github-io" :components ("jekyll-cheukyin" "org-static-cheukyin"))
        ))

(defvar jekyll-directory (expand-file-name "~/Cheukyin.github.io/_org/")
  "Path to Jekyll blog.")
(defvar jekyll-drafts-dir "_drafts/"
  "Relative path to drafts directory.")
(defvar jekyll-posts-dir "_posts/"
  "Relative path to posts directory.")
(defvar jekyll-post-ext ".org"
  "File extension of Jekyll posts.")
(defvar jekyll-post-template
  "#+BEGIN_HTML\n---\nlayout: post\ntitle: %s\nexcerpt: \nkeywords: \"\"\ncategories: \ntags: []\n---\n{%% include JB/setup %%}\n#+END_HTML\n\n* \n\n\n#+BEGIN_HTML\n<!-- more-forword -->\n#+END_HTML\n\n\n#+BEGIN_HTML\n<!-- more -->\n#+END_HTML\n"
  "Default template for Jekyll posts. %s will be replace by the post title.")

(defun jekyll-make-slug (s)
  "Turn a string into a slug."
  (replace-regexp-in-string
   " " "-" (downcase
            (replace-regexp-in-string
             "[^A-Za-z0-9 ]" "" s))))

(defun jekyll-yaml-escape (s)
  "Escape a string for YAML."
  (if (or (string-match ":" s)
          (string-match "\"" s))
      (concat "\"" (replace-regexp-in-string "\"" "\\\\\"" s) "\"")
    s))

(defun jekyll-draft-post (title)
  "Create a new Jekyll blog post."
  (interactive "sPost Title: ")
  (let ((draft-file (concat jekyll-directory jekyll-drafts-dir
                            (jekyll-make-slug title)
                            jekyll-post-ext)))
    (if (file-exists-p draft-file)
        (find-file draft-file)
      (find-file draft-file)
      (insert (format jekyll-post-template (jekyll-yaml-escape title))))))

(defun jekyll-publish-post ()
  "Move a draft post to the posts directory, and rename it so that it
 contains the date."
  (interactive)
  (cond
   ((not (equal
          (file-name-directory (buffer-file-name (current-buffer)))
          (concat jekyll-directory jekyll-drafts-dir)))
    (message "This is not a draft post."))
   ((buffer-modified-p)
    (message "Can't publish post; buffer has modifications."))
   (t
    (let ((filename
           (concat jekyll-directory jekyll-posts-dir
                   (format-time-string "%Y-%m-%d-")
                   (file-name-nondirectory
                    (buffer-file-name (current-buffer)))))
          (old-point (point)))
      (rename-file (buffer-file-name (current-buffer))
                   filename)
      (kill-buffer nil)
      (find-file filename)
      (set-window-point (selected-window) old-point)))))

(provide 'init-org-jekyll)
