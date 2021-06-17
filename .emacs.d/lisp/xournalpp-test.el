;; This buffer is for text that is not saved, and for Lisp evaluation.
;; To create a file, visit it with <open> and enter text in its buffer.



(defun org-notebook-annotate-pdf ()
  "Insert an image with auto-completion for the next image name and open the drawing program"
  (interactive)
  (let ((org-notebook-image-filepath
	 (read-file-name "PDF: ")))
    (defun convert-to-pdf (process event)
      "converts xopp to pdf"
       (set-process-sentinel (start-process "xournalpp_convert" nil "xournalpp" (concat org-notebook-image-filepath ".xopp") "-p" org-notebook-image-filepath) 'org-redisplay-inline-images))

    (start-process "xournalpp_annotate" nil "~/.emacs.d/lisp/xournalpp-edit-and-convert-to-pdf.sh" org-notebook-image-filepath)
    (insert "[[" org-notebook-image-filepath "-output.pdf]]")))
					;'(lambda (process event) (set-process-sentinel (start-process "xournalpp_convert" nil "xournalpp" (concat org-notebook-image-filepath ".xopp") "-p" org-notebook-image-filepath) 'org-redisplay-inline-images)))));xournalpp-convert-to-image)))

(org-notebook-annotate-pdf)

()

