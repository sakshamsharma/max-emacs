;;; skeletons.el -- Skeletons for programs
;;; Commentary:

;;; Code:

(eval-after-load 'autoinsert
  '(define-auto-insert
     '("\\.\\(CC?\\|cc\\|cxx\\|cpp\\|c++\\)\\'" . "C++ skeleton")
     '(nil
       "// " (file-name-nondirectory (buffer-file-name)) > \n
       "// Author: Saksham Sharma" \n \n
       "#include <bits/stdc++.h>" \n
       "#define endl '\\n'" \n
       "static const int INF = std::numeric_limits<int>::max();" \n
       "#define tr(c,i) for(typeof((c).begin() i = (c).begin(); i != (c).end(); i++)" \n
       "#define sz(a) int((a).size())" \n
       "#define pb push_back" \n
       "#define all(c) (c).begin(),(c).end()" \n
       "typedef long long int ll;" \n \n
       "#define dout(x)" \n
       "#ifdef DEBUG" \n
       "#undef dout" \n
       "#define dout(x) x" \n
       "#endif" \n \n
       "using namespace std;" \n \n
       "int main() {" \n
       "std::ios::sync_with_stdio(false);" \n
       "// cin.tie(NULL);" \n
       "// cout.tie(NULL);" \n
       > _ \n
       "}" > \n)))

(provide 'skeletons)
;;; skeletons.el ends here
