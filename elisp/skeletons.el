;;; skeletons.el -- Skeletons for programs
;;; Commentary:

;;; Code:

(eval-after-load 'autoinsert
  '(define-auto-insert
     '("\\.\\(CC?\\|cc\\|cxx\\|cpp\\|c++\\)\\'" . "C++ skeleton")
     '(nil
       "// " (file-name-nondirectory (buffer-file-name)) > \n \n
       "#include <bits/stdc++.h>" \n
       "#define endl '\n'" \n
       "typedef long long int ll;" \n \n
       "using namespace std;" \n \n
       "int main() {" \n
       "std::ios::sync_with_stdio(false);" \n
       "// cin.tie(NULL);" \n
       > _ \n
       "}" > \n)))

(provide 'skeletons)
;;; skeletons.el ends here
